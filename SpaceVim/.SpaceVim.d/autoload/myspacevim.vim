#
# ___  ___      _   _  __
# |  \/  |     | | (_)/ _|
# | .  . | ___ | |_ _| |
# | |\/| |/ _ \| __| |  _|   Carl Emmanuel (MotifTechServices)
# | |  | | (_) | |_| | |     https://github.com/Motif23/
# \_|  |_/\___/ \__|_|_|
#
# My spacevim/vim settings. Nothing really special; some light customizations and some eye candy.


"=============================================================================
" My Custom Vim Settings
"=============================================================================
function! myconfig#after() abort
"=============================================================================
" Personal Settings
"=============================================================================
set wrap
set textwidth=80
set nohlsearch
set incsearch
set history=1000
set encoding=utf-8
set wildmenu					          " Display all matches when tab complete.
set nobackup                    " No auto backups
set t_Co=256                    " Set if term supports 256 colors.


"=============================================================================
" Custom Keybindings
"=============================================================================


"=============================================================================
endfunction
"=============================================================================

"=============================================================================
" More Custom Vim Settings
"=============================================================================
function! myconfig#before() abort
"=============================================================================
" Airline
"=============================================================================
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='dark'
let g:airline#extensions#coc#enabled = 1
" let g:airline_section_x = '%{ScrollStatus()} '

"=============================================================================
" ScrollStatus
"=============================================================================
" let g:scrollstatus_size = 12
" let g:scrollstatus_symbol_track = '-'
" let g:scrollstatus_symbol_bar = '|'

"=============================================================================
" Vim Rainbow
"=============================================================================
let g:rainbow_active = 1

"=============================================================================
" Moloki-Dark
"=============================================================================
" let g:molokaidark_undercolor_gui = 1
" let g:molokaidark_undercolor_cterm = 0

"=============================================================================
endfunction
