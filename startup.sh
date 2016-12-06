#!/bin/bash

# After logging in run this script to initialize

# Setup the home directory with a python in bin/
(
rm -rf $HOME/bin/py;
mkdir -p $HOME/bin/py;
cd $HOME/bin/py;
virtualenv --system-site-packages .;
)

# add the bin/py to path in case it's not there by sourcing .profile again.
source $HOME/.profile;


# Install vim-plug
if test ! -e $XDG_CONFIG_HOME/nvim/autoload/plug.vim ; then
  curl -fLo $XDG_CONFIG_HOME/nvim/autoload/plug.vim --create-dirs https://github.com/junegunn/vim-plug/releases/download/0.9.1/plug.vim
fi

vim -c PlugInstall


# Install other python scripts
# for example:
# pip install chill

# Create public and private key with a comment
ssh-keygen -t rsa -C "box"

echo "ssh public key created:"
cat ~/.ssh/id_rsa.pub

#
read -p "Enter git config user name: " STARTUP_GIT_CONFIG_USER_NAME

if test "$STARTUP_GIT_CONFIG_USER_NAME"; then
  git config --global --replace-all user.name $STARTUP_GIT_CONFIG_USER_NAME;
fi

read -p "Enter git config user email: " STARTUP_GIT_CONFIG_USER_EMAIL

if test "$STARTUP_GIT_CONFIG_USER_EMAIL"; then
  git config --global --replace-all user.email $STARTUP_GIT_CONFIG_USER_EMAIL;
fi

# Update the timezone
sudo dpkg-reconfigure tzdata
