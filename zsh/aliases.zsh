#!/bin/zsh
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
alias daria2='ssh -A daria2.yandex.ru'
alias mailfront='ssh -A mailfront.yandex.ru'
alias deardeer='ssh root@80.240.130.184'

# my own scripts
alias nver='ver -i'
