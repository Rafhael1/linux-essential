#!/bin/bash
sudo dnf update -y 
sudo dnf upgrade -y 

echo "Installing Node.js"
sudo dnf module install nodejs:16

echo -e "Installed Node.js \U2705"

echo "Installing Yarn"
sudo npm install --global yarn
echo "Installed Yarn \U2705"

echo "Installing Nestjs CLI"
sudo npm install -g @nestjs/cli
echo "Installed Nest CLI \U2705"

echo "Installing VSCODE"
sudo dnf install code
echo "Installed VSCODE \U2705"

echo "Installing Typescript"
npm install -g typescript
echo "Installed Typescript \U2705"

echo "Installing Signal"
wget -O- https://updates.signal.org/desktop/apt/keys.asc | gpg --dearmor > signal-desktop-keyring.gpg
cat signal-desktop-keyring.gpg | sudo tee -a /usr/share/keyrings/signal-desktop-keyring.gpg > /dev/null
echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/signal-desktop-keyring.gpg] https://updates.signal.org/desktop/apt xenial main' |\
  sudo tee -a /etc/apt/sources.list.d/signal-xenial.list
sudo apt update && sudo apt install signal-desktop
echo "Installed Signal \U2705"

echo "Installing Brave Browser"
sudo dnf install dnf-plugins-core
sudo dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/x86_64/
sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc
sudo dnf install brave-browser
echo "Installed Brave \U2705"

echo "Installing Docker..."
 sudo dnf -y install dnf-plugins-core
 sudo dnf config-manager \
    --add-repo \
    https://download.docker.com/linux/fedora/docker-ce.repo
sudo dnf install docker-ce docker-ce-cli containerd.io
sudo systemctl start docker
sudo docker run hello-world
echo "Installed Docker \U2705"

echo "Installing Stacer"
wget https://github.com/oguzhaninan/Stacer/releases/download/v1.0.7/stacer-1.0.7.rpm
sudo rpm --install stacer-1.0.7.rpm
stacer
echo "Installed Stacer \U2705"
