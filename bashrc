export JAVA_HOME=`/usr/libexec/java_home`
export SCALA_HOME=$HOME/projects/scala
export MAVEN_HOME=/usr/share/maven
export HOMEBREW_GITHUB_API_TOKEN=***masked***
export SBT_OPTS="-XX:+CMSClassUnloadingEnabled -XX:MaxPermSize=256M"
export FLAGS_GETOPT_CMD="$(brew --prefix gnu-getopt)/bin/getopt"
export CHEF_HOME=/opt/chef
export RUBY_HOME=/usr/local/opt/ruby/bin
export RBENV_ROOT=/usr/local/var/rbenv
export CHEF_DK_HOME=/opt/chefdk
export MAVEN_OPTS="-Xmx3000m"
export SPARK_HOME=$HOME/projects/spark
export HADOOP_HOME=$HOME/projects/hadoop
export GOPATH=/usr/local/opt/go

export PATH=~/bin:$GOPATH/libexec/bin:$SPARK_HOME/bin:$SPARK_HOME/sbin:$SCALA_HOME/bin:$JAVA_HOME/bin:$MAVEN_HOME/bin:$HADOOP_HOME/bin:$CHEF_DK_HOME/bin:$CHEF_DK_HOME/embedded/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:~/sbt/bin:$RUBY_HOME:$PATH

if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

alias fuck='$(thefuck $(fc -ln -1))'
alias FUCK='fuck'
