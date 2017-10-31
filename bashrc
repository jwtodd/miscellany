export JAVA_HOME=`/usr/libexec/java_home`
export SCALA_HOME=$HOME/projects/scala
export MAVEN_HOME=/usr/share/maven
export HOMEBREW_GITHUB_API_TOKEN=***masked***
export SBT_OPTS="-XX:+CMSClassUnloadingEnabled -XX:MaxPermSize=256M"
export FLAGS_GETOPT_CMD="$(brew --prefix gnu-getopt)/bin/getopt"
export RUBY_HOME=/usr/local/opt/ruby/bin
export RBENV_ROOT=/usr/local/var/rbenv
export MAVEN_OPTS="-Xmx3000m"
export SPARK_HOME=$HOME/projects/spark
export HADOOP_HOME=$HOME/projects/hadoop
export GOPATH=/usr/local/opt/go/libexec/bin

export PATH=~/bin:$GOPATH/libexec/bin:$SPARK_HOME/bin:$SPARK_HOME/sbin:$SCALA_HOME/bin:$JAVA_HOME/bin:$MAVEN_HOME/bin:$HADOOP_HOME/bin:/usr/local/sbin:/usr/bin:~/sbt/bin:$RUBY_HOME:$PATH

for f in docker.bash-completion docker-machine.bash-completion docker-compose.bash-completion; do
  (cd /usr/local/etc/bash_completion.d; \
    [ ! -f /Applications/Docker.app/Contents/Resources/etc/$f ] && ln /Applications/Docker.app/Contents/Resources/etc/$f)
done

if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

portpid() {
  lsof -n -iTCP:${1} | grep LISTEN
}

pidcwd() {
  lsof -a -d cwd -p ${1}
}

alias tz='tar -czvf'
alias tb='tar -cjvf'
alias utz='tar -xzvf'
alias drc='docker rm $(docker ps -a -q)'
alias dri='docker rmi $(docker images -q)'
alias drv='docker volume rm `docker volume ls -q -f dangling=true`'
alias fuck='$(thefuck $(fc -ln -1))'
alias FUCK='fuck'
