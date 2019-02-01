export JAVA_HOME=/usr/local/share/java/jdk/Contents/Home
#export JAVA_HOME=`/usr/libexec/java_home -v11`
#export JAVA_HOME=`/usr/libexec/java_home -v1.8`
export HISTCONTROL=ignorespaceS
export FLAGS_GETOPT_CMD="$(brew --prefix gnu-getopt)/bin/getopt"

export PATH=~/bin:${JAVA_HOME}/bin:/usr/local/bin:/usr/local/sbin:/usr/local/opt/inetutils/libexec/gnubin:/usr/local/sbin:/usr/bin:~/sbt/bin:${PATH}
export MANPATH=/usr/local/opt/inetutils/libexec/gnuman:${MANPATH}

for f in $(ls /Applications/Docker.app/Contents/Resources/etc/*\.bash-completion); do
  (cd $(brew --prefix)/etc/bash_completion.d; \
    [] || ln -sf ${f})
done

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

if [ -f ${HOME}/.cargo/env ]; then
  . ${HOME}/.cargo/env
fi

portpid() {
  lsof -n -iTCP:${1} | grep LISTEN
}

pidcwd() {
  lsof -a -d cwd -p ${1}
}

alias drc='docker rm $(docker ps -a -q)'
alias dri='docker rmi $(docker images -a -q)'
alias drv='docker volume prune -f'
