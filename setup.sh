#!/bin/bash
read -s -p "Enter Root Password: "  pswd
echo -e "$pswd\n$pswd" | sudo passwd
# passwd
adduser --disabled-password --gecos "" mike
read -s -p "Enter mike's new Password: "  pswd
echo -e "$pswd\n$pswd" | sudo passwd mike
unset pswd

echo export GOPATH=$HOME/gocode | sudo tee -a ./.profile
echo PATH=$PATH:$HOME/gocode/bin | sudo tee -a ./.profile

sudo apt update && sudo apt upgrade -y
sudo timedatectl set-timezone America/Vancouver
sudo apt install ntp -y
date
sudo sed -i 's/Port 22/Port 50009/' /etc/ssh/sshd_config
sudo ufw allow 50009/tcp
sudo systemctl restart sshd

echo -e "y\r" | sudo ufw enable
sudo ufw logging on
sudo ufw logging medium

wget https://raw.githubusercontent.com/maidonghu/ubuntu16.04-AZ/master/makeswap.sh
chmod +x makeswap.sh
./makeswap.sh

echo 'Please logoff and login again with SSH with mike!' 
sleep 5
sudo reboot
