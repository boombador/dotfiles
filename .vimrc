set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'tomasr/molokai'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'gmarik/vundle'
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-fugitive'
Bundle 'bling/vim-airline'
Bundle 'plasticboy/vim-markdown'
Bundle 'corntrace/bufexplorer'
Bundle 'scrooloose/nerdcommenter'
Bundle 'tristen/vim-sparkup'

filetype plugin indent on "needed for vundle

" airline 
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"

set sw=4
syntax on

set autoindent
set ignorecase
set smartcase

set backspace=indent,eol,start

set ruler
set laststatus=2

set number
set pastetoggle=<F11>
set expandtab
set tabstop=4
set hlsearch

set t_ut=


" set relativenumber
" set wrap
" set numberwidth
set shiftround
" set matchtime=10
" set showmatch
" let mapleader = "-"
nnoremap <silent> <Space> :noh<CR>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>nt :NERDTree<cr>
nnoremap <leader>nn :NERDTreeMirror<cr>
nnoremap <leader>nf :NERDTreeFind<cr>
nnoremap <leader>` :set paste!<cr>
nnoremap ; :

cabbrev W w
cabbrev Tabe tabe
cabbrev Wq x

augroup general
    autocmd!
    autocmd FileType python     iabbrev <buffer> iff if:<left>
    autocmd FileType javascript iabbrev <buffer> iff if ()<left>
    autocmd FileType javascript nnoremap <buffer> <localleader>c I//<esc>
    autocmd BufRead *.md let tw=100
    autocmd BufWritePost .vimrc source $HOME/.vimrc
augroup END

" experimental

" how to make this conditional, maybe a command line argument and alias to vi
" would be good way to quickly check if configured
" echo "        "
" echo " ,.----."
" echo "( > 'o' )> blotto says \"Welcome to ian's vim\""
" echo " \\_____/"
" echo "  |   |"
" echo "  [>  [>"

set t_Co=256
colorscheme molokai
