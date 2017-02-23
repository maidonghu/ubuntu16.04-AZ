#!/bin/bash
read -s -p "Enter Root Password: "  pswd
echo -e "$pswd\n$pswd" | sudo passwd
# passwd

read -s -p "Enter mike's new Password: "  pswd
echo -e "$pswd\n$pswd" | sudo passwd mike
unset pswd

sudo apt update && sudo apt upgrade -y
sudo timedatectl set-timezone America/Vancouver
sudo apt install ntp -y
date
sudo sed -i 's/Port 22/Port 50009/' /etc/ssh/sshd_config
sudo systemctl restart sshd

wget https://raw.githubusercontent.com/maidonghu/ubuntu16.04-AZ/master/makeswap.sh
chmod +x makeswap.sh
./makeswap.sh

echo 'Please logoff and login again with SSH with mike!' 
sleep 5
sudo reboot
