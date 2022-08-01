"
" ___  ___      _   _  __
" |  \/  |     | | (_)/ _|
" | .  . | ___ | |_ _| |     
" | |\/| |/ _ \| __| |  _|   Carl Emmanuel (MotifTechServices)
" | |  | | (_) | |_| | |     https://github.com/Motif23/
" \_|  |_/\___/ \__|_|_|
"
" My plug-settings.vim file. Nothing really special; some light customizations and some eye candy.

"{{{ Colorscheme
"============================================================================
" => Colorschemes
"============================================================================

let g:colors_name = 'wal'

"============================================================================
" => Colorschemes Ends
"============================================================================
"}}}


"{{{ Startify
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
" => Vim-Startify Ends
"============================================================================
"}}}


"{{{ NerdTree
"============================================================================
" => NerdTree
"============================================================================

" If another buffer tries to replace NERDTree, put it in the other window
"======
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" Start NERDTree and put the cursor back in the other window.
"======
"autocmd VimEnter * NERDTree | wincmd p

" Start NERDTree when Vim is started without file arguments.
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif



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
" => NerdTree Ends
"============================================================================
"}}}


"{{{ Airline
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
" => Vim-Airline
"============================================================================
"}}}


"{{{ Gitgutter
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
" => Vim-Gitgutter
"============================================================================
"}}}


"{{{ Vimwiki
"============================================================================
" => VimWiki
"============================================================================

let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'ext': '.wiki'},
                      \ {'path': '/home/carl/vimwiki_carl/',
                      \ 'ext': '.md'}]

let g:vimwiki_ext2syntax = {'.md': 'markdown', '.wiki': 'markdown'}

"============================================================================
" => VimWiki Ends
"============================================================================
"}}}


"{{{ Taskwiki
"============================================================================
" => Taskwiki
"============================================================================

let g:taskwiki_markup_syntax = 'markdown'
let g:markdown_folding = 1

"============================================================================
" => Taskwiki
"============================================================================
"}}}


"{{{ Markdown-Preview
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

"let g:mkdp_browserfunc = 'OpenMarkdownPreview'

nmap <C-p> <Plug>MarkdownPreview
nmap <C-s> <Plug>MarkdownPreviewStop
nmap <C-r> <Plug>MarkdownPreviewToggle

"============================================================================
" => Markdown-Preview Ends
"============================================================================
"}}}


"{{{ Silver Surfer
"============================================================================
" => The silver surfer - for fzf
"============================================================================

let g:ackprg = 'ag --nogroup --nocolor --column'
" https://github.com/ggreer/the_silver_searcher

"============================================================================
" => The silver surfer - for fzf Ends
"============================================================================
"}}}
