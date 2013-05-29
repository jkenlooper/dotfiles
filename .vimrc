" Enabled later, after Pathogen
filetype off

set cursorline " Highlight current line

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
set relativenumber " Use relative line numbers. Current line is still in status bar.
au BufReadPost,BufNewFile * set relativenumber

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
  set statusline=%<%f
  set statusline+=%w%h%m%r
  " set statusline+=%{fugitive#statusline()}
  " set statusline+=\ [%{getcwd()}]
  " set statusline+=%=%-14.(Line:\ %l\ of\ %L\ [%p%%]\ -\ Col:\ %c%V%)
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
highlight BadWhitespace ctermbg=red guibg=red

" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

au FileType javascript setl fen
au FileType javascript setl nocindent


syntax enable
set background=dark

" Emulate bundles, allow plugins to live independantly. Easier to manage.
execute pathogen#infect()
filetype plugin indent on

runtime macros/matchit.vim

let g:ycm_complete_in_comments = 1
let g:ycm_min_num_of_chars_for_completion = 2

colorscheme solarized
