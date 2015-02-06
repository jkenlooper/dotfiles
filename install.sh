#!/bin/bash

# Create aliases in HOME replacing any existing
for f in {bash_aliases,bashrc,screenrc,vim,vimrc,xinitrc}; do
	if [ -f $HOME/.$f -o -d $HOME/.$f ]; then 
		mv $HOME/.$f $HOME/.$f.old;
	fi
	ln -s $PWD/$f $HOME/.$f;
done;
