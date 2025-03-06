#!/bin/bash

# Exit on error
set -e

echo "Updating system packages..."
sudo dnf update -y

echo "Installing Python and pip..."
sudo dnf install -y python3 python3-pip

echo "Installing Ansible..."
python3 -m pip install ansible

echo "Creating ansible user..."
if id "ansible" &>/dev/null; then
    echo "User 'ansible' already exists."
else
    sudo useradd -m -s /bin/bash ansible
    echo "User 'ansible' created."
fi

echo "Verifying Ansible installation..."
ansible --version

echo "Ansible setup completed successfully."
