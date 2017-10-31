#!/bin/bash

# Create aliases for dot files in HOME replacing any existing
for f in {bash_aliases,bashrc,editorconfig,gitattributes,gitconfig,profile,pyrax.cfg,todo.actions.d,todo.cfg,tmux.conf,config,vim,vimrc}; do
  # Remove old symbolic link if there.
	if [ -L $HOME/.$f ]; then
    rm $HOME/.$f;
  fi
  # Move any existing file or directory
	if [ -f $HOME/.$f -o -d $HOME/.$f ]; then
		mv $HOME/.$f $HOME/.$f.old;
	fi
	ln -s $PWD/$f $HOME/.$f;
done;


# Create aliases in HOME/bin replacing any existing
mkdir -p $HOME/bin;
for f in bin/*; do
  # Remove old symbolic link if there.
	if [ -L $HOME/$f ]; then
    rm $HOME/$f;
  fi
  # Move any existing file or directory
	if [ -f $HOME/$f -o -d $HOME/$f ]; then
		mv $HOME/$f $HOME/$f.old;
	fi
	ln -s $PWD/$f $HOME/$f;
done;
