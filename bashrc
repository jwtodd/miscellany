export JAVA_HOME=`/usr/libexec/java_home -v10`
#export JAVA_HOME=`/usr/libexec/java_home -v1.8`
export HISTCONTROL=ignorespaceS
export FLAGS_GETOPT_CMD="$(brew --prefix gnu-getopt)/bin/getopt"

export PATH=~/bin:${JAVA_HOME}/bin:/usr/local/bin:/usr/local/opt/inetutils/libexec/gnubin:/usr/local/sbin:/usr/bin:~/sbt/bin:${PATH}
export MANPATH=/usr/local/opt/inetutils/libexec/gnuman:${MANPATH}

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

[ ! -f /Applications/Docker.app/Contents/Resources/etc/docker.bash-completion ] && \
  (cd /usr/local/etc/bash_completion.d; \
    ln /Applications/Docker.app./Contents/Resources/etc/docker.bash-completion)

portpid() {
  lsof -n -iTCP:${1} | grep LISTEN
}

pidcwd() {
  lsof -a -d cwd -p ${1}
}

alias drc=`docker rm $(docker ps -a -q)`
alias dri=`docker rmi $(docker images -a -q)`
alias drv=`docker volume prune -f`
alias fuck=''
alias FUCK='fuck'
