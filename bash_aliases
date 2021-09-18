alias ls='ls --classify --color=auto'

alias static='python -m http.server 4444'

alias s='screen -xR -S '
alias ss='screen -ls; read -e SCRN && echo -n -e "\033]0;$SCRN\007" && screen -xR $SCRN -h 10000'

alias sshx='ssh -c arcfour,blowfish-cbc -XC'

alias t='todo.sh'

alias today='todo.sh listpri A'

alias clot='nohup clog.sh >> ~/clog.output & tmux new -s hack'

alias k="minikube kubectl --"
