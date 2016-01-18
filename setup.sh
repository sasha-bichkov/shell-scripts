#!/bin/sh

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

install() {
  local readonly PACKAGE=$1

  local flag
  local manager=$2

  if [ -z $PACKAGE ]; then
     echo 'Specify package that you want to install'
     exit
  fi

  if [ -z $manager ]; then
    manager='apt-get'
  fi

  case "$manager" in
    apt-get) flag='-y' ;;
    npm    ) flag='-g' ;;
    '*'    ) flag=''   ;;
  esac

  sudo ${manager} install ${PACKAGE} ${flag}
}

install_node() {
  if ! installed nodejs; then
    install nodejs
  fi
}
  
install_npm() {
  if ! installed npm; then
    install npm
  fi
}

install_bower() {
  if ! installed bower; then
    install bower npm
  fi
}

install_gulp() {
  if ! installed gulp; then
    install gulp npm
  fi
}

install_git() {
  if ! installed git; then
    install git
  fi
}

install_curl() {
  if ! installed curl; then
    install curl
  fi
}

install_rbenv() {
  if ! installed rbenv; then
    install git-core zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev
  
    if ! installed git; then intsall git; fi

    cd
    git clone git://github.com/sstephenson/rbenv.git .rbenv
    echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
    echo 'eval "$(rbenv init -)"' >> ~/.bashrc

    git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
    echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
    source ~/.bashrc
  fi
}

install_ruby() {
  local readonly VERSION=$1

  if ! installed rbenv; then  install_rbenv; fi

  rbenv install -v $VERSION
  rbenv global $VERSION
}

install_bundler() {
  if ! installed bundler; then
    install bundler gem
  fi 
}

install_homebrew() {
  if mac && ! installed brew; then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi
}

main() {
  #general
  install_curl
  install_git
  
  #node
  install_node
  install_npm
  
  #frontend
  install_gulp
  install_bower

  #ruby
  install_rbenv
  install_ruby 1.9.3
  install_ruby 2.2.2
}

main