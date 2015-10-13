
# Vim
# Install on mac with support for ycm

brew install vim;
brew install cmake;

mkdir -p vim/bundle;

git clone https://github.com/gmarik/Vundle.vim.git vim/bundle/Vundle.vim;

vim +PluginInstall +qall;

# Compile the ycm:
(
rm -rf ycm_build;
mkdir ycm_build;
cd ycm_build;
cmake -G "Unix Makefiles" . ../vim/bundle/YouCompleteMe/third_party/ycmd/cpp;
make ycm_support_libs;
)
