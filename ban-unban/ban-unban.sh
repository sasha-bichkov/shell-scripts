#!/bin/bash

declare -a blacklist=(
  gmail.com
  vk.com
  facebook.com
  mail.ru
  twitter.com
)

ban() {
  for site in ${blacklist[*]}
  do
    echo "127.0.0.1 $site" >> /etc/hosts
  done
}

unban() {
  for site in ${blacklist[*]}
  do
    sed -i "/127.0.0.1 $site/d" 1.txt 
  done
}

main() {
  local readonly BAN_TIME="08:00:00"
  local readonly UNBAN_TIME="14:00:00"

  local readonly CURRENT_TIME=$(date +"%T")

  if [[ $CURRENT_TIME > $BAN_TIME ]]; then
    ban
  fi

  if [[ $CURRENT_TIME < $UNBAN_TIME ]]; then
    unban
  fi
}

main
