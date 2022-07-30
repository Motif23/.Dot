"
" ___  ___      _   _  __
" |  \/  |     | | (_)/ _|
" | .  . | ___ | |_ _| |     
" | |\/| |/ _ \| __| |  _|   Carl Emmanuel (MotifTechServices)
" | |  | | (_) | |_| | |     https://github.com/Motif23/
" \_|  |_/\___/ \__|_|_|
"
" My init.vim file. Nothing really special; some light customizations and some eye candy.

"============================================================================
" => Setup Start
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
" set spell                 " enable spell check
" set noswapfile            " disable creating swap file
" set backupdir=~/.cache/vim " Directory to store backup files.

"============================================================================
" => Plugins Start
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

Plug 'ryanoasis/vim-devicons'  " Devicon support for nerdtree
" https://github.com/ryanoasis/vim-devicons

" Plug 'akinsho/toggleterm.nvim', {'tag' : 'v2.*'} " Toggle terminal(s)
" https://github.com/akinsho/toggleterm.nvim

call plug#end()

"============================================================================
" => Vim-Startify
"============================================================================

let g:startify_custom_header =
       \ startify#pad(split(system('figlet -w 100 NEOVIM'), '\n'))

" Show modified and untracked git files
"======
function! s:gitModified()
    let files = systemlist('git ls-files -m 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

" Same as above, but show untracked files, honouring .gitignore
"======
function! s:gitUntracked()
    let files = systemlist('git ls-files -o --exclude-standard 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

let g:startify_bookmarks = [
        \ { 'b': '~/.bash_aliases' },
        \ { 'f': '~/.config/fish/alias.fish' },
        \ '~/.Dot',
        \ { 'v': '~/.config/nvim/init.vim' },
        \ ]

let g:startify_lists = [
        \ { 'header': ['   Bookmarks'],     'type': 'bookmarks' },
        \ { 'header': ['   MRU'],       'type': 'files' },
        \ { 'header': ['   MRU '. getcwd()],        'type': 'dir' },
        \ { 'header': ['   Git Modified'],      'type': function('s:gitModified') },
        \ { 'header': ['   git untracked'],     'type': function('s:gitUntracked') },
        \ { 'type': 'commands',  'header': ['   Commands']       },
        \ ]

"============================================================================
" => NerdTree
"============================================================================

" If another buffer tries to replace NERDTree, put it in the other window
"======
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" Start NERDTree and put the cursor back in the other window.
"======
autocmd VimEnter * NERDTree | wincmd p

" Exit Vim if NERDTree is the only window remaining in the only tab.
"======
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

nnoremap <C-u> :NERDTreeFocus<CR>
nnoremap <C-d> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

let NERDTreeShowHidden=1    " Show hidden files by default
let g:NERDTreeDirArrowExpandable="►"
let g:NERDTreeDirArrowCollapsible="▼"

"============================================================================
" => Vim-Airline
"============================================================================

let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" airline symbols
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='simple'

let g:airline#extensions#tabline#formatter = 'default'

"============================================================================
" => Vim-Gitgutter
"============================================================================

nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)

" Turn these options on/off by default
"let g:gitgutter_enabled = 0    " To turn off vim-gitgutter
"let g:gitgutter_signs = 0   " To turn off signs
"let g:gitgutter_highlight_lines = 1 " To turn on line highlighting
"let g:gitgutter_highlight_linenrs = 1 " To turn on line number highlighting

"============================================================================
" => Colorschemes
"============================================================================

let g:colors_name = 'wal'

"============================================================================
" => VimWiki
"============================================================================

let wiki_1 = {}
let wiki_1.path = '~/vimwiki/'
let wiki_1.syntax = 'markdown'
let wiki_1.ext = '.md'

let wiki_2 = {}
let wiki_2.path = '~/vimwiki_jw/'
let wiki_2.syntax = 'markdown'
let wiki_2.ext = '.md'

let g:vimwiki_list = [wiki_1, wiki_2]

let g:vimwiki_ext2syntax = {'.wiki': 'markdown', '.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}

" Makes vimwiki markdown links as [text](text.md) instead of [text](text)
let g:vimwiki_markdown_link_ext = 1

"============================================================================
" => Taskwiki
"============================================================================

let g:taskwiki_markup_syntax = 'markdown'
let g:markdown_folding = 1

"============================================================================
" => Markdown-Preview
"============================================================================

"let g:mkdp_refresh_slow = 0 " refreshes markdown after save/exit, set 1
let g:mkdp_command_for_global = 1   " MarkdownPreview used for all files 
"set updatetime=100"

let g:mkdp_preview_options = {
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false,
    \ 'disable_filename': 0,
    \ 'toc': {}
    \ }

" CLI options to the browser, like opening in a new window "
  function OpenMarkdownPreview (url)
    execute "silent ! firefox --new-window " . a:url
  endfunction
let g:mkdp_browserfunc = 'OpenMarkdownPreview'

nmap <C-p> <Plug>MarkdownPreview
nmap <C-s> <Plug>MarkdownPreviewStop
nmap <C-r> <Plug>MarkdownPreviewToggle

"============================================================================
" => Key-Bindings
"============================================================================

" Change the leader key from "\" to ";"
let mapleader=";"

" Vimwiki Basic Key Bindings
" <Leader>ww -- Open default wiki index file.
" <Leader>wt -- Open default wiki index file in a new tab.
" <Leader>ws -- Select and open wiki index file.
" <Leader>wd -- Delete wiki file you are in.
" <Leader>wr -- Rename wiki file you are in.
" <Enter> -- Follow/Create wiki link.
" <Shift-Enter> -- Split and follow/create wiki link.
" <Ctrl-Enter> -- Vertical split and follow/create wiki link.
" <Backspace> -- Go back to parent(previous) wiki link.
" <Tab> -- Find next wiki link.
" <Shift-Tab> -- Find previous wiki link.
" :help vimwiki-commands -- List all commands.
" :help vimwiki -- General vimwiki help docs.

"============================================================================
" => End of Config
"============================================================================
