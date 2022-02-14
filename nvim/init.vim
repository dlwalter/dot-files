"______ _     _    _
"|  _  \ |   | |  | | Dave Walter
"| | | | |   | |  | | dlwalter@protonmail.com
"| | | | |   | |/\| | github.com/dlwalter
"| |/ /| |___\  /\  /
"|___/ \_____/\/  \/ 
"
" A customized init.vim for neovim (https://neovim.io/)
" {{ Inspired by DistroTube }}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible                " be iMproved, required
filetype off                    " required
set path+=**                    " Searches current directory recursively.
set wildmenu                    " Display all matches when tab complete.
set incsearch                   " Incremental search
set nobackup                    " No auto backups
set noswapfile                  " No swap
set t_Co=256                    " Set if term supports 256 colors.
set number relativenumber       " Display line numbers
syntax enable
let g:rehash256 = 1

set expandtab                   " Use spaces instead of tabs.
set smarttab                    " Be smart using tabs ;)
set shiftwidth=4                " One tab == four spaces.
set tabstop=4                   " One tab == four spaces.
set laststatus=2
set noshowmode
set mouse=nicr
set fillchars+=vert:\ 
set listchars=eol:¬,tab:>·,trail:␣,extends:>,precedes:<
set list

set termguicolors
let $NVIM_TUI_ENABLE_TRUE_COLOR=1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Open terminal inside Vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set shell=zsh\ -i
map <Leader>tt :vnew term://zsh<CR>
tnoremap <Esc> <C-\><C-n>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Remap Keys
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap ESC to jk 
:imap jk <Esc>

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Make adjusing split sizes a bit more friendly
noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize +3<CR>
noremap <silent> <C-Down> :resize -3<CR>

" Change 2 split windows from vert to horiz or horiz to vert
map <Leader>th <C-w>t<C-w>H
map <Leader>tk <C-w>t<C-w>K

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 " => Splits and Tabbed Files
 """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set splitbelow splitright

map <A-H> :sp 
map <A-v> :vs 

" Remap splits navigation to just ctrl+ hjkl
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" Removes pipes | that act as seperators on splits
"set fillchars+=vert:


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-plug For Managing Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

"{{ The Basics }}
    Plug 'itchyny/lightline.vim'                       " Lightline statusbar
    Plug 'frazrepo/vim-rainbow'
"{{ File management }}
    Plug 'scrooloose/nerdtree'                         " Nerdtree
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'     " Highlighting Nerdtree
    Plug 'ryanoasis/vim-devicons'                      " Icons for Nerdtree
"{{ Productivity }}
    Plug 'jreybert/vimagit'                            " Magit-like plugin for vim
    Plug 'tpope/vim-repeat'
    Plug 'ggandor/lightspeed.nvim'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'airblade/vim-gitgutter'
    Plug 'sheerun/vim-polyglot'
    Plug 'sbdchd/neoformat'
"{{ Tim Pope Plugins }}
    Plug 'tpope/vim-surround'                          " Change surrounding marks
    Plug 'numToStr/comment.nvim'
" {{ Color Schemes }}
    Plug 'EdenEast/nightfox.nvim'
    " Plug 'wojciechkepka/vim-github-dark'
    " Plug 'https://github.com/freeo/vim-kalisi'
    " Plug 'https://github.com/rakr/vim-one'
"{{ Junegunn Choi Plugins }}
    Plug 'junegunn/fzf.vim', {'do': { -> fzf#install() } }
    Plug 'junegunn/fzf'
    Plug 'junegunn/fzf.vim'
"{{ lsp-config }}
    Plug 'neovim/nvim-lspconfig'
"{{ nvim-cmp autocomplete }}
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-cmdline'
    Plug 'hrsh7th/nvim-cmp'
"{{ snippit engine }}
    Plug 'hrsh7th/cmp-vsnip'
    Plug 'hrsh7th/vim-vsnip'


call plug#end()


filetype plugin indent on    " required
let g:instant_markdown_autostart = 1
" To ignore plugin indent changes, instead use:
" filetype plugin on

" Brief help
" :PlugInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PlugSearch foo - searches for foo; append `!` to refresh local cache
" :PlugClean      - confirms removal of unused plugins; append `!` to auto-approve removal
" set plugin configurations
"source ~/.config/nvim/plug-config/colorscheme-config.vim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 " => SilverSearcher(Ag)
 """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ag: Start ag in the specified directory e.g. :Ag ~/foo
function! s:ag_in(bang, ...)
    if !isdirectory(a:1)
        throw 'not a valid directory: ' .. a:1
    endif
    " Press `?' to enable preview window.
    call fzf#vim#ag(join(a:000[1:], ' '),
                \ fzf#vim#with_preview({'dir': a:1}, 'right:50%', '?'), a:bang)
endfunction

" Ag call a modified version of Ag where first arg is directory to search
command! -bang -nargs=+ -complete=dir Ag call s:ag_in(<bang>0, <f-args>)


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 " => Configuration Scripts
 """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
source ~/.config/nvim/plug-config/lightline-config.vim
source ~/.config/nvim/plug-config/nerdtree-config.vim
source ~/.config/nvim/plug-config/rainbow-config.vim
source ~/.config/nvim/plug-config/fzf-config.vim
source ~/.config/nvim/lua/colorscheme-config.lua
source ~/.config/nvim/lua/lightspeed-config.lua
source ~/.config/nvim/lua/comment/comment-config.lua
source ~/.config/nvim/lua/lsp/lsp-config.lua
source ~/.config/nvim/lua/lsp/cmp-config.lua
source ~/.config/nvim/plug-config/lsp-config.vim

