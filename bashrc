# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
#don't keep a history file
HISTFILE=
HISTSIZE=100

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"


# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

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


# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    #alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

# some more ls aliases
#alias ll='ls -l'
#alias la='ls -A'
#alias l='ls -CF'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


EDITOR=vim
export EDITOR

# vi commandline editing
set -o vi

# more powerful globbing with grep!
# ?(pattern-list)
# Matches zero or one occurrence of the given patterns
# *(pattern-list)
# Matches zero or more occurrences of the given patterns
# +(pattern-list)
# Matches one or more occurrences of the given patterns
# @(pattern-list)
# Matches exactly one of the given patterns
# !(pattern-list)
# Matches anything except one of the given patterns
shopt -s extglob

# fis misspelling misteakes for cd
shopt -s cdspell


if [ -f "${HOME}/.gpg-agent-info" ]; then
  . "${HOME}/.gpg-agent-info"
  export GPG_AGENT_INFO
  export SSH_AUTH_SOCK
fi

GPG_TTY=$(tty)
export GPG_TTY

