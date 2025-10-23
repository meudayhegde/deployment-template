#!/bin/bash
set -e

echo "=== Updating system packages ==="
sudo yum update -y
sudo yum upgrade -y

echo "=== Installing Docker ==="
sudo yum install docker containerd git -y

echo "=== Enabling and starting Docker service ==="
sudo systemctl enable docker.service --now

echo "=== Adding current user to docker group ==="
sudo usermod -a -G docker $USER

echo "=== Installing Docker Compose (v2) ==="
sudo curl -L https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) -o /usr/libexec/docker/cli-plugins/docker-compose
sudo chmod +x /usr/libexec/docker/cli-plugins/docker-compose

echo "=== Docker Compose version ==="
/usr/libexec/docker/cli-plugins/docker-compose version || true

echo "=== Verifying Docker installation ==="
docker --version
docker compose version

newgrp docker
echo "=== Setup complete! ==="
echo "You may need to log out and log back in for docker group permissions to take effect."

