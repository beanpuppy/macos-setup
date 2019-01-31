#!/bin/bash

if [[ ! -d "~/dotfiles" ]]; then
  git clone https://github.com/beanpuppy/dotfiles.git ~/dotfiles
fi

~/dotfiles/install.sh

# Retore mackup
mackup restore -f
