"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Fuzzy Finder 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <C-f> <Esc><Esc>:Files!<CR>
inoremap <C-f> <Esc><Esc>:BLines!<CR>
map <C-g> <Esc><Esc>:BCommits!<CR>

" prevent fzf window when mistyping save
command! -nargs=* W w
