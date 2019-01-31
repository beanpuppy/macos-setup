#!/bin/bash

if test ! $(which brew); then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update Homebrew recipes
brew update
brew upgrade

brew tap homebrew/bundle
brew install mas

printf "Please log into the Mac App Store\n"
open -a '/Applications/App Store.app'
until (mas account > /dev/null); do
  sleep 3
done

brew bundle # See Brewfile
brew cleanup
