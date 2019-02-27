#!/bin/bash

# MacOS Security
# Make sure this is run as sudo

# iOS, The Future Of macOS, Freedom, Security And Privacy In An Increasingly Hostile Global Environment:
# https://gist.github.com/iosecure/357e724811fe04167332ef54e736670d

# Change localhost and computer name
scutil --set ComputerName MacBook
scutil --set LocalHostName MacBook

# Application Level Firewall
/usr/libexec/ApplicationFirewall/socketfilterfw --setglobalstate on  # Turn firewall on
/usr/libexec/ApplicationFirewall/socketfilterfw --setloggingmode on  # Enable logging
/usr/libexec/ApplicationFirewall/socketfilterfw --setstealthmode on  # Enable stealth mode

# MalwareDomainList.com Hosts File
curl -o /etc/hosts https://www.malwaredomainlist.com/hostslist/hosts.txt
# create cron job to update every week
crontab -l | { cat; echo "0 12 * * 4 curl -o /etc/hosts https://www.malwaredomainlist.com/hostslist/hosts.txt"; } | crontab -

# Captive Portal
# When macOS connects to new networks, it checks for Internet connectivity and may launch a Captive Portal assistant utility application.

# An attacker could trigger the utility and direct a Mac to a site with malware without user interaction, so it's best to disable this feature
# and log in to captive portals using your regular Web browser by navigating to a non-secure HTTP page and accepting a redirect to the captive
# portal login interface (after disabling any custom proxy or DNS settings).
defaults write /Library/Preferences/SystemConfiguration/com.apple.captive.control.plist Active -bool false

# Show all filename extensions (so that "Evil.jpg.app" cannot masquerade easily).
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Disable Bonjour multicast advertisements
defaults write /Library/Preferences/com.apple.mDNSResponder.plist NoMulticastAdvertisements -bool YES

# Set custom umask
launchctl config user umask 077

# Expose hidden files and Library folder in Finder
defaults write com.apple.finder AppleShowAllFiles -bool true
chflags nohidden ~/Library

# Set screen to lock as soon as screensaver starts
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# Clear and lock the Siri analytics database
rm -rfv ~/Library/Assistant/SiriAnalytics.db
chmod -R 000 ~/Library/Assistant/SiriAnalytics.db
chflags -R uchg ~/Library/Assistant/SiriAnalytics.db
