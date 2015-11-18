#!/bin/sh

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

beers="\xF0\x9F\x8D\xBA \xF0\x9F\x8D\xBA \xF0\x9F\x8D\xBA"

#brew doctor
#brew update && brew upgrade
#brew tap caskroom/cask
#brew install brew-cask
#brew update && brew upgrade brew-cask && brew cleanup && brew cask cleanup

make_formulas=('autoconf' 'automake' 'libtool' 'gnu-getopt')
security_formulas=('openssl')
web_formulas=('wget')
web_casks=('google-chrome')
package_formulas=('rpm')
repository_formulas=('git' 'git-flow-avh' 'subversion' 'mercurial')
repository_casks=('sourcetree')
build_formulas=('maven' 'ant' 'sbt' 'gradle')
language_formulas=('ruby' 'python' 'scala' 'go')
language_casks=('java' 'caskroom/versions/java7')
container_formulas=('docker' 'docker-compose' 'docker-machine' 'docker-swarm')
container_casks=('virtualbox' 'dockertoolbox')
hadoop_formulas=('hadoop' 'hbase' 'zookeeper')
spark_formulas=('apache-spark')
rdbms_formulas=('mysql')
graph_formulas=('titan-server')
ide_casks=('pycharm-ce' 'intellij-idea-ce' 'visualvm' 'rubymine' 'atom')
devops_formulas=('packer' 'consul' 'terraform' 'ansible' 'saltstack')
# todo: hashi:atlas
devops_casks=('vagrant' 'otto' 'nomad' 'serf' 'vault' 'vagrant-manager' 'chefdk')
communications_casks=('skype' 'limechat' 'hipchat')
miscellaneous_casks=('caffeine')

for formula in ${make_formulas[@]} ${security_formulas[@]} ${web_formulas[@]} ${package_formulas[@]} ${repository_formulas[@]} ${build_formulas[@]} ${language_formulas[@]} ${container_formulas[@]} ${hadoop_formulas[@]} ${spark_formulas[@]} ${rdbms_formulas[@]} ${graph_formulas[@]} ${devops_formulas[@]}; do
  echo "$beers : brewing formula: $formula"
  brew install $formula; brew upgrade $formula
  echo "$beers : brewed formula: $formula"
done

for cask in ${web_casks[@]} ${language_casks[@]} ${container_casks[@]} ${ide_casks[@]} ${devops_casks[@]} ${repository_casks[@]) ${communications_casks[@]}; do
  echo "$beers : brewing cask: $cask"
  brew cask install $cask; brew cask update $cask
  echo "$beers : brewing cask: $cask"
done

brew linkapps
brew link --overwrite saltstack

vagrant_plugins=('omnibus' 'ohai' 'berkshelf' 'hosts' 'cachier' 'aws')

for vagrant_plugin in ${vagrant_plugins[@]}; do
  echo "$beers : vagranting plugin: $vagrant_plugin"
  vagrant plugin install vagrant-$vagrant_plugin
  vagrant plugin update vagrant-$vagrant_plugin
  echo "$beers : vagranted plugin: $vagrant_plugin"
done

( mkdir -p ~/projects; cd ~/projects; git clone https://github.com/everpeace/vagrant-mesos.git )
( mkdir -p ~/projects; cd ~/projects; git clone https://github.com/vangj/vagrant-hadoop-2.4.1-spark-1.0.1 )

#go get code.google.com/p/go.tools/cmd/godoc

gem install fpm

sudo pip install thefuck
sudo pip install thefuck --upgrade

cat << EOF >> ~/.bashrc
alias fuck='$(thefuck $(fc -ln -1))'
alias FUCK='fuck'
EOF
