#!/bin/bash
read -s -p "Enter Root Password: "  pswd
echo -e "$pswd\n$pswd" | passwd
# passwd
adduser --disabled-password --gecos "" mike
read -s -p "Enter mike's new Password: "  pswd
echo -e "$pswd\n$pswd" | passwd mike
unset pswd
adduser mike sudo
su - mike
mkdir ~/.ssh
chmod 700 ~/.ssh
touch ./.ssh/authorized_keys
exit
cat ./.ssh/authorized_keys | tee -a /home/mike/.ssh/authorized_keys
su - mike
chmod 600 ~/.ssh/authorized_keys
echo export GOPATH=$HOME/gocode | sudo tee -a ./.profile
echo PATH=$PATH:$HOME/gocode/bin | sudo tee -a ./.profile
exit

apt update && apt upgrade -y
timedatectl set-timezone America/Vancouver
apt install ntp -y
date
sed -i 's/Port 22/Port 50009/' /etc/ssh/sshd_config
systemctl restart sshd
ufw allow 50009/tcp
ufw allow 6800/tcp
echo -e "y\r" | ufw enable
ufw logging on
ufw logging medium
mkfs.ext4 -F /dev/disk/by-id/scsi-0DO_Volume_volume-nyc1-01
mkdir -p /mnt/volume-nyc1-01
mount -o discard,defaults /dev/disk/by-id/scsi-0DO_Volume_volume-nyc1-01 /mnt/volume-nyc1-01
echo /dev/disk/by-id/scsi-0DO_Volume_volume-nyc1-01 /mnt/volume-nyc1-01 ext4 defaults,nofail,discard 0 0 | sudo tee -a /etc/fstab
wget https://raw.githubusercontent.com/maidonghu/ubuntu16.04-DO/master/makeswap.sh
chmod +x makeswap.sh
./makeswap.sh

echo 'Please logoff and login again with SSH with mike!' 
sleep 5
reboot
