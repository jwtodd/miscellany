#!/bin/sh

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

beers="\xF0\x9F\x8D\xBA \xF0\x9F\x8D\xBA \xF0\x9F\x8D\xBA"

brew doctor
brew bundle

#vagrant_plugins=('omnibus' 'ohai' 'berkshelf' 'hosts' 'cachier' 'aws')

#for vagrant_plugin in "${vagrant_plugins[@]}"; do
#  echo "$beers : vagranting plugin: $vagrant_plugin"
#  vagrant plugin install vagrant-$vagrant_plugin
#  vagrant plugin update vagrant-$vagrant_plugin
#  echo "$beers : vagranted plugin: $vagrant_plugin"
#done

#( mkdir -p ~/projects; cd ~/projects; git clone https://github.com/everpeace/vagrant-mesos.git )
#( mkdir -p ~/projects; cd ~/projects; git clone https://github.com/vangj/vagrant-hadoop-2.4.1-spark-1.0.1 )

#go get code.google.com/p/go.tools/cmd/godoc

gem install fpm
gem install travis
gem install iStats

sudo pip install thefuck
sudo pip install thefuck --upgrade
sudo pip install -i https://pypi.python.org/simple  python-derrick

cat << EOF >> ~/.bashrc
alias fuck='$(thefuck $(fc -ln -1))'
alias FUCK='fuck'
EOF
