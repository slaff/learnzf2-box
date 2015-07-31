#!/bin/sh

sudo apt-get install -y git \
		   libcurl4-openssl-dev \
                   libmcrypt-dev \
                   libxml2-dev \
                   libjpeg62-dev \
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
OLD=`wget -N http://repos.zend.com/zend-server/early-access/php7/php-7.0-latest-DEB-x86_64.tar.gz 2>&1 | grep 'no newer than local file'` || :
if [ -z "$OLD" ]; then
  sudo tar xvzPf php-7.0-latest-DEB-x86_64.tar.gz
  sudo cp /usr/local/php7/libphp7.so /usr/lib/apache2/modules/
  sudo cp /usr/local/php7/php7.load /etc/apache2/mods-available/
fi
if [ ! -e "/etc/apache2/mods-available/php7.conf" ]; then 
   echo "<FilesMatch \.php$>
SetHandler application/x-httpd-php
</FilesMatch>"  | sudo tee /etc/apache2/mods-available/php7.conf >/dev/null
fi 
sudo ln -sf /usr/local/php7/bin/php /usr/local/bin/php

# Configure Apache
sudo a2dismod mpm_event
sudo a2enmod mpm_prefork
sudo a2enmod php7
