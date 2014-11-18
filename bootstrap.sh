#!/bin/sh

# todo: add: [ install | upgrade ] option

ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go/install)"

brew doctor
brew update && brew upgrade

brew install brew-cask
brew cask update

brew install autoconf
brew install gnu-getopt
brew install openssl
brew install rpm
brew install wget
brew install git
brew install git-flow-avh
brew install maven
brew install ant
brew install sbt
grew install gradle
brew install ruby
brew install python
brew install scala
brew install go
brew cask install java
brew install docker
brew install hadoop
brew install hbase
brew install zookeeper
brew install mysql
brew cask install pycharm
brew cask install intellij-idea
brew cask install vagrant
brew cask install virtualbox
brew cask install vagrant-manager
brew cask install chefdk

brew linkapps

vagrant plugin install vagrant-omnibus
vagrant plugin install vagrant-berkshelf
vagrant plugin install vagrant-hosts
vagrant plugin install vagrant-cachier
vagrant plugin install vagrant-aws

( mkdir -p ~/projects; cd ~/projects; git clone https://github.com/everpeace/vagrant-mesos.git )
( mkdir -p ~/projects; cd ~/projects; git clone https://github.com/vangj/vagrant-hadoop-2.4.1-spark-1.0.1 )
