#!/bin/bash
read -s -p "Enter Root Password: "  pswd
echo -e "$pswd\n$pswd" | sudo passwd
# passwd
sudo apt update && sudo apt upgrade -y
sudo timedatectl set-timezone America/Vancouver
sudo apt install ntp -y
date
sudo sed -i 's/Port 22/Port 50009/' /etc/ssh/sshd_config
sudo systemctl restart sshd
#ufw allow 50009/tcp
#ufw allow 6800/tcp
#echo -e "y\r" | ufw enable
#ufw logging on
#ufw logging medium
#mkfs.ext4 -F /dev/disk/by-id/scsi-0DO_Volume_volume-nyc1-01
#mkdir -p /mnt/volume-nyc1-01
#mount -o discard,defaults /dev/disk/by-id/scsi-0DO_Volume_volume-nyc1-01 /mnt/volume-nyc1-01
#echo /dev/disk/by-id/scsi-0DO_Volume_volume-nyc1-01 /mnt/volume-nyc1-01 ext4 defaults,nofail,discard 0 0 | sudo tee -a /etc/fstab
#wget https://raw.githubusercontent.com/maidonghu/ubuntu16.04-DO/master/makeswap.sh
#chmod +x makeswap.sh
#./makeswap.sh
echo export GOPATH=$HOME/gocode | sudo tee -a ./.profile
echo PATH="$GOPATH/bin:$PATH" | sudo tee -a ./.profile
echo 'Please logoff and login again with SSH!' 
sudo reboot
