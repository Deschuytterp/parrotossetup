#!/bin/bash
echo "########### Change system settings"
sudo bash -c 'cat <<EOF > /etc/default/keyboard
XKBMODEL="pc105"
XKBLAYOUT="be"
XKBVARIANT=""
XKBOPTIONS=""
BACKSPACE="guess"
EOF'
setxkbmap -layout be

echo "########### general update of the system"
# Update and upgrade the system
sudo apt update && sudo apt upgrade -y

echo "########### installing installation dependencies"
#needed for further installation of crackmapexec
#sudo apt install neo4j
#sudo apt install python3-neo4j
sudo apt install pipx

echo "########### installing additional packages"
# Install your preferred packages
PACKAGES=(
  "vim"
  "git"
  "curl"
  "htop"
  "tmux"
  "build-essential"
  #"pipx"
  #"crackmapexec"
  "evil-winrm"
  "netcat-openbsd"
  "BloodHound"
  "seclists"
  "ftp"
  # Add more packages as needed
)

sudo apt install -y "${PACKAGES[@]}"

echo "########### installing Extra tools"
echo "########### installing ssh-audit"
git clone https://github.com/jtesta/ssh-audit.git 

echo "########### installing impacket"
python3 -m pipx install impacket
pipx ensurepath
pipx completions

echo "########### installing CherryTree"
wget https://www.giuspen.net/software/cherrytree_1.1.4-2~Debian12_amd64.deb
sudo apt install ./cherrytree_1.1.4-2~Debian12_amd64.deb

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
echo "#############  install additional stuff for locate"
sudo apt install mlocate
echo "#############  updating database for locate"
sudo updatedb


echo "Setup complete!"
