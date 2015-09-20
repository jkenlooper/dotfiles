set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'Valloric/YouCompleteMe'
Plugin 'hail2u/vim-css3-syntax'
" Plugin 'tpope/fugitive-vim'
Plugin 'groenewege/vim-less'
Plugin 'scrooloose/syntastic'
Plugin 'airblade/vim-gitgutter'
Plugin 'nathanaelkane/vim-indent-guides'

" Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-surround'
Plugin 'editorconfig/editorconfig-vim'

Plugin 'mark'
Plugin 'mattn/emmet-vim'

Plugin 'ledger/vim-ledger'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" set cursorline " Highlight current line

set formatoptions=
set formatoptions+=c " Format comments
set formatoptions+=r " Continue comments by default
set formatoptions+=o " Make comment when using o or O from comment line
set formatoptions+=q " Format comments with gq
set formatoptions+=n " Recognize numbered lists
set formatoptions+=2 " Use indent from 2nd line of a paragraph
set formatoptions+=l " Don't break lines that are already long
set formatoptions+=1 " Break before 1-letter words
"
" Speed up viewport scrolling
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" Set relative line numbers
"set relativenumber " Use relative line numbers. Current line is still in status bar.
"au BufReadPost,BufNewFile * set relativenumber
set number
au BufReadPost,BufNewFile * set number

set autoindent
set history=50
set ruler
set incsearch
set showcmd
set hlsearch
set nobackup
set ts=2
set sw=2
set expandtab
" All line endings are unix
set fileformat=unix

" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-l> :nohl<CR><C-l>

" Don't create swp files
set nobackup
set nowritebackup
set noswapfile

" Status bar
set laststatus=2
if has('statusline')
  "set statusline=%<%f
  "set statusline+=%w%h%m%r
  set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
  " set statusline+=%{fugitive#statusline()}
  " set statusline+=\ [%{getcwd()}]
endif

map \r :%s/\t/  /g<CR>| "convert tabs to spaces)
map \m :%s/<C-V><CR>$//g<CR>:%s/<C-V><CR>/\r/g<CR>| "replace ^M with returns (use if mixed with newlines)
map \M :%s/<C-V><CR>/\r/g<CR>| "replace ^M with returns (use if not mixed with newlines)

au BufRead,BufNewFile *.yaml,*yml set sw=2
au BufRead,BufNewFile *.yaml,*yml set ts=2
au BufRead,BufNewFile *.yaml,*yml set expandtab

au BufRead,BufNewFile *.rst set sw=4
au BufRead,BufNewFile *.rst set ts=4
au BufRead,BufNewFile *.rst set expandtab

au BufRead,BufNewFile *.py,*pyw set shiftwidth=4
au BufRead,BufNewFile *.py,*.pyw set expandtab
au BufRead,BufNewFile *.py,*.pyw set ts=4
highlight BadWhitespace ctermbg=red guibg=red

" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

au FileType javascript setl fen
au FileType javascript setl nocindent


" Enable 'altercation/vim-colors-solarized'
syntax enable
set background=dark
" let g:solarized_visibility = "high"
" let g:solarized_contrast = "high"
" let g:solarized_termcolors = 16
" colorscheme solarized

unmap <C-y>
" let g:user_emmet_leader_key='<C-Y>'
" Set the leader key to ',' which makes the expansion be ',,'
let g:user_emmet_leader_key=','
" let g:user_emmet_mode='a'
let g:user_emmet_install_global = 0
auto FileType html,css EmmetInstall

runtime macros/matchit.vim

let g:ycm_complete_in_comments = 1
let g:ycm_min_num_of_chars_for_completion = 2

" set leader key to comma
let mapleader = ","

" rename current file, via Gary Bernhardt
function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'))
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction
map <leader>N :call RenameFile()<cr>

set backspace=2
set hidden
set lazyredraw
set scrolloff=6
set autoread

" Shrink the current window to fit the number of lines in the buffer.  Useful
" for those buffers that are only a few lines
nmap <silent> ,sw :execute ":resize " . line('$')<cr>


" Syntax coloring lines that are too long just slows down the world
set synmaxcol=2048
