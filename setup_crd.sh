#!/bin/bash

# Exit script if any command fails
set -e

echo "=== Chrome Remote Desktop Setup Script ==="
echo ""

# Step 1: Update system packages
echo "Updating system packages..."
sudo apt update
sudo apt upgrade -y

# Step 2: Install Chrome Remote Desktop service
echo "Installing Chrome Remote Desktop..."
wget https://dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb
sudo apt-get install --assume-yes ./chrome-remote-desktop_current_amd64.deb

# Step 3: Install Xfce desktop environment (minimal)
echo "Installing minimal Xfce desktop environment..."
sudo DEBIAN_FRONTEND=noninteractive apt install --assume-yes xfce4 desktop-base xfce4-terminal

# Step 4: Configure Chrome Remote Desktop to use Xfce
echo "Configuring Chrome Remote Desktop to use Xfce..."
sudo bash -c 'echo "exec /etc/X11/Xsession /usr/bin/xfce4-session" > /etc/chrome-remote-desktop-session'

# Step 5: Install Google Chrome
echo "Installing Google Chrome..."
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install --assume-yes ./google-chrome-stable_current_amd64.deb

# Step 6: Instructions for starting Chrome Remote Desktop
echo ""
echo "=== Chrome Remote Desktop Setup Complete ==="
echo ""
echo "To complete setup, you need to:"
echo "1. Visit https://remotedesktop.google.com/headless"
echo "2. Click 'Begin' and authenticate with your Google account"
echo "3. Click 'Next' and 'Authorize'"
echo "4. Copy the command that appears and run it on this machine"
echo "5. Set a PIN for the remote access"
echo ""
echo "After that, you can access this computer via https://remotedesktop.google.com"