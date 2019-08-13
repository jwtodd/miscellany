export JAVA_HOME=/Library/Java/JavaVirtualMachines/adoptopenjdk-11.0.2.jdk/Contents/Home
export DOCKER_HOME=/Applications/Docker.app/Contents/Resources
export HISTCONTROL=ignorespaceS
export GO_HOME=~/go
export ISTIO_HOME=~/projects/istio-1.2.2
export NVM_DIR=/usr/local/opt/nvm

export PATH=~/bin:${JAVA_HOME}/bin:${DOCKER_HOME}/bin:${GO_HOME}/bin:${ISTIO_HOME}/bin:${NVM_DIR}:${HOME}/.cargo/bin:/usr/local/bin:/usr/local/sbin:/usr/local/opt/inetutils/libexec/gnubin:/usr/local/sbin:/usr/bin:~/sbt/bin:${PATH}
export MANPATH=/usr/local/opt/inetutils/libexec/gnuman:${MANPATH}

export FLAGS_GETOPT_CMD="$(brew --prefix gnu-getopt)/bin/getopt"

for f in \
  $(brew --prefix)/etc/bash_completion \
  /usr/local/etc/profile.d/bash_completion.sh \
  ${ISTIO_HOME}/tools/istioctl.bash \
  ~/projects/git-subrepo/.rc \
  ${HOME}/.cargo/env \
  ${NVM_DIR}/etc/bash_completion; do
  if [ -f ${f} ]; then
    . ${f}
  fi
done

for t in kubectl helm eksctl; do
  source <(${t} completion bash)
done

for f in \
  ${DOCKER_HOME}/etc/docker-compose.bash-completion \
  ${DOCKER_HOME}/etc/docker-machine.bash-completion \
  ${DOCKER_HOME}/etc/docker.bash-completion; do
  if [ -f ${f} ]; then
    fn=$(basename $f)
    ft=$(brew --prefix)/etc/bash_completion.d/${fn%.*}
    [ -f ${ft} ] && rm -rf ${ft}
    ln -s ${f} ${ft}
  fi
done

for f in $(ls ${DOCKER_HOME}/etc/*\.bash-completion); do
  (cd $(brew --prefix)/etc/bash_completion.d; \
    ln -sf ${f})
done

portpid() {
  lsof -n -iTCP:${1} | grep LISTEN
}

pidcwd() {
  lsof -a -d cwd -p ${1}
}

alias drc='docker rm $(docker ps -a -q)'
alias dri='docker rmi $(docker images -a -q)'
alias drv='docker volume prune -f'

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
