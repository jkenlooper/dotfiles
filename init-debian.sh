sudo apt-get update
sudo apt-get upgrade

# Install core stuff
sudo apt-get --yes install git curl



sudo apt-get --yes install python-virtualenv

# Vim
sudo apt-get --yes install libncurses5-dev libgnome2-dev libgnomeui-dev \
    libgtk2.0-dev libatk1.0-dev libbonoboui2-dev \
    libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev \
    ruby-dev mercurial

# Install support for compiling
sudo apt-get --yes install build-essential cmake python-dev;

# install support for Pillow
sudo apt-get --yes install libtiff4-dev libjpeg8-dev zlib1g-dev \
      libfreetype6-dev liblcms2-dev libwebp-dev tcl8.5-dev tk8.5-dev python-tk


# Install more stuff for web development
sudo apt-get --yes install sqlite3 python-sqlite
sudo apt-get --yes install optipng
sudo apt-get --yes install geeqie

# Fall back on installing jq from source
sudo apt-get --yes install jq || (
curl -O --url https://stedolan.github.io/jq/download/source/jq-1.4.tar.gz;
tar -xzf jq-1.4.tar.gz;
cd jq-1.4;
./configure --prefix $HOME && make && make install;
cd ..;
rm -rf jq-1.4 jq-1.4.tar.gz;
)

#nodejs and npm
# See: https://github.com/joyent/node/wiki/Installing-Node.js-via-package-manager#debian-and-ubuntu-based-linux-distributions
curl -sL https://deb.nodesource.com/setup | sudo bash -;

sudo apt-get --yes install nodejs

# Setup npm to use a different directory for global installs
rm -rf $HOME/bin/npm-global;
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
npm install -g svgo;
npm install -g cssunminifier;


# Setup the home directory with a python in bin/
(
rm -rf $HOME/bin/py;
mkdir -p $HOME/bin/py;
cd $HOME/bin/py;
virtualenv --system-site-packages .;

source ~/.profile;
)

(
# install latest setuptools
cd ~/sources;
curl https://bootstrap.pypa.io/ez_setup.py -o - | python
)

pip install Pillow;

# Setup for packaging
pip install wheel;
pip install twine;

# Install other commands
pip install glue;
pip install colourless;
pip install verify_version_spec;
