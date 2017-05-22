set expandtab
set tabstop=2
set backspace=2
set sw=2
set nu
set ruler
set nowrap
set mouse=a
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
set encoding=utf-8

syntax on
filetype indent plugin on
colorscheme grb256

map <F5> :set nowrap! <CR>
map <F4> :set hlsearch! hlsearch? <CR>
map <F9> :! carlos sync <CR><CR>

" Map save
nmap <c-s> :w<CR>
" Map save and exit
nmap <c-x> :x<CR>

" Map move around windows.
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" easier moving of code blocks
vnoremap < <gv
vnoremap > >gv

" Undo
set hidden
set undodir=~/.vim/undo
set undofile
set undolevels=1000
set undoreload=10000

" Swap
set directory=$HOME/.vim/swapfiles//

" Powerline
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup
set laststatus=2
