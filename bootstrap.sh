#!/bin/sh

# todo: add: [ install | upgrade ] option

ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go/install)"

brew doctor
brew update

brew install brew-cask
brew cask upgrade

brew install maven
brew install ant
brew install sbt
grew install gradle
brew install git
brew install git-flow-avh
brew install ruby
brew install python
brew install docker
brew install scala
brew install hadoop
brew install hbase
brew install zookeeper
brew install autoconf
brew install mysql
brew install gnu-getopt
brew install openssl
brew install rpm
brew install wget
brew cask install vagrant
brew cask install virtualbox
brew cask install vagrant-manager
brew cask install chefdk

vagrant plugin install vagrant-omnibus
vagrant plugin install vagrant-berkshelf
vagrant plugin install vagrant-hosts
vagrant plugin install vagrant-cachier
vagrant plugin install vagrant-aws

( mkdir -p ~/projects; cd ~/projects; git clone https://github.com/everpeace/vagrant-mesos.git )
