su -
apt update && sudo apt install apache2
apt install php7.4 libapache2-mod-php7.4 php7.4-mysql php-common php7.4-cli php7.4-common php7.4-json php7.4-opcache php7.4-readline php7.4-gd
a2enmod php7.4
apt-get install openssh-server
ufw allow OpenSSH
ufw allow in "Apache Full"
ufw enable -y
sed -i 's/<Directory /var/www/>\nOptions index FollowSymLinks\nAllowOverride None/<Directory /var/www/>\nOptions FollowSymLinks\nAllowOverride All/g' /etc/apache2/apache2.conf
systemctl restart apache2
