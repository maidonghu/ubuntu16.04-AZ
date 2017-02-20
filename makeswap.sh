#!/bin/bash
swapon --show
free -h
df -h
read -p "Please input how many G will be used as swap file: " swhg
sudo fallocate -l "$swhg"G /swapfile
ls -lh /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
swapon --show
free -h
echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab
sudo sysctl vm.swappiness=20
sudo sysctl vm.vfs_cache_pressure=50
echo 'vm.swappiness=20' | sudo tee -a /etc/sysctl.conf
echo 'vm.vfs_cache_pressure=50' | sudo tee -a /etc/sysctl.conf
