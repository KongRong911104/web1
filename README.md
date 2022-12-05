Ubuntu 為 Ubuntu 20.04
====================
sudo apt update && sudo apt install apache2  
sudo apt install php7.4 libapache2-mod-php7.4 php7.4-mysql php-common php7.4-cli php7.4-common php7.4-json php7.4-opcache php7.4-readline php7.4-gd  
sudo a2enmod php7.4  
sudo apt-get install openssh-server  
sudo ufw allow OpenSSH  
sudo ufw allow in "Apache Full"  
sudo ufw enable  
如果看到「Command may disrupt existing ssh connections. Proceed with operation (y|n)?」，請按 y  
sudo nano /etc/apache2/apache2.conf  
按 CTRL + W 並蒐索 <Directory /var/www/>  
Options Indexes FollowSymLinks 改成 Options FollowSymLinks  
AllowOverride None 將它更改為 AllowOverride All  
保存並退出（按 CTRL + X，按 Y，然後按 ENTER）  
重啟 Apache  
sudo systemctl restart apache2  
在/var/www/中找到html資料夾將它刪除後貼上給的html資料夾  
依照自訂的資料庫匯入給的web.sql  
回到/var/www/html/中  
找到database.php  
開啟並設定資料庫資訊  
  
完成！！
