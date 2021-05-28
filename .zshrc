# If you come from bash you might have to change your $PATH.

export GO_HOME=${HOME}/go
export GOPATH=${HOME}/projects/go
export NVM_DIR=${HOME}/.nvm
export YARN_DIR=${HOME}/.yarn
export YARN=${HOME}/.yarn
export NODE=${NVM_DIR}/versions/node/v12.14.1
export KREW_ROOT=${HOME}/.krew
export AWS_PROFILE=lacuna
export AWS_DEFAULT_REGION=us-west-2
#export AWS_DEFAULT_REGION=us-east-2
export VS_CODE_HOME=/Applications/Visual\ Studio\ Code.app/Contents/Resources/app

# export PATH=$HOME/bin:/usr/local/bin:$PATH

export PATH=.:~/bin:${GO_HOME}/bin:${GOPATH}/bin:${KREW_ROOT}/bin:${HOME}/.cargo/bin:${NVM_DIR}:${YARN_DIR}/bin:${HOME}/.config/yarn/global/node_modules/.bin:${NODE}/bin:$(brew --prefix)/bin:$(brew --prefix)/sbin:/usr/local/opt/inetutils/libexec/gnubin:${VS_CODE_HOME}/bin:/usr/local/sbin:/usr/bin:${PATH}

# Path to your oh-my-zsh installation.
export ZSH="/Users/jwtodd/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="robbyrussell"
ZSH_THEME="awesomepanda"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  dotenv
  osx
  kubectl
  kube-ps1
  docker
  rust
  tmux
  sudo
)

source $ZSH/oh-my-zsh.sh

# User configuration

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

autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT=\$vcs_info_msg_0_
zstyle ':vcs_info:git:*' formats '%F{240}(%b)%r%f'
zstyle ':vcs_info:*' enable git

gcloud=/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk

. <(kubectl completion zsh)
. <(helm completion zsh)
. <(eksctl completion zsh)
. ${gcloud}/path.zsh.inc
. ${gcloud}/completion.zsh.inc

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

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
alias python=python3.8
alias pip=pip3
#alias cat='bat -pp --theme="Nord"'
alias cat='bat -pp --theme="Dracula"'
alias awsl='AWS_ACCESS_KEY_ID=test AWS_SECRET_ACCESS_KEY=test aws --region us-west-2 --endpoint-url=http://localhost:4566'

# git-diff-so-fancy [ https://github.com/so-fancy/diff-so-fancy ]
git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"
git config --global color.ui true
git config --global color.diff-highlight.oldNormal    "red bold"
git config --global color.diff-highlight.oldHighlight "red bold 52"
git config --global color.diff-highlight.newNormal    "green bold"
git config --global color.diff-highlight.newHighlight "green bold 22"
git config --global color.diff.meta       "11"
git config --global color.diff.frag       "magenta bold"
git config --global color.diff.commit     "yellow bold"
git config --global color.diff.old        "red bold"
git config --global color.diff.new        "green bold"
git config --global color.diff.whitespace "red reverse"
git config --bool --global diff-so-fancy.markEmptyLines false
git config --bool --global diff-so-fancy.changeHunkIndicators false
git config --bool --global diff-so-fancy.stripLeadingSymbols false
git config --bool --global diff-so-fancy.useUnicodeRuler false
git config --global diff-so-fancy.rulerWidth 47    # git log's commit header width

jdk() {
  version=$1
  export JAVA_HOME=$(/usr/libexec/java_home -v"$version");
  java -version
}
