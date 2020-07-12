#== GENERAL ==#
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="spaceship"

ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

plugins=(git docker docker-compose kubectl dotenv)

#=============#
#== EXPORTS ==#
#=============#
export LANG='en_US.UTF-8'
export EDITOR='vim'
export DOCKER_BUILDKIT=1 # Use the new docker buildkit
export PATH="$PATH:$HOME/bin" # Personal scripts
# Android Settings
export ANDROID_HOME="/usr/lib/Android"
export PATH="$PATH:$ANDROID_HOME/cmdline-tools"
export PATH="$PATH:$ANDROID_HOME/cmdline-tools/latest/bin"
export ANDROID_SDK_ROOT="/usr/lib/Android"
export PATH="$PATH:$ANDROID_SDK_ROOT"
# Dart Settings
export PATH="$PATH:$HOME/.pub-cache/bin"
# Flutter Settings
export FLUTTER_HOME="/usr/lib/flutter"
export PATH="$PATH:/$FLUTTER_HOME/bin"
export PATH="$PATH:$HOME/bin/fluter/bin"
# Ruby Settings
export PATH="$PATH:$HOME/.gem/ruby/2.7.0/bin"
export NVM_DIR="$HOME/.nvm"

#===============#
#== FUNCTIONS ==#
#===============#
function fif() {
  if [ ! "$#" -gt 0 ]; then echo "Need a string to search for! Usage: fif <searchString>"; return 1; fi
  file="$(rg --max-count=1 --ignore-case --files-with-matches --no-messages "$@" | fzf +m --preview="rg --ignore-case --pretty --context 10 '"$@"' {}")" && vim "$file"
}

# Lazy load of NVM and node, so it doesn't need to load on every terminal startup
#function nvm() {
#    unset -f nvm
#    export NVM_DIR=~/.nvm
#    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
#    nvm "$@"
#}
#function node() {
#    unset -f node
#    export NVM_DIR=~/.nvm
#    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
#    node "$@"
#}
#function npm() {
#    unset -f npm
#    export NVM_DIR=~/.nvm
#    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
#    npm "$@"
#}

#===========#
#== ALIAS ==#
#===========#
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
# Git
alias gmd="git merge --no-ff develop"
alias gdl="git branch -d"
alias gdr="git push origin --delete"
# SSH
alias ssh='TERM=xterm ssh'
alias kak="kubectl apply -k ./"
alias kdk="kubectl delete -k ./"

#== NVM ==#
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# KEYBOARD LAYOUT #
setxkbmap -rules evdev -model evdev -layout us -variant altgr-intl

#-- SPACESHIP --#
autoload -U promptinit; promptinit
prompt spaceship
SPACESHIP_TIME_SHOW=true

#-- KITTY --#
autoload -Uz compinit
for dump in ~/.zcompdump(N.mh+24); do
  compinit
done
compinit -C

#-- Oh My ZSH --#
source $ZSH/oh-my-zsh.sh

#-- FZF --#
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='fd --type file --follow --color=always --hidden --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
#export FZF_DEFAULT_OPTS="--ansi --preview-window 'right:60%' --preview 'bat --color=always --style=header,grid --line-range :300 {}'"
export FZF_DEFAULT_OPTS="--ansi"

