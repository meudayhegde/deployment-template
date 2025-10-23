#!/bin/bash
set -e

echo "=== Updating system packages ==="
sudo dnf update -y
sudo dnf upgrade -y

echo "=== Installing Python 3 ==="
sudo dnf install -y python3 python3-pip
python3 --version
pip3 --version

echo "=== Installing Docker ==="
sudo dnf install -y docker

echo "=== Enabling and starting Docker service ==="
sudo systemctl enable docker
sudo systemctl start docker

echo "=== Adding current user to docker group ==="
sudo usermod -aG docker $USER

echo "=== Installing Docker Compose (v2) ==="
DOCKER_CONFIG=${DOCKER_CONFIG:-$HOME/.docker}
mkdir -p $DOCKER_CONFIG/cli-plugins

ARCH=$(uname -m)
sudo curl -SL https://github.com/docker/compose/releases/latest/download/docker-compose-linux-$ARCH \
    -o $DOCKER_CONFIG/cli-plugins/docker-compose

sudo chmod +x $DOCKER_CONFIG/cli-plugins/docker-compose

echo "=== Docker Compose version ==="
$DOCKER_CONFIG/cli-plugins/docker-compose version || true

echo "=== Verifying Docker installation ==="
docker --version
docker compose version

echo "=== Setup complete! ==="
echo "You may need to log out and log back in for docker group permissions to take effect."

