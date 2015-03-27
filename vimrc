set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Proven Plugins

Plugin 'gmarik/Vundle.vim'
Plugin 'tomasr/molokai'

" Learning Plugins - I know these but could be more facile

Plugin 'scrooloose/nerdtree'
Plugin 'mileszs/ack.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

" Plugins To Try (overwhelming to try too many at once...)

"Plugin 'corntrace/bufexplorer'
"Plugin 'bling/vim-airline'
"Plugin 'kien/ctrlp.vim'
"Plugin 'scrooloose/syntastic'
"Plugin 'Lokaltog/vim-easymotion'
"Plugin 'shawncplus/phpcomplete.vim'
"Plugin 'scrooloose/nerdcommenter'

call vundle#end()
filetype plugin indent on

" Search
set incsearch
set ignorecase
set smartcase
set hlsearch

set nu
set laststatus=2
set encoding=utf-8

hi link EasyMotionTarget ErrorMsg
hi link EasyMotionShade Comment

" Tabs as 4 spaces
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround

cabbrev W w
cabbrev Tabe tabe
cabbrev Wq x

nnoremap <silent> <Space> :noh<CR>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>nt :NERDTree<cr>
nnoremap <leader>nn :NERDTreeMirror<cr>
nnoremap <leader>nf :NERDTreeFind<cr>
nnoremap <leader>` :set paste!<cr>
nnoremap ; :

augroup general
    autocmd!
    autocmd FileType python     iabbrev <buffer> iff if:<left>
    autocmd FileType javascript iabbrev <buffer> iff if ()<left>
    autocmd FileType javascript nnoremap <buffer> <localleader>c I//<esc>
    autocmd BufRead *.md let tw=100
    autocmd BufWritePost .vimrc source $HOME/.vimrc
augroup END

"  Go support
"  TODO wrap this so it's only executed when go is installed
set rtp+=$GOROOT/misc/vim
autocmd BufWritePre *.go :Fmt

autocmd BufRead,BufNewFile *.go set filetype=go
autocmd BufRead,BufNewFile *.go set makeprg=go\ build\ %

let mapleader=";"
nnoremap <leader><space> :
nnoremap <silent> <leader>l :noh<CR>

" === Nerdtree shorcuts === "
nmap <leader>nt :NERDTree<CR>
nmap <leader>nf :NERDTreeFind<CR>

" Svn blame highlighted lines in visual mode
vmap gl :<C-U>!svn blame <C-R>=expand("%:p") <CR> \| sed -n <C-R>=line("'<") <CR>,<C-R>=line("'>") <CR>p <CR>

" not sure I'm really using this
if has("gui_running")
  if has("gui_gtk2")
    set guifont=InconsolataForPowerline\ 11
  elseif has("gui_macvim")
    set guifont=Inconsolata\ Regular:h14
  elseif has("gui_win32")
    set guifont=Consolas:h11:cANSI
  endif
endif

" Colors
set t_Co=256
if filereadable($HOME . "/.vim/bundle/molokai/colors/molokai.vim")
  colorscheme molokai
endif
