set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Autocompletion
Plugin 'Valloric/YouCompleteMe'

Plugin 'airblade/vim-gitgutter'

Plugin 'mattn/emmet-vim'
Plugin 'scrooloose/nerdtree'
Plugin 'w0rp/ale'
Plugin 'tpope/vim-surround'
Plugin 'editorconfig/editorconfig-vim'

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

" Use true color
" https://deductivelabs.com/en/2016/03/using-true-color-vim-tmux/
let $NVIM_TUI_ENABLE_TRUE_COLOR=1


let g:indent_guides_auto_colors = 0
let g:indent_guides_enable_on_vim_startup = 0
let g:indent_guides_default_mapping = 1 " <Leader>ig
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree']
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=8
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=16

" emmet-vim
" unmap <C-y>
" let g:user_emmet_leader_key='<C-Y>'
" Set the leader key to ',' which makes the expansion be ',,'
let g:user_emmet_leader_key=','
" let g:user_emmet_mode='a'
let g:user_emmet_install_global = 0
auto FileType ejs,html,css EmmetInstall


" let g:syntastic_javascript_checkers = ['standard']
" let g:syntastic_css_checkers = ['stylelint']

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

" Sort the rules with css-declaration-sorter, apply format fixes with cssfmt
" npm install -g cssfmt;
" npm install -g css-declaration-sorter;
function! CleanupCSS()
  exec ':0,$!cssfmt | cssdeclsort --order concentric-css'
endfunction
map <leader>c :call CleanupCSS()<cr>

set backspace=2
set hidden
set lazyredraw
set scrolloff=6
set autoread

set textwidth=80

set formatoptions=
set formatoptions+=c " Format comments
set formatoptions+=r " Continue comments by default
" set formatoptions+=o " Make comment when using o or O from comment line
" set formatoptions+=a " Automatic formatting of paragraphs.
set formatoptions+=q " Format comments with gq
" set formatoptions+=n " Recognize numbered lists
set formatoptions+=2 " Use indent from 2nd line of a paragraph
set formatoptions+=l " Don't break lines that are already long
set formatoptions+=1 " Break before 1-letter words
set formatoptions+=j " remove a comment leader when joining lines.
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

highlight TabLine cterm=underline ctermfg=130 ctermbg=NONE
highlight TabLineSel ctermbg=NONE ctermfg=NONE
highlight TabLineFill ctermbg=NONE cterm=NONE

highlight StatusLine cterm=underline ctermfg=130
highlight StatusLineNC cterm=underline ctermfg=130
highlight VertSplit cterm=NONE ctermbg=0 ctermfg=130
highlight LineNr ctermbg=0 ctermfg=130

" Set the vertical split character to space. Fold after to prevent trailing
" space removal.
set fillchars+=vert:\ ,fold:-

syntax enable

" Syntax coloring lines that are too long just slows down the world
set synmaxcol=2048

" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

au FileType javascript setl fen
au FileType javascript setl nocindent


" Shrink the current window to fit the number of lines in the buffer.  Useful
" for those buffers that are only a few lines
nmap <silent> ,sw :execute ":resize " . line('$')<cr>

set spell spelllang=en_us
highlight SpellLocal ctermbg=NONE
highlight SpellBad ctermbg=NONE cterm=undercurl
highlight SpellRare ctermbg=NONE cterm=undercurl

" map jk to esc
:imap jk <Esc>
