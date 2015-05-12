set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Proven Plugins

Plugin 'gmarik/Vundle.vim'
Plugin 'tomasr/molokai'

" Learning Plugins

Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'fatih/vim-go'
Plugin 'mileszs/ack.vim'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'pangloss/vim-javascript'

" Plugins To Try

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

let mapleader=";"
nnoremap <silent> <leader>l :noh<CR>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>` :set paste!<cr>

nnoremap <leader>nt :NERDTreeToggle<CR>
nnoremap <leader>nf :NERDTreeFind<CR>
nnoremap <leader>nn :NERDTreeMirror<cr>

augroup general
    autocmd!
    autocmd FileType python     iabbrev <buffer> iff if:<left>
    autocmd FileType javascript iabbrev <buffer> iff if ()<left>
    autocmd FileType javascript nnoremap <buffer> <localleader>c I//<esc>
    autocmd BufRead *.md let tw=100
augroup END

"  Go support
"  TODO wrap this so it's only executed when go is installed
set rtp+=$GOROOT/misc/vim
autocmd BufWritePre *.go :Fmt

autocmd BufRead,BufNewFile *.go set filetype=go
autocmd BufRead,BufNewFile *.go set makeprg=go\ build\ %


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
