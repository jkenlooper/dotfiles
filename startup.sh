#!/bin/bash

# After logging in run this script to initialize

# add the bin/py to path in case it's not there by sourcing .profile again.
source $HOME/.profile;


# Install Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

# Install other python scripts
# for example:
# pip install chill

read -p "Enter git config user name: [$(git config --global user.name)]" STARTUP_GIT_CONFIG_USER_NAME

if test "$STARTUP_GIT_CONFIG_USER_NAME"; then
  git config --global --replace-all user.name $STARTUP_GIT_CONFIG_USER_NAME;
fi

read -p "Enter git config user email: [$(git config --global user.email)]" STARTUP_GIT_CONFIG_USER_EMAIL

if test "$STARTUP_GIT_CONFIG_USER_EMAIL"; then
  git config --global --replace-all user.email $STARTUP_GIT_CONFIG_USER_EMAIL;
fi
