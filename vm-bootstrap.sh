#!/usr/bin/env bash
set -ex

# Prepare the machine
sudo apt-get update
sudo apt-get install -y git libapache2-mod-php5 php5-sqlite php5-mcrypt

# Get the source code
if [ ! -d ~/dev/learnzf2 ]; then
   cd ~/dev
   git clone https://github.com/slaff/learnzf2.git
fi

cd ~/dev/learnzf2;
php composer.phar self-update
php composer.phar install

# Configure Apache
sudo ln -sf /etc/php5/conf.d/mcrypt.ini /etc/php5/mods-available
sudo php5enmod mcrypt
sudo a2enmod rewrite
sudo ln -sf ~/dev/learnzf2.vhost.conf /etc/apache2/sites-enabled/000-default.conf
sudo /etc/init.d/apache2 restart




