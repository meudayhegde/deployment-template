#!/bin/bash

# Replace environment variables in Nginx config
envsubst '$DOMAIN' < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf

# Start Nginx
nginx -g "daemon off;"