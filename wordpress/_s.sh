#!/bin/bash

# About _s (underscores)
# ----------------------
#
# Hi. I'm a starter theme called _s, or underscores, if you like. 
# I'm a theme meant for hacking so don't use me as a Parent Theme. 
# Instead try turning me into the next, most awesome, WordPress theme out there. 
# That's what I'm here for. http://underscores.me/
#

readonly MOVE_TO=$1
readonly DOWNLOAD_FOLDER=~/Documents/
readonly UNDERSCORE=${DOWNLOAD_FOLDER}_s-master

installed() {
  hash "$1" 2>/dev/null
}

main() {
  local readonly ARCHIVE=${UNDERSCORE}.zip

  cd $DOWNLOAD_FOLDER
  wget -P $DOWNLOAD_FOLDER https://codeload.github.com/Automattic/_s/zip/master
  mv ${DOWNLOAD_FOLDER}master ${DOWNLOAD_FOLDER}_s-master.zip

  if ! installed unzip; then
    sudo apt-get install unzip -y
  fi

  unzip ${UNDERSCORE}
  sudo mv $UNDERSCORE $MOVE_TO
}

main