#!/bin/bash
sudo apt-get update
sudo apt-get install nginx -y
#sudo ufw allow 'Nginx HTTP'

#read -s -p "Enter MySQL Root Password: "  pswd
#echo "mysql-server mysql-server/$pswd password root" | sudo debconf-set-selections
#echo "mysql-server mysql-server/$pswd password root" | sudo debconf-set-selections
sudo -E apt-get install -y -q mysql-server
sudo mysql -sfu root < "mysql_secure_installation.sql"

sudo apt-get install php-fpm php-mysql
sudo sed -i "s/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/" /etc/php/7.0/fpm/php.ini
sudo systemctl restart php7.0-fpm
