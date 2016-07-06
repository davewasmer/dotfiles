brew update
brew cask

brew tap homebrew/versions

# Install more recent versions of some OS X tools.
brew install vim --override-system-vi
brew install homebrew/dupes/grep
brew install homebrew/dupes/openssh
brew install homebrew/dupes/screen

brew install curl
brew install direnv
brew install editorconfig
brew install git
brew install heroku-toolbelt
brew install hub
brew install neovim
brew install python
brew install python3
brew install the_silver_searcher
brew install tree
brew install watchman
brew install z

brew cask install iterm2
brew cask install dropbox
brew cask install google-chrome
brew cask install things
brew cask install dockertoolbox
brew cask install spectacle
brew cask install recordit
brew cask install slack
brew cask install sketch
brew cask install dash
brew cask install evernote
brew cask install arq
brew cask install flowdock
brew cask install spotify

# Install python neovim package
pip2 install neovim

# Remove outdated versions from the cellar.
brew cleanup
