#!/bin/sh

# todo: add: [ install | upgrade ] option

ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go/install)"

brew doctor
brew update && brew upgrade


brew tap caskroom/cask
brew install brew-cask

#brew update && brew cask update && brew upgrade brew-cask && brew cleanup && brew cask cleanup
brew update && brew upgrade brew-cask && brew cleanup && brew cask cleanup

brew install autoconf
brew install automake
brew install libtool
brew install gnu-getopt
brew install openssl
brew install rpm
brew install wget
brew install git
brew install git-flow-avh
brew install subversion
brew install maven
brew install ant
brew install sbt
grew install gradle
brew install ruby
brew install python
brew install scala
brew install go
brew insall mercurial
brew cask install java
brew cask install caskroom/versions/java7
brew install docker
brew install hadoop
brew install apache-spark
brew install hbase
brew install zookeeper
brew install mysql
brew install titan-server
brew cask install pycharm-ce
brew cask install intellij-idea-ce
# ?brew install atlas?
brew cask install visualvm
brew cask install vagrant
brew cask install virtualbox
brew cask install vagrant-manager
brew cask install otto
brew install packer
brew cask install serf
brew install consul
brew install terraform
brew cask install vault
brew cask install chefdk
brew cask install google-chrome
brew cask install dockertoolbox
brew install ansible

brew linkapps

vagrant plugin install vagrant-omnibus
vagrant plugin install vagrant-ohai
vagrant plugin install vagrant-berkshelf
vagrant plugin install vagrant-hosts
vagrant plugin install vagrant-cachier
vagrant plugin install vagrant-aws

( mkdir -p ~/projects; cd ~/projects; git clone https://github.com/everpeace/vagrant-mesos.git )
( mkdir -p ~/projects; cd ~/projects; git clone https://github.com/vangj/vagrant-hadoop-2.4.1-spark-1.0.1 )

#go get code.google.com/p/go.tools/cmd/godoc

gem install fpm

sudo pip install scalr

sudo pip install thefuck
sudo pip install thefuck --upgrade

cat << EOF >> ~/.bash_profile
alias fuck='$(thefuck $(fc -ln -1))'
alias FUCK='fuck'
EOF
