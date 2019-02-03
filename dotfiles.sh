#!/bin/bash

curl https://raw.githubusercontent.com/beanpuppy/dotfiles/master/ninstall.sh | /bin/bash

# Retore mackup
mackup restore -f
