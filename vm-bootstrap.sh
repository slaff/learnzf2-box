#!/usr/bin/env bash
set -ex

# Prepare the machine
sudo apt-get update
sudo apt-get install -y git \
		   libcurl4-openssl-dev \
                   libmcrypt-dev \
                   libxml2-dev \
                   libjpeg-dev \
                   libfreetype6-dev \
                   libmysqlclient-dev \
                   libt1-dev \
                   libgmp-dev \
                   libpspell-dev \
                   libicu-dev \
                   librecode-dev \
		   apache2

# Install PHP7 from Zend
cd /tmp
wget -N http://repos.zend.com/zend-server/early-access/php7/php-7.0-latest-DEB-x86_64.tar.gz
sudo tar xvzPf php-7.0-latest-DEB-x86_64.tar.gz
sudo cp /usr/local/php7/libphp7.so /usr/lib/apache2/modules/
sudo cp /usr/local/php7/php7.load /etc/apache2/mods-available/
if [ ! -e "/etc/apache2/mods-available/php7.conf" ]; then 
   echo "<FilesMatch \.php$>
SetHandler application/x-httpd-php
</FilesMatch>"  | sudo tee /etc/apache2/mods-available/php7.conf >/dev/null
fi 
sudo ln -sf /usr/local/php7/bin/php /usr/local/bin/php

# Get the source code
if [ ! -d ~/dev/learnzf2 ]; then
   cd ~/dev
   git clone https://github.com/slaff/learnzf2.git
fi

cd ~/dev/learnzf2;
php composer.phar self-update
php composer.phar install

# Configure Apache
sudo a2dismod mpm_event
sudo a2enmod mpm_prefork
sudo a2enmod rewrite
sudo a2enmod php7

sudo ln -sf ~/dev/learnzf2.vhost.conf /etc/apache2/sites-enabled/000-default.conf
sudo /etc/init.d/apache2 restart




