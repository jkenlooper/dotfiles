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
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# The terminal display - "user[path](gitbranch)$ " where gitbranch only shows up in a git repo
parse_git_branch(){ git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \1/'; }

PROMPT_DIRTRIM=3

PROMPT_COMMAND=$(
    cat<<-'EOF'

    _temp_var=$val_ret _pipe_status="${PIPESTATUS[@]}"

    if((val_ret == 0)); then
        _temp_var=$(( $(tr -s " " "+" <<< "$_pipe_status") ))
    else
        _temp_var=$val_ret
    fi

    if((_temp_var == 0)); then
        PS1="\h \[\e[32m\]\w\[\e[0m\]\[\e[34m\]$(parse_git_branch)\[\e[0m\]: "
    else
        PS1="\h \[\e[32m\]\w\[\e[0m\]\[\e[34m\]$(parse_git_branch)\[\e[0m\]\[\e[33m\]|ERROR:$_temp_var|\[\e[0m\]: "
    fi
EOF
)

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

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

XDG_CONFIG_HOME=$HOME/.config
export XDG_CONFIG_HOME

TODO_DIR=$HOME/Dropbox/todo
export TODO_DIR
TODOTXT_CFG_FILE=${HOME}/.todo.cfg
export TODOTXT_CFG_FILE

# Custom colors
#9A9FA1
#BCC0C2
#D5D9DB
#
#57676E
#6C7F87
#7F95A1
#7EBCDE
#
#475459
#5D6B73
#70818C
#3D91CC
#
#384347
#4E5B61
#63727A
#
#A87058
#C28265
#DB9372
if [ "$TERM" = "linux" ]; then

echo -en "\e]P0000000" #black      #base02
echo -en "\e]P8111111" #brblack    #base03

echo -en "\e]P1C28265" #red        #red
echo -en "\e]P9DB9372" #brred      #orange

echo -en "\e]P54E5B61" #magenta    #magenta
echo -en "\e]PD63727A" #brmagenta  #violet

echo -en "\e]P23D91CC" #green      #green
echo -en "\e]PA3D91CC" #brgreen    #base01
echo -en "\e]P33D91CC" #yellow     #yellow
echo -en "\e]PB3D91CC" #bryellow   #base00

echo -en "\e]P47EBCDE" #blue       #blue
echo -en "\e]PC7EBCDE" #brblue     #base0
echo -en "\e]P67EBCDE" #cyan       #cyan
echo -en "\e]PE7EBCDE" #brcyan     #base1

echo -en "\e]P7BCC0C2" #white      #base2
echo -en "\e]PFD5D9DB" #brwhite    #base3

clear #for background artifacting

fi


#SOLARIZED HEX     16/8 TERMCOL  XTERM/HEX   L*A*B      RGB         HSB
#--------- ------- ---- -------  ----------- ---------- ----------- -----------
#base03    #002b36  8/4 brblack  234 #1c1c1c 15 -12 -12   0  43  54 193 100  21
#base02    #073642  0/4 black    235 #262626 20 -12 -12   7  54  66 192  90  26
#base01    #586e75 10/7 brgreen  240 #585858 45 -07 -07  88 110 117 194  25  46
#base00    #657b83 11/7 bryellow 241 #626262 50 -07 -07 101 123 131 195  23  51
#base0     #839496 12/6 brblue   244 #808080 60 -06 -03 131 148 150 186  13  59
#base1     #93a1a1 14/4 brcyan   245 #8a8a8a 65 -05 -02 147 161 161 180   9  63
#base2     #eee8d5  7/7 white    254 #e4e4e4 92 -00  10 238 232 213  44  11  93
#base3     #fdf6e3 15/7 brwhite  230 #ffffd7 97  00  10 253 246 227  44  10  99
#yellow    #b58900  3/3 yellow   136 #af8700 60  10  65 181 137   0  45 100  71
#orange    #cb4b16  9/3 brred    166 #d75f00 50  50  55 203  75  22  18  89  80
#red       #dc322f  1/1 red      160 #d70000 50  65  45 220  50  47   1  79  86
#magenta   #d33682  5/5 magenta  125 #af005f 50  65 -05 211  54 130 331  74  83
#violet    #6c71c4 13/5 brmagenta 61 #5f5faf 50  15 -45 108 113 196 237  45  77
#blue      #268bd2  4/4 blue      33 #0087ff 55 -10 -45  38 139 210 205  82  82
#cyan      #2aa198  6/6 cyan      37 #00afaf 60 -35 -05  42 161 152 175  74  63
#green     #859900  2/2 green     64 #5f8700 60 -20  65 133 153   0  68 100  60

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export DENO_INSTALL="$HOME/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"
