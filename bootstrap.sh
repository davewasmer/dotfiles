#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

# Make sure we are up to date
git pull origin master;

# Symlink dotfiles
for i in .*; do
  if [ "$i" != ".git" && "$i" != "." && "$i" != ".." ]; then
    ln -s $PWD/$i ~/$i
  fi
done
ln -s bin ~/bin

# Brew install
brew tap Homebrew/bundle
brew bundle

# Initial OS X setup
read -p "Is this a fresh Mac install? (y/n) " -n 1;
echo "";
if [[ $REPLY =~ ^[Yy]$ ]]; then
	bash init/.osx
fi;
