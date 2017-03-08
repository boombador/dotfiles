" {{{ Vundle Plugins and Init
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Passive upgrades
Plugin 'gmarik/Vundle.vim'
Plugin 'bling/vim-airline'
"Plugin 'scrooloose/syntastic'

" Interfaces
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'tomasr/molokai'
Plugin 'yegappan/mru'

" Actions
Plugin 'scrooloose/nerdcommenter'
Plugin 'mileszs/ack.vim'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'Lokaltog/vim-easymotion'
Plugin 'tpope/vim-surround'

" Language or Framework Syntax
Plugin 'fatih/vim-go'
Plugin 'digitaltoad/vim-jade'
Plugin 'claco/jasmine.vim'
Plugin 'digitaltoad/vim-pug'
Plugin 'tikhomirov/vim-glsl'
Plugin 'mxw/vim-jsx'
Plugin 'dadivdhalter/jedi-vim'


" Plugins To Try
"Plugin 'pangloss/vim-javascript'
"Plugin 'nvie/vim-flake8'
"Plugin 'corntrace/bufexplorer'
" Plugin Configuration

call vundle#end()
filetype plugin indent on
syntax on

" }}}
"{{{ Options
set foldmethod=marker
set colorcolumn=+1,100
set background=dark

set incsearch " highlight partial matches as you type
set ignorecase " don't distinguish between cases, partially overriden by smartcase
set smartcase " search is case sensitive if uppercase letters included in term
set hlsearch " highlight search

set number
set laststatus=2
set encoding=utf-8
set expandtab
set shiftround

" backupcopy deals with weirdness I don't fully understand about updating a
" file on write, this is needed for some build system's file watcher
set backupcopy=yes

" {{{ Specific to filetype
"
" JS
set tabstop=2
set softtabstop=2
set shiftwidth=2
" markdown
"set textwidth=100
" }}}
" }}}
" {{{ Variables
" autocmd BufWritePost *.py call Flake8()
let g:flake8_max_line_length=160

let g:syntastic_debug=0
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']

let g:airline#extensions#branch#enabled = 0

let g:ycm_key_list_select_completion = [] 
let g:ycm_key_list_previous_completion = [] 

" Python
" Open module, e.g. :Pyimport os (opens the os module)
let g:jedi#popup_on_dot = 0
let g:jedi#use_tabs_not_buffers = 1
let g:jedi#goto_command = "<leader>sd"
let g:jedi#goto_assignments_command = "<leader>sg"
let g:jedi#documentation_command = "<leader>sk"
let g:jedi#usages_command = "<leader>sn"
let g:jedi#rename_command = "<leader>sr"

"let g:jsx_ext_required = 0

" }}}
" {{{ Mappings
let mapleader=";"

cabbrev W w
cabbrev Tabe tabe
cabbrev Wq x

" inoremap <cr> <esc>
" inoremap <esc> <nop>

nnoremap <silent> <leader>l :noh<CR>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>` :set paste!<cr>
nnoremap <leader><space>  :MRU<cr>

let NERDTreeIgnore = ['\.pyc$']
nnoremap <leader>nt :NERDTreeToggle<CR>
nnoremap <leader>nf :NERDTreeFind<CR>
nnoremap <leader>nn :NERDTreeMirror<cr>

vnoremap <leader>/ y/\V<C-R>"<CR>

" Svn blame highlighted lines in visual mode
vnoremap gl :<C-U>!svn blame <C-R>=expand("%:p") <CR> \| sed -n <C-R>=line("'<") <CR>,<C-R>=line("'>") <CR>p <CR>

" }}}
" {{{ Autocommands and File Specific
augroup general
    autocmd!
    autocmd FileType python     iabbrev <buffer> iff if:<left>
    autocmd FileType javascript iabbrev <buffer> iff if ()<left>
    autocmd FileType javascript nnoremap <buffer> <localleader>c I//<esc>
    autocmd BufRead *.md let tw=100
augroup END

"  Go support
" autocmd BufWritePre *.go :Fmt " needs to be installed
autocmd BufRead,BufNewFile *.go set filetype=go
autocmd BufRead,BufNewFile *.go set makeprg=go\ build\ %

" }}}
" {{{ Color and Themes
highlight colorcolumn ctermbg=235 guibg=#2c2d27

hi link EasyMotionTarget ErrorMsg
hi link EasyMotionShade Comment

" not sure I'm really using this
if has("gui_running")
  if has("gui_gtk2")
    set guifont=InconsolataForPowerline\ 11
  elseif has("gui_win32")
    set guifont=Consolas:h11:cANSI
  endif
endif

" Colors
set t_Co=256
if filereadable($HOME . "/.vim/bundle/molokai/colors/molokai.vim")
  colorscheme molokai
endif

" }}}
