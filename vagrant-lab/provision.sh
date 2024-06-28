#!/usr/bin/env bash

echo "Starting provision"

echo "Updating packages"
sudo apt-get update -qq -y &>/dev/null
echo "Successfully updated packages"

echo "Installing apache"
sudo apt-get install -qq -y apache2 &>/dev/null
echo "Successfully installed apache"

cp -r /vagrant/html/* /var/www/html/
echo "Successfully copied html files"

echo "Starting apache" 
sudo service apache2 start