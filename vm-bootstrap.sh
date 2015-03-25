#!/usr/bin/env bash
set -ex

# Prepare the machine
sudo apt-get update
sudo apt-get install -y git libapache2-mod-php5 php5-sqlite

# Get the source code
if [ ! -d ~/dev/learnzf2 ]; then
   cd ~/dev
   git clone https://github.com/slaff/learnzf2.git
   # @todo: set permissions
fi

cd ~/dev/learnzf2;
php composer.phar self-update
php composer.phar install

# set vhosts
sudo perl -pi -e 's/\tDocumentRoot (\/var\/www\/html)/\t#DocumentRoot $1\n\tDocumentRoot \/home\/vagrant\/dev\/learnzf2\/public /g' \
     /etc/apache2/sites-enabled/000-default.conf

sudo /etc/init.d/apache2 restart




