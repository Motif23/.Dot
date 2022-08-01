"
" ___  ___      _   _  __
" |  \/  |     | | (_)/ _|
" | .  . | ___ | |_ _| |     
" | |\/| |/ _ \| __| |  _|   Carl Emmanuel (MotifTechServices)
" | |  | | (_) | |_| | |     https://github.com/Motif23/
" \_|  |_/\___/ \__|_|_|
"
" My plugs.vim file. Nothing really special; some light customizations and some eye candy.

"============================================================================
" => Plugins
"============================================================================

call plug#begin()

Plug 'preservim/nerdtree'	" File Explorer
" https://github.com/preservim/nerdtree

Plug 'mhinz/vim-startify'   " Start page
" https://github.com/mhinz/vim-startify#installation-and-documentation

Plug 'neoclide/coc.nvim', {'branch': 'release'} " Fast code completion engine
" https://github.com/neoclide/coc.nvim

Plug 'vim-airline/vim-airline' " Status bar
" https://github.com/vim-airline/vim-airline

Plug 'vim-airline/vim-airline-themes' " Status bar themes
" https://github.com/vim-airline/vim-airline

Plug 'airblade/vim-gitgutter' " Shows a git diff in the sign column
" https://github.com/airblade/vim-gitgutter

Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
" https://github.com/ap/vim-css-color

Plug 'dylanaraps/wal.vim'   " Pywal
" https://github.com/dylanaraps/wal.vim

Plug 'tbabej/taskwiki'	" Proper project management 
" https://gitlab.com/tbabej/taskwiki

Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }     " Preview markdown
" https://github.com/iamcco/markdown-preview.nvim

Plug 'vimwiki/vimwiki'  " Personal wiki for Vim
" https://github.com/vimwiki/vimwiki

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }     " Search-tree replacement
Plug 'junegunn/fzf.vim'
" https://github.com/junegunn/fzf.vim

Plug 'ryanoasis/vim-devicons'  " Devicon support for nerdtree
" https://github.com/ryanoasis/vim-devicons

" Plug 'akinsho/toggleterm.nvim', {'tag' : 'v2.*'} " Toggle terminal(s)
" https://github.com/akinsho/toggleterm.nvim

call plug#end()

"============================================================================
" => Plugins End
"============================================================================