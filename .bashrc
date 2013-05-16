# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# set 256 color term
export TERM=xterm-256color

# don't put duplicate lines in the history. See bash(1) for more options
HISTCONTROL=ignoreboth

#don't keep a history file
HISTFILE=
HISTSIZE=100

# The terminal display - "user[path](gitbranch)$ " where gitbranch only shows up in a git repo
parse_git_branch(){ git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \1/'; }

PROMPT_COMMAND=$(
    cat<<-'EOF'

    _temp_var=$val_ret _pipe_status="${PIPESTATUS[@]}"

    if((val_ret == 0)); then
        _temp_var=$(( $(tr -s " " "+" <<< "$_pipe_status") ))
    else
        _temp_var=$val_ret
    fi

    if((_temp_var == 0)); then
        PS1="\[\e[32m\]\w\[\e[0m\]\[\e[34m\]$(parse_git_branch)\[\e[0m\]: "
    else
        PS1="\[\e[32m\]\w\[\e[0m\]\[\e[34m\]$(parse_git_branch)\[\e[0m\]\[\e[33m\]|ERROR:$_temp_var|\[\e[0m\]: "
    fi
EOF
)



# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

PATH="/usr/local/bin:$PATH"

if [ -d "$HOME/bin" ] ; then
  PATH="$HOME/bin:$PATH"
fi

if [ -d "$HOME/.gem/ruby/1.9.1/bin" ] ; then
  PATH="$HOME/.gem/ruby/1.9.1/bin:$PATH"
fi

EDITOR=vim
export EDITOR

# vi commandline editing
set -o vi

# Alias definitions.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
