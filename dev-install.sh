#!/bin/bash

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Install Docker Engine
if command_exists docker; then
    echo "Docker is already installed in the system."
else
    echo "Installing Docker..."
    sudo apt-get update
    sudo apt-get install -y docker.io
    sudo systemctl start docker
    sudo systemctl enable docker
    sudo usermod -aG docker $USER
fi

# Install Docker Compose
if command_exists docker-compose; then
    echo "Docker compose is already installed in the system."
else
    echo "Installing Docker Compose..."
    sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
fi

# Install Git
if command_exists git; then
    echo "Git is already installed in the system."
else
    echo "Installing Git..."
    sudo apt-get update
    sudo apt-get install -y git

    # Configure Git with user input
    read -p "Enter your full name for Git configuration: " full_name
    git config --global user.name "$full_name"
    
    read -p "Enter your email address for Git configuration: " email_address
    git config --global user.email "$email_address"
fi

# Install DupeGuru
if command_exists dupeguru; then
    echo "DupeGuru is already installed in the system."
else
    echo "Installing DupeGuru..."
    wget https://download.hardcoded.net/dupeguru_4.0.4_Ubuntu_20.04.deb -O dupeguru.deb
    sudo apt-get install -y ./dupeguru.deb
    rm dupeguru.deb
fi

echo "Installation script completed."