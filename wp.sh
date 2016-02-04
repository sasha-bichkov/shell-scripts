#!/bin/bash

# To install wordpress in destination folder
# use the command: bash wp.sh YOUR-FOLDER-HERE

# You can export a web server directory to ~/.bashrc 
# and use the script like so: bash wp.sh $SERVER/SITENAME

readonly MOVE_TO=$1
readonly DOWNLOAD_FOLDER=~/Documents/
readonly WORDPRESS=${DOWNLOAD_FOLDER}wordpress

cd $DOWNLOAD_FOLDER
wget -P $DOWNLOAD_FOLDER https://wordpress.org/latest.tar.gz
tar -xzvf ${DOWNLOAD_FOLDER}latest.tar.gz
sudo mv $WORDPRESS $MOVE_TO
