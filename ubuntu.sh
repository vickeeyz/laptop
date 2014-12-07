#!/usr/bin/env bash

# Inspired by https://github.com/thoughtbot/laptop

set -e

# In order to have the add-apt-repository command
sudo apt-get update
sudo apt-get -y install software-properties-common

# Add PPAs
# sudo add-apt-repository -y ppa:git-core/ppa
sudo add-apt-repository -y ppa:webupd8team/java
# sudo add-apt-repository -y ppa:chris-lea/node.js
# sudo add-apt-repository -y ppa:nginx/stable
# sudo add-apt-repository -y ppa:avsm/ppa

sudo apt-get update
sudo apt-get -y upgrade

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
# curl -L http://install.ohmyz.sh | sh

# Mercurial
sudo apt-get -y install mercurial

# Vim
sudo apt-get -y install vim

# Vundle
if [[ ! -d ~/.vim/bundle/Vundle.vim ]]; then
  git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
else
  cd ~/.vim/bundle/Vundle.vim && git pull
  cd -
fi

# Required by YouCompleteMe
sudo apt-get -y install cmake python-dev

# Emacs
sudo apt-get -y install emacs

# ag
sudo apt-get -y install silversearcher-ag

# tree
sudo apt-get -y install tree

# PostgreSQL
sudo apt-get -y install postgresql postgresql-contrib libpq-dev

# Redis
sudo apt-get -y install redis-server

# nginx
sudo apt-get -y install nginx

# Apache2
sudo apt-get -y install apache2-utils
  # Provides the `htpasswd` command, which is needed to configure phpPgAdmin

# Heroku Toolbelt
wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh

# Python
sudo apt-get -y install python-setuptools  # Provides easy_install
sudo easy_install hg-git

# rbenv
if [[ ! -d ~/.rbenv ]]; then
  git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
else
  cd ~/.rbenv && git pull
  cd -
fi

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# ruby-build
if [[ ! -d ~/.rbenv/plugins/ruby-build ]]; then
  git clone https://github.com/sstephenson/ruby-build.git \
    ~/.rbenv/plugins/ruby-build
else
  cd ~/.rbenv/plugins/ruby-build && git pull
  cd -
fi

# Ruby
RUBY_VERSION="$(curl -sSL http://ruby.thoughtbot.com/latest)"

# Fix for:
# ~/.rbenv/versions/2.1.4/lib/ruby/2.1.0/irb/completion.rb:9:in `require': cannot load such file -- readline (LoadError)
# See http://vvv.tobiassjosten.net/ruby/readline-in-ruby-with-rbenv/
sudo apt-get -y install libreadline-dev

rbenv install --skip-existing "$RUBY_VERSION"
rbenv global "$RUBY_VERSION"
rbenv rehash

gem update --system # Update the RubyGems system software

# Bundler
gem install bundler --no-document

# fzf, requires Ruby
# fzf depends on the 'curses' gem, which depends on the 'libncurses-dev'
# library. But since Ruby 2.1, curses was removed from Ruby standard library. :(
# https://github.com/junegunn/fzf/wiki/Installing-curses-gem
sudo apt-get -y install libncurses5-dev
if [[ ! -d ~/.fzf ]]; then
  git clone https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install
else
  cd ~/.fzf && git pull
  cd -
fi

# Haskell
sudo apt-get -y install haskell-platform
  # GHC 7.4.1 for Ubuntu 12.04
  # GHC 7.6.3 for Ubuntu 14.04
cabal update

# Install GHC 7.8.3
# https://www.haskell.org/platform/linux.html#binary
wget -P /tmp https://www.haskell.org/platform/download/2014.2.0.0/haskell-platform-2014.2.0.0-unknown-linux-x86_64.tar.gz
cd /
sudo tar xvf /tmp/haskell-platform-2014.2.0.0-unknown-linux-x86_64.tar.gz
sudo /usr/local/haskell/ghc-7.8.3-x86_64/bin/activate-hs
cd -

# Don't ever thinking of installing Cabal packages! They are so brittle...

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
# Install nvm
curl https://raw.githubusercontent.com/creationix/nvm/v0.20.0/install.sh | bash
# Need to source .bashrc to start using nvm
. ~/.bashrc
# This installs node as well as npm
nvm install stable

# PhamtomJS
sudo apt-get -y install phantomjs

# Java
# sudo apt-get -y install default-jdk
sudo apt-get -y install oracle-java7-installer
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

# Erlang
sudo apt-get -y install erlang

# Rust
# http://doc.rust-lang.org/guide.html
curl -s https://static.rust-lang.org/rustup.sh | sudo sh

# LaTeX
sudo apt-get -y install texlive
sudo apt-get -y install texlive-latex-extra  # contains mathastext.sty
sudo apt-get -y install texlive-math-extra   # contains stmaryrd.sty

# Have to use this. Otherwise mathastext.sty can still not be found.
# sudo apt-get -y install texlive-full
# sudo apt-get -y install tex-common texlive-base texlive-latex-recommended
