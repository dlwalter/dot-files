"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Status Line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" The lightline.vim theme
" and add folder path to filename
let g:lightline = {
      \ 'colorscheme': 'one',
      \ }
set background=dark

let g:lightline = {
      \ 'component_function': {
      \   'filename': 'LightlineFilename'
      \ }
      \ }
function! LightlineFilename()
  return expand('%')
endfunction

