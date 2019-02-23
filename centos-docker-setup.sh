#!/bin/bash

sudo yum install -y vim git tmux
wget https://raw.githubusercontent.com/carvey/vim-setup/master/vim-setup
. vim-setup
cd ~

echo "set -g mouse-mode on" > ~/.tmux.conf
echo "set -g mouse-select-pane on" >> ~/.tmux.conf
echo "set -g mouse-resize-pane on" >> ~/.tmux.conf

sudo yum install -y yum-utils device-mapper-persistent-data lvm2
sudo yum install -y docker-ce docker-ce-cli containerd.io

sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

sudo groupadd docker
sudo usermod -aG docker $USER

sudo systemctl start docker
sudo systemctl enable docker

sudo curl -L "https://github.com/docker/compose/releases/download/1.23.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version

