#!/bin/bash
echo -e "\r" | sudo add-apt-repository ppa:jonathonf/ffmpeg-3
sudo apt update && sudo apt install ffmpeg aria2 -y
wget https://raw.githubusercontent.com/maidonghu/myconf/master/aria2_1.31.0-1_amd64.deb
sudo dpkg -i aria2_1.31.0-1_amd64.deb
cd /mnt
sudo mkdir -p Downloads
cd Downloads
sudo touch aria2.log
sudo touch aria2.session
cd ~
wget https://raw.githubusercontent.com/maidonghu/ubuntu16.04-AZ/master/aria2.conf
sudo mv aria2.conf /usr/local/etc/aria2.conf
sudo aria2c --conf-path=/usr/local/etc/aria2.conf

#git clone https://github.com/aria2/aria2.git
#apt install libgnutls-dev nettle-dev libgmp-dev libssh2-1-dev libc-ares-dev libxml2-dev zlib1g-dev libsqlite3-dev pkg-config
#apt install libcppunit-dev autoconf automake autotools-dev autopoint libtool
#cd aria2/
#autoreconf -i
#./configure
#make -j8
#checkinstall
#make install
#make clean
#make distclean
#cd ..

sudo apt install megatools -y

sudo apt install golang-go -y
sudo go get github.com/prasmussen/gdrive
wget https://raw.githubusercontent.com/maidonghu/myconf/master/token_v2.json
sudo mkdir .gdrive
sudo mv token_v2.json ./.gdrive/token_v2.json
