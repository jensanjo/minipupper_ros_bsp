#!/bin/bash

# setup timezone
sudo rm /etc/localtime && sudo ln -s /usr/share/zoneinfo/Europe/Amsterdam /etc/localtime

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

# useful network tools
sudo apt install net-tools wireless-tools

# ROS Noetic installation

## Setup keys
curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -

## Setup sources list
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

## Installation
## We will use the ROS-Base installation (no GUI tools)
sudo apt update
sudo apt install -y \
	ros-noetic-ros-base \
	ros-noetic-tf \
	ros-noetic-urdf \
	ros-noetic-ecl-threads \
	ros-noetic-robot-state-publisher \
	ros-noetic-robot-localization 

## extra dependencies for build (ldlidar):
sudo apt install libudev-dev
