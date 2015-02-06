#!/bin/bash

# Init the submodules
git submodule init;
git submodule update;

# Install pathogen.vim
mkdir -p ~/.vim/autoload ~/.vim/bundle;
curl -Sso ~/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim;
