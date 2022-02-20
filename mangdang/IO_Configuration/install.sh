#!/bin/sh

sudo cp syscfg.txt config.txt /boot/firmware/

sudo cp 50-gpio.rules /etc/udev/rules.d/
sudo groupadd --system gpio
sudo adduser "$USER" gpio

sudo cp 90-pwm.rules /etc/udev/rules.d/
sudo groupadd --system i2c
sudo adduser "$USER" i2c

sudo cp 50-spi.rules /etc/udev/rules.d/
sudo groupadd --system spi
sudo adduser "$USER" spi

# https://unix.stackexchange.com/questions/39370/how-to-reload-udev-rules-without-reboot
# sudo udevadm control --reload-rules && sudo udevadm trigger
