#!/bin/sh

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

beers="\xF0\x9F\x8D\xBA \xF0\x9F\x8D\xBA \xF0\x9F\x8D\xBA"

brew doctor

taps=("caskroom/cask" "caskroom/versions" "AdoptOpenJDK/openjdk")
sh_formulas=("bash" "bash-completion" "tree" "grep")
make_formulas=("autoconf" "automake" "libtool" "gnu-getopt" "shellcheck")
security_formulas=("openssl" "gpg" "https://raw.githubusercontent.com/kadwanev/bigboybrew/master/Library/Formula/sshpass.rb" "libjwt")
security_casks=("keybase")
web_formulas=("wget" "markdown")
web_casks=("google-chrome" "brave" "tor-browser")
aws_formulas=("awscli")
gcp_casks=("google-cloud-sdk")
package_formulas=("rpm")
repository_formulas=("git" "hub" "git-flow-avh" "git-subrepo" "subversion" "mercurial")
repository_casks=("sourcetree")
build_formulas=("maven" "ant" "sbt" "gradle")
language_formulas=("ruby" "python" "scala" "go" "rust" "groovy" "jvmtop")
#language_casks=("java" "java8" )
language_casks=("java" "adoptopenjdk" "adoptopenjdk8" "adoptopenjdk10" "adoptopenjdk11")
#container_formulas=("docker" "docker-completion")
container_formulas=("docker-completion")
container_casks=("docker")
cassandra_formulas=("cassandra")
hadoop_formulas=("hadoop" "hbase" "zookeeper")
spark_formulas=("apache-spark")
rdbms_formulas=("mysql")
graph_formulas=("titan-server")
ide_casks=("pycharm-ce" "intellij-idea-ce" "visualvm" "rubymine" "atom")
devops_formulas=("packer" "consul" "terraform" "nomad" "serf" "vault" "ansible" "saltstack" "nmap" "graphviz")
devops_casks=("vagrant" "vagrant-manager")
communications_casks=("slack" "skype" "limechat" "hipchat")
misc_formulas=("jq" "watch")
misc_casks=("coolterm" "tunnelblick" "tftpserver")
x11_casks=("xquartz")
formulas_with_default_names=("gnu-sed" "unzip")
file_casks=("ticktick" "the-unarchiver" "etcher")
command_line=("coreutils" "binutils" "inetutils" "arp-scan" "iproute2mac" "expect" "tmux-xpanes" "pidof")
utilities=("homebrew/cask/visual-studio-code")
credential_casks=("keybase")

for formula in "${sh_formulas[@]}" "${make_formulas[@]}" "${security_formulas[@]}" "${web_formulas[@]}" "${aws_formulaas[@]}" "${package_formulas[@]}" "${repository_formulas[@]}" "${build_formulas[@]}" "${language_formulas[@]}" "${cassandra_formulas[@]}" "${hadoop_formulas[@]}" "${spark_formulas[@]}" "${rdbms_formulas[@]}" "${graph_formulas[@]}" "${devops_formulas[@]}" "${misc_formulas[@]}" "${command_line[@]}" "${utilities[@]}"; do
  echo "$beers : brewing formula: $formula"
  brew install $formula; brew upgrade $formula
  echo "$beers : brewed formula: $formula"
done

for formula in "${formulas_with_default_names[@]}"; do
  echo "$beers : brewing formula: $formula"
  brew install $formula --with-default-names; brew upgrade $formula
  echo "$beers : brewed formula: $formula"
done

for tap in "${taps[@]}"; do
  brew tap $tap
done

for cask in "${security_casks[@]}" "${web_casks[@]}" "${language_casks[@]}" "${container_casks[@]}" "${ide_casks[@]}" "${gcp_casks[@]}" "${devops_casks[@]}" "${repository_casks[@]}" "${communications_casks[@]}" "${misc_casks[@]}" "${x11_casks[@[}" "${credential_casks[@]}"; do
  echo "$beers : brewing cask: $cask"
  brew cask install $cask; brew cask reinstall $cask
  echo "$beers : brewing cask: $cask"
done

brew link --overwrite saltstack

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
