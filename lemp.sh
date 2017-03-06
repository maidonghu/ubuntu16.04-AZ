#!/bin/bash
sudo touch /etc/apt/sources.list.d/nginx.list
echo "deb http://nginx.org/packages/ubuntu/ xenial nginx" | sudo tee -a /etc/apt/sources.list.d/nginx.list
echo "deb-src http://nginx.org/packages/ubuntu/ xenial nginx" | sudo tee -a /etc/apt/sources.list.d/nginx.list

sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys ABF5BD827BD9BF62
sudo apt-get update
sudo apt-get install nginx -y
#sudo ufw allow 'Nginx HTTP'

#read -s -p "Enter MySQL Root Password: "  pswd
#echo "mysql-server mysql-server/$pswd password root" | sudo debconf-set-selections
#echo "mysql-server mysql-server/$pswd password root" | sudo debconf-set-selections
export DEBIAN_FRONTEND=noninteractive
sudo -E apt-get install -y -q mysql-server
sudo mysql -sfu root < "mysql_secure_installation.sql"
rm -f mysql_secure_installation.sql

sudo apt-get install -y php-fpm php-mysql
sudo sed -i "s/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/" /etc/php/7.0/fpm/php.ini
sudo systemctl restart php7.0-fpm

sudo wget -O /etc/nginx/sites-available/default https://raw.githubusercontent.com/maidonghu/ubuntu16.04-AZ/master/nginx.conf
