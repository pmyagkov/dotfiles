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

# editors
alias ws='nohup /Applications/WebStorm.app/Contents/MacOS/webstorm `pwd` > /dev/null & '

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
alias mf2='ssh -A mailfront2.yandex.ru'
alias mf2yt='ssh -A mailfront2.yandex-team.ru'
alias deardeer='ssh root@80.240.130.184'

# my own scripts
alias nver='ver -i'
alias tver='ver -t'
alias a='anna'

# grep log
alias decode='python -c "import sys, urllib as ul; print ul.unquote_plus(sys.stdin.read())"'
alias gettime='egrep -o "\[[0-9][^ ]+" | sed "s#^.##"'
alias getdec="gettime | sed 's#....\$##'"
alias gethour="gettime | sed 's#......\$##'"
alias getlogin='egrep -o "login=[^;&\" ]+"'
alias getversion="egrep -o 'mail-[^-]+'"

# npm scripts
alias ut='npm run-script unit-test'
alias kt='npm run-script karma-test'
alias kw='npm run-script karma-watch'

# bash/zsh
alias supdate='source ~/.zshrc'
