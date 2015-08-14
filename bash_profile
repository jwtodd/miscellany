export JAVA_HOME=`/usr/libexec/java_home`
export SCALA_HOME=$HOME/projects/scala
export MAVEN_HOME=/usr/share/maven
export HOMEBREW_GITHUB_API_TOKEN=***
export SBT_OPTS="-XX:+CMSClassUnloadingEnabled -XX:MaxPermSize=256M"
export FLAGS_GETOPT_CMD="$(brew --prefix gnu-getopt)/bin/getopt"
export CHEF_HOME=/opt/chef
export RUBY_HOME=/usr/local/opt/ruby/bin
export RBENV_ROOT=/usr/local/var/rbenv
export CHEF_DK_HOME=/opt/chefdk
export MAVEN_OPTS="-Xmx3000m"
export SPARK_HOME=$HOME/projects/spark
export HADOOP_HOME=$HOME/projects/hadoop
export GO_PATH=/usr/local/opt/go

export PATH=~/bin:$SPARK_HOME/bin:$SPARK_HOME/sbin:$SCALA_HOME/bin:$JAVA_HOME/bin:$MAVEN_HOME/bin:$HADOOP_HOME/bin:/usr/local/bin:/usr/bin:/Users/jtodd1/tools/sbt/bin:$RUBY_HOME:$PATH

bp=`brew --prefix`
bcp="$bp/etc/bash_completion.d"

for f in `ls $bcp`; do
  . $bcp/$f
done

alias fuck='$(thefuck $(fc -ln -1))'
alias FUCK='fuck'
