" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.config/nvim/plugged/')

Plug 'arcticicestudio/nord-vim'
Plug 'scrooloose/nerdTree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf'

" Initialize plugin system
call plug#end()

set number

colorscheme nord

let g:lightline = {'colorscheme': 'nord',}


nmap <C-n> :NERDTreeToggle<CR>
