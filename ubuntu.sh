#!/usr/bin/env bash

# Inspired by https://github.com/thoughtbot/laptop

# set -e

whereiwas=$(pwd)

# Add PPAs
sudo add-apt-repository -y ppa:git-core/ppa
sudo add-apt-repository -y ppa:chris-lea/node.js
sudo add-apt-repository -y ppa:nginx/stable
sudo add-apt-repository -y ppa:avsm/ppa

sudo apt-get update

# Zsh
sudo apt-get -y install zsh
chsh -s $(which zsh)

sudo apt-get -y install build-essential libssl-dev
sudo apt-get -y install m4 # Possibly to fix the failure to build ocamlfind

# git
sudo apt-get -y install git

# oh-my-zsh
curl -L http://install.ohmyz.sh | zsh

# Mercurial
sudo apt-get -y install mercurial

# Vim
sudo apt-get -y install vim

# Vundle
if [[ ! -d ~/.vim/bundle/Vundle.vim ]]; then
  git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
else
  cd ~/.vim/bundle/Vundle.vim && git pull
  cd "$whereiwas"
fi

# Emacs
sudo apt-get -y install emacs

# ag
sudo apt-get -y install silversearcher-ag

# "Open in Terminal"
sudo apt-get -y install nautilus-open-terminal

# PostgreSQL
sudo apt-get -y install postgresql postgresql-contrib libpq-dev

# Redis
sudo apt-get -y install redis-server

# nginx
sudo apt-get -y install nginx

# Heroku Toolbelt
wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh

# rbenv
if [[ ! -d ~/.rbenv ]]; then
  git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
else
  cd ~/.rbenv && git pull
  cd "$whereiwas"
fi

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# ruby-build
if [[ ! -d ~/.rbenv/plugins/ruby-build ]]; then
  git clone https://github.com/sstephenson/ruby-build.git \
    ~/.rbenv/plugins/ruby-build
else
  cd ~/.rbenv/plugins/ruby-build && git pull
  cd "$whereiwas"
fi

# Ruby
RUBY_VERSION="$(curl -sSL http://ruby.thoughtbot.com/latest)"

rbenv install --skip-existing "$RUBY_VERSION"
rbenv global "$RUBY_VERSION"
rbenv rehash

gem update --system # Update the RubyGems system software

# Bundler
gem install bundler --no-document

# Haskell
sudo apt-get -y install haskell-platform
cabal update

# Darcs
cabal install darcs

# OCaml
OCAML_VERSION=4.01.0

sudo apt-get -y install opam

opam init
opam switch $OCAML_VERSION
eval $(opam config env)

opam install -y core utop

# Node.js
sudo apt-get -y install nodejs

# Java
sudo apt-get -y install default-jdk
sudo apt-get -y install ant

# https://gist.github.com/visenger/5496675

SCALA_VERSION=2.11.2
SBT_VERSION=0.13.5

# Scala
sudo apt-get -y remove scala-library scala

wget http://www.scala-lang.org/files/archive/scala-${SCALA_VERSION}.deb -P /tmp
sudo dpkg -i /tmp/scala-${SCALA_VERSION}.deb

sudo apt-get update
sudo apt-get -y install scala

# sbt
sudo apt-get -y remove sbt

wget http://dl.bintray.com/sbt/debian/sbt-${SBT_VERSION}.deb -P /tmp
sudo dpkg -i /tmp/sbt-${SBT_VERSION}.deb

sudo apt-get update
sudo apt-get -y install sbt

# fzf, requires Ruby
if [[ ! -d ~/.fzf ]]; then
  git clone https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install
else
  cd ~/.fzf && git pull
  cd "$whereiwas"
fi
