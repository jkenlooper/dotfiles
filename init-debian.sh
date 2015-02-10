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

# install support for Pillow
sudo apt-get install libtiff4-dev libjpeg8-dev zlib1g-dev \
      libfreetype6-dev liblcms2-dev libwebp-dev tcl8.5-dev tk8.5-dev python-tk


# Install more stuff for web development
sudo apt-get install sqlite3 python-sqlite
sudo apt-get install optipng
sudo apt-get install geeqie

#nodejs and npm
# See: https://github.com/joyent/node/wiki/Installing-Node.js-via-package-manager#debian-and-ubuntu-based-linux-distributions
curl -sL https://deb.nodesource.com/setup | sudo bash -;

sudo apt-get install nodejs

# Setup npm to use a different directory for global installs
mkdir -p $HOME/bin/npm-global;
npm config set prefix '~/bin/npm-global';

npm install -g uglify-js;
npm install -g clean-css;
npm install -g component;
npm install -g bower;
npm install -g less;
npm install -g autoprefixer;
npm install -g stripmq;

# install custom fork of suitcss
npm install -g git://github.com/jkenlooper/preprocessor#0.5.0-depends.1;

# Other useful commands
npm install -g svg2png-cli;
npm install -g cssunminifier;

#jq

# Setup the home directory with a python in bin/
(
mkdir -p $HOME/bin/py;
cd $HOME/bin/py;
virtualenv --site-packages .;

source ~/.profile;
)

pip install Pillow;

# Install other commands
pip install glue;
pip install colourless;
pip install verify_version_spec;
