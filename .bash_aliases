#alias ls='ls --classify --color=auto'
alias ls='ls -FG'

alias static='python2 -m SimpleHTTPServer 4444'

alias s='screen -xR -S '
alias ss='screen -ls; read -e SCRN && echo -n -e "\033]0;$SCRN\007" && screen -xR $SCRN -h 10000'

alias sshx='ssh -c arcfour,blowfish-cbc -XC'

alias ql='qlmanage -p "$@" >& /dev/null'
