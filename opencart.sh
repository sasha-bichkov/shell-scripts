#!/bin/bash

# To install opencart in destination folder
# use the command: bash opencart.sh YOUR-FOLDER-HERE OPENCART-VERSION

# You can export a web server directory to ~/.bashrc 
# and use the script like so: bash opencart.sh $SERVER/SITENAME 1.5.6.4

# Here you can find all releases of opencart
# https://github.com/opencart/opencart/releases

readonly MOVE_TO=$1
readonly VERSION=$2

installed() {
  hash "$1" 2>/dev/null
}

main() {
  local readonly DOWNLOAD_FOLDER=~/Documents/

  if [ -z $VERSION ]; then
    version=1.5.6.4
  else
    version=$VERSION
  fi

  local readonly ARCHIVE=${version}.zip
  local readonly OPENCART=opencart-${version}

  cd $DOWNLOAD_FOLDER
  wget -P $DOWNLOAD_FOLDER https://github.com/opencart/opencart/archive/${ARCHIVE}

  if ! installed unzip; then
    sudo apt-get install unzip -y
  fi

  unzip ${ARCHIVE}
  sudo mv $OPENCART $MOVE_TO
}

main