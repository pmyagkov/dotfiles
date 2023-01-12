#!/bin/sh

if [ -x ~/bin/zsh ]; then exec ~/bin/zsh; fi
export PATH=/opt/homebrew/opt/openjdk/bin:/usr/local/bin/:/usr/local/:/usr/local/sbin/:/usr/local/share/npm/bin:$HOME/bin:$HOME/node_modules/.bin:/usr/local/opt/ruby/bin:$PATH
export NODE_PATH='/usr/local/lib/node_modules'
export EDITOR="vim"

# colored grep
export GREP_OPTIONS="--color=auto"
export GREP_COLOR="1;32"

# common aliases

alias ..='cd ../'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../../'
alias cdm='tmp=$(daria_repo) && cd ""$tmp/mail""'
alias cdn='tmp=$(daria_repo) && cd ""$tmp/neo2""'
alias cds='tmp=$(daria_repo) && cd ""$tmp/neo2/static""'

# Unix
if [[ $PLATFORM == 'Linux' ]]; then
    alias ll='ls -lh --color=auto'
    alias lla='ls -lAh --color=auto'
    alias l='ls -1 --color=auto'
else
    alias ls='ls -G'
    alias ll='ls -lh'
    alias lla='ls -lAh'
    alias l='ls -1'
fi
# ssh
alias ssh='ssh -A'
alias deardeer='ssh root@80.240.130.184'

# my own scripts
alias nver='ver -i'

# editors

alias e=${EDITOR}
alias s=sublime
alias v=vim

# git aliases

function g() {
    if [ $1 ]; then
        git $*
    else
        git st
    fi
}

#alias g='git status'
alias gc='git commit'
alias gap='git add -p'
alias ga='git add'
alias gr='git grep'
alias gcl='git clone'

function gg() {
    git add ChangeLog && \
    git commit -n -m "build" && \
    git push --no-verify
}

#function dev() {
#    H=$(hostname -f)
#    if [[ $H == *daria* ]]; then
#        PATH='~/www'
#    else
#        PATH='~/Projects/daria/dev'
#    fi
#    cd $PATH
#}

#function rc() {
#    H=$(hostname -f)
#    if [[ $H == *daria* ]]; then
#        PATH=~/rc
#    else
#       PATH=~/Projects/daria/rc
#    fi
#    cd $PATH
#}

alias gco='git checkout'
alias gd='git diff'
alias gl='git log --oneline --abbrev-commit --first-parent --color'
alias glp='git log --oneline --abbrev-commit --first-parent --color --pretty="  * %s (%an)" -10'
alias gla='git log --oneline --abbrev-commit --first-parent --color -1'
alias glal='git log --first-parent --color --pretty="%H %s" -1'
alias glb='git log --pretty="  * %s (%an)"'
alias gll='git log --oneline --abbrev-commit --all --graph --decorate --color'
alias gf='git fetch'
alias gu='git pull --rebase'
alias gus='git pull --rebase ; git submodule update --init'
alias gsu='git submodule update --init'
alias up='git stash; gus; git stash pop'
alias gp='git push'
alias ge='git grep'
alias gcp='git cherry-pick'
alias gmm='git merge origin/master'

alias gs='git stash'
alias gsp='git stash pop'
alias gm='git merge'
alias gr='git reset'
alias grh='git reset --hard'
alias gsm='git submodule'
alias gsmu='git submodule update'
alias gb='git branch'

grc (){
     git log --first-parent --format=tformat:' * %s (%an)' --since="`fgrep -m 1 ' -- ' ChangeLog | awk -F '>' '{print($2)}' | xargs --null date -d`"
}


__git_ps1 () { source ~/git-completion.bash
    local b="$(git symbolic-ref HEAD 2>/dev/null)"
    if [ -n "$b" ]; then
            if [ -n "$1" ]; then
                    printf " $1" "${b##refs/heads/}"
            else
                    printf " %s" "${b##refs/heads/}"
            fi
    fi
}

__hostname_ps1() {
    H=$(hostname -f)
    if [ $H ==  "37.140.169.54-red3.dhcp.yndx.net" ] || [ $H == "viking-osx.local" ]; then
        printf "localhost"
    else
        echo $(hostname -s)
    fi
}


PS1='\[\e[38;5;243m\]\u\[\e[38;5;250m\]@\[\e[38;5;243m\]$(__hostname_ps1) \[\e[1;34m\]\w\[\e[1;33m\]$(__git_ps1) \[\e[38;5;243m\]⌘ \[\e[0m\] '
