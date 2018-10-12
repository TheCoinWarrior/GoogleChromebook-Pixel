#!/bin/bash
# pixelsetup.sh
# ----------------------------------------------------
# Installs some standard linux packages
# Install Ansible, Terraform, VisualCode, Slack
#
# License : 
# Author  : TheCoinWarrior (c) 2018
# ---------------------------------------------------- 

# .NOTES 
#   THIS CODE-SAMPLE IS PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED  
#   OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR  
#   FITNESS FOR A PARTICULAR PURPOSE. 
#

clear

echo "
  ------- GOOGLE CHROMEBOOK PIXEL LINUX SETUP ------+
 |                                                  |
 |                                                  |::
 |       Instal and configure few basic packages    |::
 |          on the Chromebook Pixel Linux.          |::
 |                                                  |::
 |        This version 1.0 and NO WARRANTY.         |::
 |                                                  |::
 |                                                  |::
 +------------------------------------------------+::
   ::::::::::::::::::::::::::::::::::::::::::::::::::
"

sleep 5


echo "Run the script in sudo mode ..."

if [[ $UID != 0 ]]; then
    echo "Please run this script with sudo:"
    echo "sudo $0 $*"
    exit 1
fi

echo "Update and upgrade before start install other packages ..."
sudo apt-get update -y
sudo apt-get upgrade -y

# change to Downloads directory
cd ~/Downloads/

sleep 5

echo "Step 1 : Installing dependencies ..."
sudo apt-get install unzip git git-core wget gnupg -y
sudo apt-get install python3 python3-pip -y
sudo apt-get install curl apt-transport-https
sudo apr-get install software-properties-common python-software-properties -y


sleep 5

echo "Step 2 : Installing Terraform ..."
# Install and configure Terraform
# Check for latest release https://releases.hashicorp.com/terraform/
sudo wget https://releases.hashicorp.com/terraform/0.11.8/terraform_0.11.8_linux_amd64.zip
sudo unzip terraform_0.11.18_linux_amd64.zip
sudo mv terraform /usr/local/bin/

sleep 5

echo "Step 3 : Installing Ansible ..."
# Install Ansible 
echo " Installing Ansible ..."
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install ansible

sleep 5

echo "Step 4 : Install Microsoft Visual Code ..."
# Install VisualCode
sudo curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
sudo curl -L https://go.microsoft.com/fwlink/?LinkID=760868 > code.deb
sudo apt-get install libxss1 libasound2 
sudo dpkg -i code.deb
sudo apt --fix-broken install -y
sudo dpkg -i code.deb

sleep 5

echo "Step:5 Install Slack ..."
# Download the latest Slack-*.deb package
# https://slack.com/downloads/instructions/ubuntu
sudo wget https://downloads.slack-edge.com/linux_releases/slack-desktop-3.3.3-amd64.deb
sudo dpkg -i slack-desktop-3.3.3-amd64.deb
# it will fail so this command has to be run to correct the dependancies
sudo apt --fix-broken install -y
sudo dpkg -i slack-desktop-3.3.3-amd64.deb

sleep 5

sudo apt-get update && sudo apt-get upgrade -y

echo "Installation is completed ..."

sleep 5








