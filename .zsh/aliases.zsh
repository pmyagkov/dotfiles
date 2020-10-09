#!/bin/zsh
# common aliases

alias ..='cd ../'
alias ...='cd ../../'
alias ....='cd ../../../'

# tangle
alias tf="cd ~/Projects/tangle-front"
alias tn="cd ~/Projects/tangleapp"

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
alias allmyart='ssh -A allmyart@ssh.allmyart.nichost.ru'

alias kid='node ~/Projects/slack-emoji/index.js'
alias clean-all='cd ~/Projects/slack-emoji/ && ./clean_all'

# grep log
alias decode='python -c "import sys, urllib as ul; print ul.unquote_plus(sys.stdin.read())"'
alias gettime='egrep -o "\[[0-9][^ ]+" | sed "s#^.##"'
alias getdec="gettime | sed 's#....\$##'"
alias gethour="gettime | sed 's#......\$##'"
alias getlogin='egrep -o "login=[^;&\" ]+"'
alias getversion="egrep -o 'mail-[^-]+'"

# npm & yarn
alias ya='yarn'
alias n='npm'

# bash/zsh
alias supdate="source ${DOTS_HOME}.zshrc"
alias zshconfig="vim ${DOTS_HOME}.zshrc"

# audio & video
alias restart-audio="sudo killall coreaudiod"
alias restart-video="sudo killall VDCAssistant"

# virtual machines & envs
alias d='docker'
alias dm='docker-machine'

# others
alias mux='tmuxinator'
alias l='lerna'

whoislistening () {
  lsof -n -i4TCP:$1 | grep LISTEN
}

alias python=/usr/local/bin/python3
alias pip=/usr/local/bin/pip3