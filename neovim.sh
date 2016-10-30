#!/bin/bash

# Install vim-plug
if test ! -e $XDG_CONFIG_HOME/nvim/autoload/plug.vim ; then
  curl -fLo $XDG_CONFIG_HOME/nvim/autoload/plug.vim --create-dirs https://github.com/junegunn/vim-plug/releases/download/0.9.1/plug.vim
fi

vim -c PlugInstall
