#!/bin/sh

cask_apps="vagrant virtualbox vagrant-manager chefdk"
vagrant_plugins="omnibus ohai berkshelf hosts cachier aws"

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

sudo xcodebuild -license
brew doctor
brew update && brew upgrade

brew tap caskroom/cask
brew install brew-cask

for app in $cask_apps; do
  brew cask install $app
done

for plugin in $vagrant_plugins; do
  vagrant plugin list | grep -q $plugin

  if [ $? != 0 ]; then
    vagrant plugin install vagrant-$plugin
  else
    echo "Plugin vagrant-$plugin already installed, skipping it. Use 'upgrade' to update it."
  fi
done

brew update && brew upgrade brew-cask && brew cask update && brew cask cleanup && brew cleanup 

for plugin in $vagrant_plugins; do
  vagrant plugin update vagrant-$plugin
done

brew linkapps  
