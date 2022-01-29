#!/bin/bash

# Create aliases for dot files in HOME replacing any existing
dotfiles="
alacritty.yml
bash_aliases
bashrc
editorconfig
gitattributes
gitconfig
profile
todo.actions.d
todo.cfg
tmux.conf
vim
vimrc
Xresources
"
for f in $dotfiles; do
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
