" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Autocompletion
Plugin 'ajh17/VimCompletesMe'

Plugin 'airblade/vim-gitgutter'

Plugin 'mattn/emmet-vim'
" Plugin 'scrooloose/nerdtree'
Plugin 'w0rp/ale'
Plugin 'tpope/vim-surround'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'Quramy/tsuquyomi'

Plugin 'sheerun/vim-polyglot'
Plugin 'leafgarland/typescript-vim'
Plugin 'docunext/closetag.vim'

Plugin 'nathanaelkane/vim-indent-guides'

Plugin 'psf/black'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

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
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_default_mapping = 1 " <Leader>ig
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree']
highlight IndentGuidesOdd ctermbg=NONE
highlight IndentGuidesEven ctermbg=0

highlight SignColumn ctermbg=0
highlight GitGutterAdd ctermbg=0
highlight GitGutterChange ctermbg=0
highlight GitGutterDelete ctermbg=0

highlight ALEError ctermbg=0
highlight ALEErrorLine ctermbg=NONE
highlight ALEInfo ctermbg=0
highlight ALEInfoLine ctermbg=NONE
highlight ALEStyleError ctermbg=0
highlight ALEStyleWarning ctermbg=0
highlight ALEWarning ctermbg=0
highlight ALEWarningLine ctermbg=NONE
let g:ale_set_highlights = 1
" for performance reasons set this to a longer delay
let g:ale_echo_delay = 500

let g:ale_linters = {
\   'markdown': ['prettier'],
\   'html': ['prettier'],
\   'typescript': ['prettier'],
\   'javascript': ['prettier'],
\   'css': ['prettier'],
\}
let g:ale_fixers = {
\   'markdown': ['prettier'],
\   'html': ['prettier'],
\   'typescript': ['prettier'],
\   'javascript': ['prettier'],
\   'css': ['prettier'],
\}

let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1
" let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 1

" let g:typescript_compiler_binary = 'npm run tsc --'
let g:typescript_compiler_options = '--noEmit --allowJs'

" Fix for #303 issue when opening js files
let g:polyglot_disabled = ['graphql']

" Set filetype as typescript for javascript so jsdoc comments have better syntax
" coloring.
autocmd BufRead,BufNewFile *.js :set filetype=typescript
autocmd BufRead,BufNewFile *.mjs :set filetype=typescript

autocmd BufRead,BufNewFile *.ts :set filetype=typescript
" autocmd FileType typescript :set makeprg=tsc

autocmd BufWritePre *.py execute ':Black'

autocmd BufRead,BufNewFile *.jinja2 :set filetype=jinja2

autocmd BufRead,BufNewFile *.config :set filetype=config

" emmet-vim
" unmap <C-y>
" let g:user_emmet_leader_key='<C-Y>'
" Set the leader key to ',' which makes the expansion be ',,'
let g:user_emmet_leader_key=','
" let g:user_emmet_mode='a'
let g:user_emmet_install_global = 0
auto FileType ejs,html,jinja,css EmmetInstall

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
" npm install -g css-declaration-sorter@v2.1.0
function! CleanupCSS()
  exec ':0,$!cssfmt | cssdeclsort --order concentric-css'
endfunction
map <leader>c :call CleanupCSS()<cr>

set backspace=indent,eol,start
set hidden

" Make :find more useful when finding a file in the project directory.
set path+=**
set wildmenu
set wildignore+=**/node_modules/**

set lazyredraw
set scrolloff=0
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
set nonumber " Don't show the current line number. Use 0 instead.
set relativenumber " Use relative line numbers. Current line is still in status bar.
" au BufReadPost,BufNewFile * set relativenumber
" set number
" set norelativenumber
" au BufReadPost,BufNewFile * set number

set mouse=a
set autoindent
set history=50
set ruler
set incsearch
set showcmd
set hlsearch
set nobackup
set tabstop=2
set shiftwidth=0
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

au BufRead,BufNewFile *.yaml,*yml set tabstop=2
au BufRead,BufNewFile *.yaml,*yml set expandtab

au BufRead,BufNewFile *.rst set tabstop=4
au BufRead,BufNewFile *.rst set expandtab

au BufRead,BufNewFile *.py,*.pyw set expandtab
au BufRead,BufNewFile *.py,*.pyw set tabstop=4

highlight TabLine cterm=underline ctermfg=5 ctermbg=NONE
highlight TabLineSel ctermbg=NONE ctermfg=NONE
highlight TabLineFill ctermbg=NONE cterm=NONE

highlight StatusLine cterm=None ctermfg=0 ctermbg=7
highlight StatusLineNC cterm=None ctermfg=7 ctermbg=0
highlight VertSplit cterm=NONE ctermbg=0 ctermfg=5
highlight LineNr ctermbg=0 ctermfg=7
highlight CursorLine cterm=None ctermbg=NONE ctermfg=NONE
highlight clear CursorLine
highlight CursorLineNR cterm=None ctermbg=7 ctermfg=0
" highlight CursorColumn cterm=NONE ctermbg=0 ctermfg=NONE

augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  " au VimEnter,WinEnter,BufWinEnter * setlocal cursorcolumn
  au WinLeave * setlocal nocursorline
  " au WinLeave * setlocal nocursorcolumn
augroup END

highlight Folded ctermbg=0

" Set the visual mode highlighting to be less annoying
highlight Visual cterm=NONE ctermfg=NONE ctermbg=0

highlight MatchParen ctermbg=None cterm=underline ctermfg=None

" Set the vertical split character to space. Fold after to prevent trailing
" space removal.
set fillchars+=vert:\ ,fold:-

syntax enable

" Syntax coloring lines that are too long just slows down the world
set synmaxcol=600

" Display tabs at the beginning of a line in Python mode as bad.
"au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
"au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" au FileType javascript setl fen
" au FileType javascript setl nocindent


" Shrink the current window to fit the number of lines in the buffer.  Useful
" for those buffers that are only a few lines
nmap <silent> ,sw :execute ":resize " . line('$')<cr>

au BufRead,BufNewFile *.md,*.txt set spell spelllang=en_us
highlight SpellLocal ctermbg=NONE
highlight SpellBad ctermbg=NONE cterm=undercurl
highlight SpellRare ctermbg=NONE cterm=undercurl

" map jk to esc
:imap jk <Esc>
