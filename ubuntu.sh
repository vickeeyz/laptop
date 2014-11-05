#!/usr/bin/env bash

# Inspired by https://github.com/thoughtbot/laptop

set -e

whereiwas=$(pwd)

# In order to have the add-apt-repository command
# sudo apt-get update
# sudo apt-get -y install software-properties-common
# For Ubuntu 12.04 LTS
# sudo apt-get -y install python-software-properties

# Add PPAs
# sudo add-apt-repository -y ppa:git-core/ppa
# sudo add-apt-repository -y ppa:chris-lea/node.js
# sudo add-apt-repository -y ppa:nginx/stable
# sudo add-apt-repository -y ppa:avsm/ppa

sudo apt-get update

# Zsh
sudo apt-get -y install zsh
chsh -s $(which zsh)

sudo apt-get -y install build-essential libssl-dev
sudo apt-get -y install m4 # Possibly to fix the failure to build ocamlfind

# git
sudo apt-get -y install git

# oh-my-zsh, requires git
#
# TODO: Temporarily commented out, because the following two lines throw an error.
# rm -rf ~/.oh-my-zsh
# curl -L http://install.ohmyz.sh | zsh

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

# Required by YouCompleteMe
sudo apt-get -y install cmake python-dev

# Emacs
sudo apt-get -y install emacs

# ag
sudo apt-get -y install silversearcher-ag

# PostgreSQL
sudo apt-get -y install postgresql postgresql-contrib libpq-dev

# Redis
sudo apt-get -y install redis-server

# nginx
sudo apt-get -y install nginx

# Heroku Toolbelt
wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh

# Python
sudo apt-get -y install python-setuptools  # Provides easy_install

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

# fzf, requires Ruby
if [[ ! -d ~/.fzf ]]; then
  git clone https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install
else
  cd ~/.fzf && git pull
  cd "$whereiwas"
fi

# Haskell
sudo apt-get -y install haskell-platform
cabal update

cabal install ghc-mod
# cabal install darcs
  # Failed with GHC 7.6.3

# OCaml
# read -e -p "Heads up! About to install OCaml. Press Enter to continue."

# OCAML_VERSION=4.02.1

# sudo apt-get -y install opam

# opam init
# opam switch $OCAML_VERSION
# eval $(opam config env)

# opam install -y core utop

# Coq
sudo apt-get -y install coq proofgeneral

# Node.js
sudo apt-get -y install nodejs

# Java
sudo apt-get -y install default-jdk
sudo apt-get -y install ant

# https://gist.github.com/visenger/5496675

SCALA_VERSION=2.11.4
SBT_VERSION=0.13.5

# Scala
wget http://www.scala-lang.org/files/archive/scala-${SCALA_VERSION}.deb -P /tmp
sudo dpkg -i /tmp/scala-${SCALA_VERSION}.deb

sudo apt-get update
sudo apt-get -y install scala

# sbt
wget http://dl.bintray.com/sbt/debian/sbt-${SBT_VERSION}.deb -P /tmp
sudo dpkg -i /tmp/sbt-${SBT_VERSION}.deb

sudo apt-get update
sudo apt-get -y install sbt

# Rust
# http://doc.rust-lang.org/guide.html
curl -s https://static.rust-lang.org/rustup.sh | sudo sh

# LaTeX

# sudo apt-get -y install texlive
# sudo apt-get -y install texlive-latex-extra  # contains mathastext.sty
# sudo apt-get -y install texlive-math-extra   # contains stmaryrd.sty

# Have to use this. Otherwise mathastext.sty can still not be found.
sudo apt-get -y install texlive-full
