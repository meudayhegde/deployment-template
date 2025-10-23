#!/bin/bash
set -e

echo "=== Updating system packages ==="
sudo dnf update -y
sudo dnf upgrade -y

sudo dnf -y install dnf-plugins-core

sudo dnf config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo sed -i 's/$releasever/9/g' /etc/yum.repos.d/docker-ce.repo


echo "=== Installing Docker ==="
sudo dnf -y install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

echo "=== Enabling and starting Docker service ==="
sudo systemctl enable docker.service --now

echo "=== Adding current user to docker group ==="
sudo usermod -a -G docker $USER

echo "=== Verifying Docker installation ==="
docker --version
docker compose version

newgrp docker
echo "=== Setup complete! ==="
echo "You may need to log out and log back in for docker group permissions to take effect."

