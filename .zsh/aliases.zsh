#!/bin/zsh
# common aliases

alias ..='cd ../'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../../'


# editors
alias ws='nohup /Applications/WebStorm.app/Contents/MacOS/webstorm `pwd` > /dev/null & '
# не работает
# alias diff="nohup /Applications/WebStorm.app/Contents/MacOS/webstorm diff $@ > /dev/null & "

# Unix
if [[ $PLATFORM == 'Linux' ]]; then
    alias ll='ls -lh --color=auto'
    alias lla='ls -lAh --color=auto'
    alias l='ls -la --color=auto'
else
    alias ls='ls -G'
    alias ll='ls -lh'
    alias lla='ls -lAh'
    alias l='ls -1'
fi

# ssh
alias ssh='ssh -A'
alias deardeer='ssh -A root@80.240.130.184'
alias win105='ssh -A p.myagkov@win105.dev.mail.ru'
alias beta='ssh -A beta.cal.dev.mail.ru'
alias allmyart='ssh -A allmyart@ssh.allmyart.nichost.ru'

# my own scripts
alias nver='ver -i'
alias tver='ver -t'
alias a='anna'

alias kid='node ~/Projects/slack-emoji/index.js'

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
alias supdate='source ${DOTS_HOME}.zshrc'
alias zshconfig="vim ${DOTS_HOME}/.zshrc"

# virtual machines & envs
alias d='docker'
alias dm='docker-machine'
alias va='vagrant'
alias wo='workon'

# build commands
alias ez-start='NODE_ENV=development LEVEL=development babel-node webpack/run start'
