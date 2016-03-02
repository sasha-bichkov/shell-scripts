#!/bin/bash

# sudo bash ban.sh $site

readonly SITE=$1

main() {
  echo "127.0.0.1 $SITE" >> /etc/hosts
}

main