alias ls='ls --classify --color=auto'

alias static='python2 -m SimpleHTTPServer 4444'

alias s='screen -xR -S '
alias ss='screen -ls; read -e SCRN && echo -n -e "\033]0;$SCRN\007" && screen -xR $SCRN -h 10000'

alias sshx='ssh -c arcfour,blowfish-cbc -XC'

alias t='todo.sh'

alias today='todo.sh listpri A'
