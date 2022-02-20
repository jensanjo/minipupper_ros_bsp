#!/bin/bash

# configure network
sudo cp 50-cloud-init.yaml /etc/netplan/
sudo netplan apply

# remove cloud-init
sudo apt purge cloud-init
sudo rm -rf /etc/cloud && sudo rm -rf /var/lib/cloud

# remove snap
sudo systemctl stop snapd
sudo apt purge -y snapd gnome-software-plugin-snap

# disable automatic upgrades
sudo cp 20auto-upgrades /etc/apt/apt.conf.d/

# required to play sound
sudo apt install mpg123 alsa-utils
mkdir ~/Music
cp sound/*mp3 ~/Music


# python tools (also install build-essential)
sudo apt install python3-pip

# must have packages
pip install numpy Pillow 
pip install spidev RPi.GPIO

# nice to have
pip install IPython