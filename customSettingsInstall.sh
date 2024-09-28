#!/bin/bash

echo "########### general update of the system"

# Update and upgrade the system
sudo apt update && sudo apt upgrade -y

echo "########### installing installation dependencies"
#needed for further installation of crackmapexec
sudo apt install neo4j
sudo apt install python3-neo4j

echo "########### installing additional packages"
# Install your preferred packages
PACKAGES=(
  "vim"
  "git"
  "curl"
  "htop"
  "tmux"
  "build-essential"
  "pipx"
  "crackmapexec"
  "evil-winrm"
  "BloodHound"
  # Add more packages as needed
)

sudo apt install -y "${PACKAGES[@]}"

echo "########### installing impacket"
python3 -m pipx install impacket
pipx ensurepath
pipx completions


echo "########### removing obsolete stuff"
sudo apt autoremove

# Copy configuration files
#cp /path/to/your/dotfiles/.bashrc ~/.bashrc
#"cp /path/to/your/dotfiles/.vimrc ~/.vimrc
#"cp /path/to/your/dotfiles/.tmux.conf ~/.tmux.conf

# Set up git
git config --global user.name "Pieter"
git config --global user.email "pieter.deschuytter@telenet.be"

# Custom aliases and environment variables
#echo "alias ll='ls -lah'" >> ~/.bashrc
#echo "export PATH=\$PATH:/custom/path" >> ~/.bashrc

# Start and enable services
#sudo systemctl enable ssh
#sudo systemctl start ssh

# Other system settings (Example: setting up display resolution)
#xrandr --output Virtual1 --mode 1920x1080

# Source the .bashrc to apply changes
#source ~/.bashrc

# Any other custom commands
# ...
echo "install additional stuff for locate"
sudo apt install mlocate

echo "Setup complete!"
