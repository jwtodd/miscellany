
setopt NO_CASE_GLOB
setopt AUTO_CD
setopt EXTENDED_HISTORY
setopt SHARE_HISTORY
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY
setopt CORRECT
setopt CORRECT_ALL

HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history
SAVEHIST=5000
HISTSIZE=2000

plugins=(kubectl)

source "/usr/local/opt/kube-ps1/share/kube-ps1.sh"
#source <(stern --completion=zsh)
#source <(kubectl completion zsh)

autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'
zstyle ':completion:*' list-suffixes
zstyle ':completion:*' expand prefix suffix

#PS1='$(kube_ps1)'$PS1
PROMPT='%(?.%F{green}√%F{red}.?%?)%f %B$(kube_ps1) %1~%f%b %# '
#RPROMPT='%*'

autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT=\$vcs_info_msg_0_
zstyle ':vcs_info:git:*' formats '%F{240}(%b)%r%f'
zstyle ':vcs_info:*' enable git


alias kctl="kubectl"
alias kctx="kubectx"
alias kns="kubens"
alias drc='docker rm $(docker ps -a -q)'
alias dri='docker rmi $(docker images -a -q)'
alias drdi='docker rmi $(docker images -f "dangling=true" -q)'
alias drv='docker volume prune -f'
alias FUCK='fuck'
alias nvm=nvm.sh
alias igpf='kubectl -n istio-system port-forward $(kubectl -n istio-system get pods -listio=ingressgateway -o=jsonpath="{.items[0].metadata.name}") 15000'
alias iroutes='curl --silent http://localhost:15000/config_dump | jq '\''.configs.routes.dynamic_route_configs[].route_config.virtual_hosts[]| {name: .name, domains: .domains, route: .routes[].match.prefix}'\'''
alias igl='kubectl -n istio-system logs $(kubectl -n istio-system get pods -listio=ingressgateway -o=jsonpath="{.items[0].metadata.name}") --tail=300'
alias ipl='kubectl -n istio-system logs $(kubectl -n istio-system get pods -listio=pilot -o=jsonpath="{.items[0].metadata.name}") discovery --tail=300'
alias -s log="tail -f"

#^[[A' up-line-or-search # up arrow bindkey
#^[[B' down-line-or-search # down arrow 

portpid() {
  lsof -n -iTCP:${1} | grep LISTEN
}

pidcwd() {
  lsof -a -d cwd -p ${1}
}

# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-]=** r:|=**' 'l:|=* r:|=*'
zstyle :compinstall filename '/Users/jwtodd/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
