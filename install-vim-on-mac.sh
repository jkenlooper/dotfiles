mkdir -p ~/sources;
cd ~/sources;
curl -O ftp://ftp.vim.org/pub/vim/unix/vim-7.4.tar.bz2
bunzip2 vim-7.4.tar.bz2 
tar -xf vim-7.4.tar 
rm vim-7.4.tar
cd vim74
mkdir -p $HOME/vim-test;
./configure --prefix=$HOME/vim-test \
--disable-darwin  \
--disable-selinux \
--enable-pythoninterp=yes \
--enable-gui=no \
--disable-gtktest \
--disable-acl \
--disable-gpm \
--disable-sysmouse \

#  --with-developer-dir=PATH    use PATH as location for Xcode developer tools
#  --with-local-dir=PATH   search PATH instead of /usr/local for local libraries.
#  --without-local-dir     do not search /usr/local for local libraries.
#  --with-features=TYPE    tiny, small, normal, big or huge (default: normal)
#  --with-compiledby=NAME  name to show in :version message
#  --with-python-config-dir=PATH  Python's config directory

make

