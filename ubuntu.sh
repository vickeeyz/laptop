#!/usr/bin/env bash

# Inspired by https://github.com/thoughtbot/laptop

set -e

# Add PPAs
sudo add-apt-repository -y ppa:git-core/ppa
sudo add-apt-repository -y ppa:chris-lea/node.js
sudo add-apt-repository -y ppa:nginx/stable

# Heroku Toolbelt
sudo echo "deb http://toolbelt.heroku.com/ubuntu ./" > /etc/apt/sources.list.d/heroku.list
wget -O- https://toolbelt.heroku.com/apt/release.key | sudo apt-key add -

sudo apt-get update

# Zsh
sudo apt-get -y install zsh
chsh -s $(which zsh)

sudo apt-get -y install build-essential libssl-dev

# git
sudo apt-get -y install git

# oh-my-zsh
curl -L http://install.ohmyz.sh | sh

# Mercurial
sudo apt-get -y install mercurial

# ag
sudo apt-get -y install silversearcher-ag

# PostgreSQL
sudo apt-get -y install postgresql postgresql-contrib libpq-dev

# Redis
sudo apt-get -y install redis-server

# nginx
sudo apt-get -y install nginx

# Heroku Toolbelt
sudo apt-get install -y heroku-toolbelt

# rbenv
if [[ ! -d ~/.rbenv ]]; then
  git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
else
  cd ~/.rbenv && git pull
fi

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# ruby-build
if [[ ! -d ~/.rbenv/plugins/ruby-build ]]; then
  git clone https://github.com/sstephenson/ruby-build.git \
    ~/.rbenv/plugins/ruby-build
else
  cd ~/.rbenv/plugins/ruby-build && git pull
fi

# Ruby
ruby_version="$(curl -sSL http://ruby.thoughtbot.com/latest)"

rbenv install --skip-existing "$ruby_version"
rbenv global "$ruby_version"
rbenv rehash

gem update --system # Update the RubyGems system software

# Bundler
gem install bundler --no-document

# Haskell
sudo apt-get -y install haskell-platform
cabal update

# Node.js
sudo apt-get -y install nodejs

# Java
sudo apt-get -y install default-jdk
sudo apt-get -y install ant
