#!/bin/zsh

# Allow to delete word to the nearest /
#a-tcsh-backward-delete-word () {
#  local WORDCHARS="${WORDCHARS:s#/#}"
#  zle backward-delete-word
#}

#bindkey '^W' a-tcsh-backward-delete-word

#== Commands cd & pushd =======================================================
setopt AUTO_PUSHD               # this makes cd=pushd
setopt PUSHD_TO_HOME            # blank pushd goes to home


# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="kolo"

export UPDATE_ZSH_DAYS=2          #autoupdate in days


# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(git nvm)

zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

export LC_ALL=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

# Global variables
export DOTS_HOME=~/Projects/dotfiles/
export ZDOTS_HOME=${DOTS_HOME}/.zsh
export PROJECT_HOME=~/Projects/
export WORKON_HOME=~/Projects/.venv/
export VIRTUAL_ENV_DISABLE_PROMPT=1

# export NODE_PATH='/usr/local/lib/node_modules'
export EDITOR="vim"

export GOPATH=$PROJECT_HOME/go
# YARN_BIN="`yarn global bin`"

export PATH="/usr/local/opt/python/libexec/bin:$PATH"

[ -d /usr/local/opt/python/libexec/bin ] && PATH=/usr/local/opt/python/libexec/bin:$PATH # python from brew
[ -d ${HOME}/.bin ] && PATH=${HOME}/.bin:$PATH
[ -d ${ZDOTS_HOME} ] && PATH=${ZDOTS_HOME}:$PATH
[ -d /usr/local/bin ] && PATH=/usr/local/bin:$PATH
[ -d /usr/local/sbin ] && PATH=/usr/local/sbin:$PATH
[ -d /usr/local/share/npm/bin ] && PATH=/usr/local/share/npm/bin:$PATH
[ -d $GOPATH/bin ] && PATH=$GOPATH/bin:$PATH
# [ -d $YARN_BIN ] && PATH=$YARN_BIN:$PATH
[ -d ${HOME}/.fastlane/bin ] && PATH="${HOME}/.fastlane/bin:$PATH"

export ANDROID_HOME=${HOME}/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/tools
export PATH=$PATH:/Users/puelle/Library/Android/sdk/platform-tools/
export JAVA_HOME="/Applications/Android Studio.app/Contents/jre/jdk/Contents/Home"


source ${ZSH}/oh-my-zsh.sh

source ${ZDOTS_HOME}/aliases.zsh      # aliases for commands
source ${ZDOTS_HOME}/prompt.zsh       # prompt definition
source ${ZDOTS_HOME}/tmuxinator.zsh   # completion for tmuxinator
source ${ZDOTS_HOME}/tmux.plugin.zsh  # completion for tmux
source ${ZDOTS_HOME}/command-line.zsh # plugins for command line

# eval "$(pyenv init -)"

[ -f /usr/local/include/php/arcanist/resources/shell/bash-completion ] && source /usr/local/include/php/arcanist/resources/shell/bash-completion

[ -f /usr/local/bin/virtualenvwrapper.sh ] && source /usr/local/bin/virtualenvwrapper.sh   #launch virtual env wrapper

test -e ${HOME}/.iterm2_shell_integration.zsh && source ${HOME}/.iterm2_shell_integration.zsh
###-begin-npm-completion-###
#
# npm command completion script
#
# Installation: npm completion >> ~/.bashrc  (or ~/.zshrc)
# Or, maybe: npm completion > /usr/local/etc/bash_completion.d/npm
#

if type complete &>/dev/null; then
  _npm_completion () {
    local words cword
    if type _get_comp_words_by_ref &>/dev/null; then
      _get_comp_words_by_ref -n = -n @ -w words -i cword
    else
      cword="$COMP_CWORD"
      words=("${COMP_WORDS[@]}")
    fi

    local si="$IFS"
    IFS=$'\n' COMPREPLY=($(COMP_CWORD="$cword" \
                           COMP_LINE="$COMP_LINE" \
                           COMP_POINT="$COMP_POINT" \
                           npm completion -- "${words[@]}" \
                           2>/dev/null)) || return $?
    IFS="$si"
  }
  complete -o default -F _npm_completion npm
elif type compdef &>/dev/null; then
  _npm_completion() {
    local si=$IFS
    compadd -- $(COMP_CWORD=$((CURRENT-1)) \
                 COMP_LINE=$BUFFER \
                 COMP_POINT=0 \
                 npm completion -- "${words[@]}" \
                 2>/dev/null)
    IFS=$si
  }
  compdef _npm_completion npm
elif type compctl &>/dev/null; then
  _npm_completion () {
    local cword line point words si
    read -Ac words
    read -cn cword
    let cword-=1
    read -l line
    read -ln point
    si="$IFS"
    IFS=$'\n' reply=($(COMP_CWORD="$cword" \
                       COMP_LINE="$line" \
                       COMP_POINT="$point" \
                       npm completion -- "${words[@]}" \
                       2>/dev/null)) || return $?
    IFS="$si"
  }
  compctl -K _npm_completion npm
fi
###-end-npm-completion-###

# tabtab source for yarn package
# uninstall by removing these lines or running `tabtab uninstall yarn`
[[ -f /Users/puelle/.config/yarn/global/node_modules/tabtab/.completions/yarn.zsh ]] && . /Users/puelle/.config/yarn/global/node_modules/tabtab/.completions/yarn.zsh

# added by travis gem
[ -f /Users/puelle/.travis/travis.sh ] && source /Users/puelle/.travis/travis.sh

if which rbenv > /dev/null;
then
  eval "$(rbenv init -)";
fi

unalias g
g() {
    if [ $1 ]; then
        git $*
    else
        git status
    fi
}
