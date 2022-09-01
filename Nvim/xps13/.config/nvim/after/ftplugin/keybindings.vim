"
" ___  ___      _   _  __
" |  \/  |     | | (_)/ _|
" | .  . | ___ | |_ _| |     
" | |\/| |/ _ \| __| |  _|   Carl Emmanuel (MotifTechServices)
" | |  | | (_) | |_| | |     https://github.com/Motif23/
" \_|  |_/\___/ \__|_|_|
"
" My keybindings.vim file. Nothing really special; some light customizations and some eye candy.

"============================================================================
" => KeyBindings
"============================================================================

"{{{ Leader Key
" Change the leader key from "\" to " "
let mapleader=" "
"}}}

"{{{ Vimwiki Keybindings
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
"}}}

"{{{ Vim-Floaterm
let g:floaterm_keymap_toggle='<F5>'
let g:floaterm_keymap_next='<F6>'
let g:floaterm_keymap_prev='<F4>'
let g:floaterm_keymap_new='<Leader>ft'
let g:floaterm_keymap_kill='<Leader>fk'
"}}}

"{{{ Tabs
nnoremap <C-Left>   :tabprevious<CR>
nnoremap <C-Right>  :tabnext<CR>
nnoremap <C-Down>	:tabclose<CR>
"}}}

"{{{ Folds
nnoremap <C-c>	:foldclose<CR>
nnoremap <C-o>	:foldopen<CR>
nnoremap <C-f>	:fold<CR>

"{{{ Markdown-Preview
nmap <C-p> <Plug>MarkdownPreview
nmap <C-s> <Plug>MarkdownPreviewStop
nmap <C-r> <Plug>MarkdownPreviewToggle
"}}}

"{{{ Gitgutter
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)
"}}}

"============================================================================
" => Keybindings End
"============================================================================
