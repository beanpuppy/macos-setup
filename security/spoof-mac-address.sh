#!/bin/bash

# Note: MAC addresses will reset to hardware defaults on each boot.
sudo ifconfig en0 ether "$(openssl rand -hex 6 | sed 's%\(..\)%\1:%g; s%.$%%')"
