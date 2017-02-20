#!/bin/bash
swapon --show
free -h
df -h
read -p "Please input how many G will be used as swap file: " swhg
fallocate -l "$swhg"G /swapfile
ls -lh /swapfile
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile
swapon --show
free -h
echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab
sysctl vm.swappiness=20
sysctl vm.vfs_cache_pressure=50
echo 'vm.swappiness=20' | tee -a /etc/sysctl.conf
echo 'vm.vfs_cache_pressure=50' | tee -a /etc/sysctl.conf
