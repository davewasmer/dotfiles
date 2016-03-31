#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

# Make sure we are up to date
git pull origin master;

# Symlink dotfiles
GLOBIGNORE=.:..:.git
for i in .*; do
  ln -s $PWD/$i ~/$i
done
ln -s bin ~/bin

# Initial OS X setup
read -p "Is this a fresh Mac install? (y/n) " -n 1;
echo "";
if [[ $REPLY =~ ^[Yy]$ ]]; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	bash init/.osx
fi;

# Brew install
./homebrew.sh
