sudo update-alternatives --set php /usr/bin/php$2

sudo a2dismod php$1

sudo a2enmod php$2

sudo service apache2 restart
