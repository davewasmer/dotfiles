brew update
brew cask

brew tap homebrew/versions

# Install more recent versions of some OS X tools.
brew install vim --override-system-vi
brew install homebrew/dupes/grep
brew install homebrew/dupes/openssh
brew install homebrew/dupes/screen

brew install the_silver_searcher
brew install git
brew install hub
brew install tree
brew install watchman
brew install neovim
brew install z

brew cask install iterm2
brew cask install dropbox
brew cask install google-chrome
brew cask install things
brew cask install dockertoolbox
brew cask install spectacle
brew cask install fantastical
brew cask install recordit
brew cask install slack
brew cask install sketch
brew cask install dash
brew cask install evernote

# Remove outdated versions from the cellar.
brew cleanup
