#!/bin/bash

# Clone the repository
git clone https://github.com/rodhfr/ytdlp-for-jellyfin.git
cd ytdlp-for-jellyfin

# Install pip
sudo apt install -y python3-pip

# Install required packages from requirements.txt
pip3 install -r requirements.txt

# Create a "scripts" directory in the user's home folder
mkdir -p ~/scripts

# Copy ytdlp_functions.sh to the "scripts" directory
cp ytdlp_functions.sh ~/scripts/
sudo chmod +x ~/scripts/ytdlp_functions.sh

# Append the contents of appendtobashrc.txt to .bashrc
cat appendtobashrc.txt >> ~/.bashrc
source ~/.bashrc

echo "Setup completed successfully!"
