"
" ___  ___      _   _  __
" |  \/  |     | | (_)/ _|
" | .  . | ___ | |_ _| |     
" | |\/| |/ _ \| __| |  _|   Carl Emmanuel (MotifTechServices)
" | |  | | (_) | |_| | |     https://github.com/Motif23/
" \_|  |_/\___/ \__|_|_|
"
" My nvim-setup.vim file. Nothing really special; some light customizations and some eye candy.

"============================================================================
" => Nvim Setup
"============================================================================

set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching 
set ignorecase              " case insensitive 
set mouse=v                 " middle-click paste with 
set hlsearch                " highlight search 
set incsearch               " incremental search
set tabstop=4               " number of columns occupied by a tab 
set softtabstop=4           " see multiple spaces as tabstops
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line
set number                  " add line numbers
set relativenumber			" enable the relative line numbering
set wildmode=longest,list   " get bash-like tab completions
filetype plugin indent on   "allow auto-indenting depending on file type
syntax on                   " syntax highlighting
set mouse=a                 " enable mouse click
set clipboard=unnamedplus	" using system clipboard
filetype plugin on
set cursorline              " highlight current cursorline
set ttyfast                 " Speed up scrolling in Vim
set foldmethod=marker       " Fold with a marker
" set spell                 " enable spell check
" set noswapfile            " disable creating swap file
" set backupdir=~/.cache/vim " Directory to store backup files.

"============================================================================
" => Nvim Setup Ends
"============================================================================