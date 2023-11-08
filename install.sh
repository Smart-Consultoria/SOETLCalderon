sudo dnf install epel-release
sudo dnf install httpd
sudo firewall-cmd --permanent --add-service=http
sudo firewall-cmd --add-port=8000/tcp
sudo firewall-cmd --reload
sudo dnf module enable php
sudo dnf install php php-cli php-common
php -v
sudo chmod 775 /var/www/html/
sudo echo "<?php echo 'Instalación exitosa';?>" > /var/www/html/index.php
sudo systemctl enable httpd
sudo systemctl start httpd
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('sha384', 'composer-setup.php') === 'e21205b207c3ff031906575712edab6f13eb0b361f2085f1f1237b7126d785e826a450292b6cfd1d64d92e6563bbde02') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"
sudo mv composer.phar /usr/local/bin/composer
composer -v
cd /var/www/html/
composer create-project laravel/laravel calderon-etl
cd calderon-etl
php artisan serve –host==0.0.0.0