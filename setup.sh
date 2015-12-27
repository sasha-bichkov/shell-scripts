#!/bin/bash

readonly SYSTEM=$(uname -s)

linux() {
  [[ $SYSTEM == 'Linux' ]]
}

mac() {
  [[ $SYSTEM == 'Darwin' ]]
}

installed() {
  hash "$1" 2>/dev/null
}

install_node() {

}

install_bower() {

}

install_gulp() {

}

install_ruby() {

}

install_jdk() {

}

install_android_sdk() {

}

install_bundler() {
  if ! installed bundle; then
    sudo gem install bundler
  fi
}

install_homebrew() {
  if mac && ! installed brew; then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi
}

main() {

}

main