" The vimrc for Jake Hickenlooper. Use at your own risk ;)

" UPKEEP due: "2023-10-25" label: "vim-plug" interval: "+8 months"
" Auto download and load vim-plug after validating the checksum.
" https://github.com/junegunn/vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!mkdir -p '.data_dir.'/autoload'
  silent execute '!wget -q -O '.data_dir.'/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/0.11.0/plug.vim'
  execute '!echo a90d94d8ff8bdb78583ba2d5f648e084255c1e78a1362195542d87a6b504d27d8a57cbe9436541c3b43c4d483f10175e3293179068bba6a807f8a874c713d313  '.data_dir.'/autoload/plug.vim | sha512sum -c || (mv '.data_dir.'/autoload/plug.vim '.data_dir.'/autoload/plug.vim.INVALID && exit 1)'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

" vim-polyglot disabled opts need to be set first
" Fix for #303 issue when opening js files
let g:polyglot_disabled = ['graphql']

call plug#begin()

" UPKEEP due: "2023-10-25" label: "mhinz/vim-signify" interval: "+8 months"
" https://github.com/mhinz/vim-signify
Plug 'mhinz/vim-signify', { 'commit': 'a05e63ba72411977f5087c27c1564c9287bfab66' }

" UPKEEP due: "2023-10-25" label: "ALE" interval: "+8 months"
" https://github.com/dense-analysis/ale/releases
Plug 'dense-analysis/ale', { 'commit': '31010ad1d1358f14c7025168f529a0f6e512138e' }

" UPKEEP due: "2023-10-25" label: "vim-surround" interval: "+8 months"
" https://github.com/tpope/vim-surround
Plug 'tpope/vim-surround', { 'commit': '3d188ed2113431cf8dac77be61b842acb64433d9' }

" UPKEEP due: "2023-10-25" label: "editorconfig-vim" interval: "+8 months"
" https://github.com/editorconfig/editorconfig-vim
Plug 'editorconfig/editorconfig-vim', { 'commit': '1d54632f7fcad38df8e428f349bc58b15af4b206' }

" Using Deno and ALE instead.
" Plug 'Quramy/tsuquyomi'
" Using vim-polyglot
" Plug 'leafgarland/typescript-vim'

" UPKEEP due: "2023-10-25" label: "vim-polyglot" interval: "+8 months"
" https://github.com/sheerun/vim-polyglot
Plug 'sheerun/vim-polyglot', { 'commit': 'bc8a81d3592dab86334f27d1d43c080ebf680d42' }

" UPKEEP due: "2025-02-26" label: "closetag.vim" interval: "+2 years"
" https://github.com/docunext/closetag.vim
Plug 'docunext/closetag.vim', { 'commit': 'a52525b7220bb28309d1905108e9e8914fdb4112' }

" UPKEEP due: "2023-10-25" label: "preservim/vim-indent-guides" interval: "+8 months"
" https://github.com/preservim/vim-indent-guides
Plug 'preservim/vim-indent-guides', { 'commit': '9a106c73f64b16f898276ca87cd55326a2e5cf4c' }

" UPKEEP due: "2023-10-25" label: "psf/black" interval: "+8 months"
" https://github.com/psf/black
Plug 'psf/black', { 'commit': '4bb6e4f64ab3820ab9fae6716cd59479d34b7edf' }

" All of your Plugins must be added before the following line
call plug#end()

set updatetime=100

" Use true color
" https://deductivelabs.com/en/2016/03/using-true-color-vim-tmux/
" let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Be boring and only use 16 colors
set t_Co=16
set notermguicolors

let g:indent_guides_auto_colors = 0
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_default_mapping = 1 " <Leader>ig
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree', 'text']
highlight IndentGuidesOdd ctermbg=NONE
highlight IndentGuidesEven ctermbg=0

highlight IncSearch cterm=None ctermfg=0 ctermbg=9
highlight Search cterm=underline ctermfg=0 ctermbg=9

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
" let g:ale_echo_cursor = 1
" let g:ale_cursor_detail = 0
" augroup ale_hover_cursor
"   autocmd!
"   autocmd CursorHold * ALEHover
" augroup END

let g:ale_linters = {
\   'markdown': ['prettier'],
\   'html': ['prettier'],
\   'typescript': ['deno'],
\   'javascript': ['deno'],
\   'css': ['prettier'],
\}
let g:ale_fixers = {
\   'markdown': ['prettier'],
\   'html': ['prettier'],
\   'typescript': ['deno'],
\   'javascript': ['deno'],
\   'css': ['prettier'],
\}
let g:ale_pattern_options = {
\   '\.cloudformation\.yaml$': {'ale_linters': ['cfn-lint'], 'ale_fixers': ['cfn-lint']},
\}

let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1
" let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 1

" let g:typescript_compiler_binary = 'npm run tsc --'
let g:typescript_compiler_options = '--noEmit --allowJs'

" Set filetype as typescript for javascript so jsdoc comments have better syntax
" coloring.
autocmd BufRead,BufNewFile *.js :set filetype=javascript
autocmd BufRead,BufNewFile *.mjs :set filetype=javascript

autocmd BufRead,BufNewFile *.ts :set filetype=typescript
" autocmd FileType typescript :set makeprg=tsc

autocmd BufRead,BufNewFile *.jinja2 :set filetype=jinja2

autocmd BufRead,BufNewFile *.config :set filetype=config

autocmd BufRead,BufNewFile *.sh :set filetype=bash

autocmd BufRead,BufNewFile *.nginx.conf.template :set filetype=nginx

autocmd BufRead,BufNewFile *.dockerfile :set filetype=dockerfile

" set leader key to space
let mapleader = " "

" Just use builtin file explorer instead :Explore
"" rename current file, via Gary Bernhardt
" function! RenameFile()
"   let old_name = expand('%')
"   let new_name = input('New file name: ', expand('%'))
"   if new_name != '' && new_name != old_name
"     exec ':saveas ' . new_name
"     exec ':silent !rm ' . old_name
"     redraw!
"   endif
" endfunction
" map <leader>N :call RenameFile()<cr>

" Sort the rules with css-declaration-sorter, apply format fixes with cssfmt
" npm install -g cssfmt;
" npm install -g css-declaration-sorter@v2.1.0
" function! CleanupCSS()
"   exec ':0,$!cssfmt | cssdeclsort --order concentric-css'
" endfunction
" map <leader>c :call CleanupCSS()<cr>

set backspace=indent,eol,start
set hidden

" Save marks and jumps when exiting vim
set viminfo='100,f1

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
" set nonumber " Don't show the current line number. Use 0 instead.
set relativenumber " Use relative line numbers. Current line is still in status bar.
" au BufReadPost,BufNewFile * set relativenumber
set number " Show current line number
" set norelativenumber
" au BufReadPost,BufNewFile * set number
let g:netrw_bufsettings="noma nomod nonu nobl nowrap ro rnu"

set mouse=
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
set splitright
" All line endings are unix
" vim-plug complains when installing plugins when this is set?
" set fileformat=unix
set nowrapscan

set complete=.,w,b,kspell

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
  set statusline=%<%F\ %Y\ %h%m%r%=%-14.(%l,%c%V%)\ %L\ %P
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
highlight ColorColumn ctermbg=0
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

highlight SignifySignAdd    ctermfg=white  guifg=#ffffff cterm=NONE gui=NONE
highlight SignifySignDelete ctermfg=red    guifg=#ff0000 cterm=NONE gui=NONE
highlight SignifySignChange ctermfg=yellow guifg=#ffff00 cterm=NONE gui=NONE
let g:signify_sign_add               = '+'
let g:signify_sign_delete            = '_'
let g:signify_sign_delete_first_line = '‾'
let g:signify_sign_change            = '~'
let g:signify_sign_change_delete     = g:signify_sign_change . g:signify_sign_delete_first_line

highlight Folded ctermbg=0

" Set the visual mode highlighting to be less annoying
highlight Visual cterm=None ctermfg=0 ctermbg=8

highlight MatchParen ctermbg=None cterm=underline ctermfg=None

" Set the vertical split character to space. Fold after to prevent trailing
" space removal.
set fillchars+=vert:\ ,fold:-

" Syntax coloring lines that are too long just slows down the world
set synmaxcol=3000

" Display tabs at the beginning of a line in Python mode as bad.
"au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
"au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" au FileType javascript setl fen
" au FileType javascript setl nocindent

" Don't parse modelines (google "vim modeline vulnerability").
set nomodeline

set nospell
au BufRead,BufNewFile *.md,*.txt set spell spelllang=en_us
highlight SpellBad ctermbg=NONE cterm=undercurl
highlight SpellCap ctermbg=NONE cterm=undercurl
highlight SpellRare ctermbg=NONE cterm=undercurl
highlight SpellLocal ctermbg=NONE cterm=undercurl

" I no longer hold down hjkl keys.
" " Force using motions instead of holding down hjkl keys.
" noremap hh <nop>
" noremap jj <nop>
" noremap kk <nop>
" noremap ll <nop>
" " Kill practical use of leader keys so noremap of hjkl will be more responsive
" set timeoutlen=100

" autosave on text change for these files. This is handy when using some other
" software that is actively monitoring these files for changes (OBS for example).
autocmd BufNewFile,BufRead *.chat.txt :autocmd TextChanged,TextChangedI <buffer> silent write

" Allow quickly writing a message to the session.chat.txt
" nnoremap <C-k> :terminal ++hidden tm<cr>
nnoremap <silent> <C-k> :terminal ++hidden tmux split-window -v -l 3 "vim + --clean ~/session.chat.txt"<cr>
