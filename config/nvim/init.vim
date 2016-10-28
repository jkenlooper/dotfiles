call plug#begin()

" Make sure you use single quotes

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Add plugins to &runtimepath
call plug#end()


" Use deoplete.
let g:deoplete#enable_at_startup = 1

" Use true color
" https://deductivelabs.com/en/2016/03/using-true-color-vim-tmux/
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

