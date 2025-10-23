#!/bin/sh

# Define your domain and email
DOMAIN=${DOMAIN:-"template.com"}
EMAIL=${EMAIL:-"template@test.com"}
WEBROOT_PATH="/var/www/certbot"

# Ensure necessary folders exist
mkdir -p /etc/letsencrypt /var/www/certbot

# Check if certificate already exists
if [ ! -f "/etc/letsencrypt/live/$DOMAIN/fullchain.pem" ]; then
    echo "Requesting Let's Encrypt certificate for $DOMAIN..."
    certbot certonly --webroot -w $WEBROOT_PATH \
        --email $EMAIL --agree-tos --no-eff-email \
        -d $DOMAIN 
        # -d www.$DOMAIN
else
    echo "Certificate already exists. Skipping request."
fi

# Auto-renewal every 12 hours
echo "Starting automatic renewal process..."
while true; do
    certbot renew --quiet
    echo "Reloading Nginx after SSL renewal..."
    # Signal Nginx container to reload configuration
    wget -qO- --post-data="" http://nginx-ssl-reverse-proxy:80/reload 2>/dev/null || true
    sleep 12h
done