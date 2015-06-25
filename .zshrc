#!/bin/zsh

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

plugins=(git history-substring-search.zsh)

zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down



# Global variables
export DOTS_HOME=~/Projects/dotfiles/
export ZDOTS_HOME=${DOTS_HOME}/.zsh
export PROJECT_HOME=~/Projects/
export WORKON_HOME=~/Projects/.venv/
export VIRTUAL_ENV_DISABLE_PROMPT=1

export NODE_PATH='/usr/local/lib/node_modules'
export EDITOR="vim"

[ -d ${HOME}/.bin ] && PATH=${HOME}/.bin:$PATH
[ -d ${ZDOTS_HOME} ] && PATH=${ZDOTS_HOME}:$PATH
[ -d /usr/local/bin ] && PATH=/usr/local/bin:$PATH
[ -d /usr/local/sbin ] && PATH=/usr/local/sbin:$PATH
[ -d /usr/local/share/npm/bin ] && PATH=/usr/local/share/npm/bin:$PATH

export PATH




source ${ZSH}/oh-my-zsh.sh

source ${ZDOTS_HOME}/aliases.zsh      # aliases for commands
source ${ZDOTS_HOME}/prompt.zsh       # prompt definition

[ -f /usr/local/include/php/arcanist/resources/shell/bash-completion ] && source /usr/local/include/php/arcanist/resources/shell/bash-completion

[ -f /usr/local/bin/virtualenvwrapper.sh ] && source /usr/local/bin/virtualenvwrapper.sh   #launch virtual env wrapper
