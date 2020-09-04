#!/bin/bash

apt-get update
apt-get install net-tools dos2unix curl git unzip -y
apt-get install apache2 -y
apt-get install php libapache2-mod-php php-mysql php-cli php-mbstring php-bz2 php-zip php-xdebug php-curl php-xml php-dom php-simplexml php-gd -y
apt-get install mariadb-server -y

curl -sL https://deb.nodesource.com/setup_12.x | bash -
apt-get install -y nodejs

curl -sS https://getcomposer.org/installer -o composer-setup.php
php composer-setup.php --install-dir=/usr/local/bin --filename=composer

openssl req -newkey rsa:2048 -nodes -days 3650 -x509 -subj "/E=sam@astroid/C=GB/S=Oxfordshire/L=Hook Norton/O=Dev/CN=astroid" -keyout /etc/ssl/private/apache-selfsigned.key -out /etc/ssl/certs/apache-selfsigned.crt

sed -i 's/ssl-cert-snakeoil.pem/apache-selfsigned.crt/g' /etc/apache2/sites-available/default-ssl.conf
sed -i 's/ssl-cert-snakeoil.key/apache-selfsigned.key/g' /etc/apache2/sites-available/default-ssl.conf

sed -i 's/ServerTokens OS/ServerTokens Prod/g'
sed -i 's/ServerSignature On/#ServerSignature On/g'
sed -i 's/#ServerSignature Off/ServerSignature Off/g'

a2enmod ssl
a2enmod headers
a2enmod rewrite
a2ensite default-ssl.conf
systemctl restart apache2

ufw --force enable
ufw allow 22
ufw allow 80
ufw allow 443
ufw reload

touch /var/www/html/links.html
echo '<p><a href="//astroid/phpMyAdmin/"><img src="/phpMyAdmin/favicon.ico" style="vertical-align:middle;padding-right:1em;">phpMyAdmin</a></p>' >> /var/www/html/links.html
sed -i '/DocumentRoot \/var\/www\/html/r /media/share/config/apacheDirectoryConfig.txt' /etc/apache2/sites-available/000-default.conf
sed -i '/DocumentRoot \/var\/www\/html/r /media/share/config/apacheDirectoryConfig.txt' /etc/apache2/sites-available/default-ssl.conf
systemctl restart apache2

mysqladmin password "root"
echo "DELETE FROM mysql.user WHERE User='';" | mysql -uroot
echo "DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');" | mysql -uroot
echo "FLUSH PRIVILEGES;" | mysql -uroot

wget https://files.phpmyadmin.net/phpMyAdmin/5.0.2/phpMyAdmin-5.0.2-all-languages.zip
unzip phpMyAdmin-5.0.2-all-languages.zip -d /var/www/html
mv /var/www/html/phpMyAdmin-5.0.2-all-languages/ /var/www/html/phpMyAdmin
cp /media/share/config/config.inc.php /var/www/html/phpMyAdmin
mkdir /var/www/html/phpMyAdmin/tmp
chmod 775 /var/www/html/phpMyAdmin/tmp/
chown -R root:www-data /var/www/html
rm phpMyAdmin-5.0.2-all-languages.zip
rm /var/www/html/index.html

fallocate -l 1G /swapfile
dd if=/dev/zero of=/swapfile bs=1024 count=1048576
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile
echo "/swapfile swap swap defaults 0 0" >> /etc/fstab
