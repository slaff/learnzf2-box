#!/usr/bin/env bash
set -ex

PHP_VERSION="$1"

# Prepare the machine
sudo apt-get update

if [ "$PHP_VERSION" == "7" ]; then
   source /vagrant/provision/php7.sh
else
   source /vagrant/provision/php5.sh
fi

# Common Apache settings
sudo a2enmod rewrite

# Get the source code
if [ ! -d ~/dev/learnzf2 ]; then
   cd ~/dev
   git clone https://github.com/slaff/learnzf2.git
fi

cd ~/dev/learnzf2;
php composer.phar self-update
php composer.phar install

sudo ln -sf ~/dev/learnzf2.vhost.conf /etc/apache2/sites-enabled/000-default.conf
sudo /etc/init.d/apache2 restart



