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

plugins=(
  nvm
  docker-compose
  docker
#  tmux
#  git
)

zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

export LC_ALL=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

# Global variables
export DOTS_HOME=~/Projects/dotfiles
export ZDOTS_HOME=${DOTS_HOME}/.zsh
export PROJECT_HOME=~/Projects/
export WORKON_HOME=~/Projects/.venv/
export VIRTUAL_ENV_DISABLE_PROMPT=1

# export NODE_PATH='/usr/local/lib/node_modules'
export EDITOR="vim"

export GOPATH=$PROJECT_HOME/go
# YARN_BIN="`yarn global bin`"



add_dir_to_path()
{
  DIR=$1
  PREPEND=$2
  if [ ! -d ${DIR} ]; then
    return
  fi

  if [[ ${PATH} =~ (^|:)"${DIR}"(:|$) ]]; then
    return
  fi

  if [ $PREPEND = 1 ]; then
    PATH=${DIR}:${PATH}
  else
    PATH=${PATH}:${DIR}
  fi
}

add_dir_to_path "${DOTS_HOME}/.bin" 1
add_dir_to_path "/usr/local/bin" 0
add_dir_to_path "/usr/local/sbin" 0
add_dir_to_path "${ZDOTS_HOME}" 1
add_dir_to_path "/usr/local/share/npm/bin" 1
add_dir_to_path "$GOPATH/bin" 1
add_dir_to_path "/opt/homebrew/opt/openjdk/bin" 1

export PYENV_ROOT="$HOME/.pyenv"
export CPPFLAGS="-I/opt/homebrew/opt/openjdk/include"

/opt/homebrew/bin/pyenv -h > /dev/null
if [[ $? = 0 ]]; then
  eval "$(/opt/homebrew/bin/pyenv init -)"
fi

source ${ZSH}/oh-my-zsh.sh

source ${ZDOTS_HOME}/aliases.zsh      # aliases for commands
source ${ZDOTS_HOME}/prompt.zsh       # prompt definition
# source ${ZDOTS_HOME}/tmuxinator.zsh   # completion for tmuxinator
# source ${ZDOTS_HOME}/tmux.plugin.zsh  # completion for tmux
source ${ZDOTS_HOME}/command-line.zsh # plugins for command line

[ ! -f ${ZDOTS_HOME}/git.plugin.zsh ] && curl https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/git/git.plugin.zsh > ${ZDOTS_HOME}/git.plugin.zsh
source ${ZDOTS_HOME}/git.plugin.zsh

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
alias gbi='git branch | percol | xargs git checkout'
alias gdc='git diff --cached'
unalias gp
alias gp='git push -u'
alias gs='git stash'
g() {
    if [ $1 ]; then
        git $*
    else
        git status
    fi
}

# The next line updates PATH for Yandex Cloud CLI.
if [ -f '/Users/puelle/yandex-cloud/path.bash.inc' ]; then source '/Users/puelle/yandex-cloud/path.bash.inc'; fi

# The next line enables shell command completion for yc.
if [ -f '/Users/puelle/yandex-cloud/completion.zsh.inc' ]; then source '/Users/puelle/yandex-cloud/completion.zsh.inc'; fi
eval "$(/opt/homebrew/bin/brew shellenv)"

mkdir -p $HOME/.nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

