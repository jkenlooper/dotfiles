# Install core stuff
sudo apt-get install git curl



sudo apt-get install python-virtualenv

# Vim
sudo apt-get install libncurses5-dev libgnome2-dev libgnomeui-dev \
    libgtk2.0-dev libatk1.0-dev libbonoboui2-dev \
    libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev \
    ruby-dev mercurial

sudo apt-get remove vim vim-runtime gvim vim-tiny vim-common vim-gui-common

# Install support for YouCompleteMe 
sudo apt-get install build-essential cmake python-dev;


# Install more stuff for web development
sudo apt-get install sqlite3 python-sqlite
sudo apt-get install optipng

#nodejs and npm
# See: https://github.com/joyent/node/wiki/Installing-Node.js-via-package-manager#debian-and-ubuntu-based-linux-distributions
curl -sL https://deb.nodesource.com/setup | sudo bash -;

sudo apt-get install nodejs

#jq

# Setup the home directory with a python in bin/
(
mkdir -p $HOME/bin/py;
cd $HOME/bin/py;
virtualenv --site-packages .;
)
