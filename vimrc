" {{{ Vundle Plugins and Init
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

" Interface
Plugin 'bling/vim-airline'
Plugin 'tomasr/molokai'
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'scrooloose/nerdtree'

" Actions
Plugin 'tpope/vim-surround'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'kovisoft/slimv'
"Plugin 'SirVer/ultisnips'

Plugin 'ElmCast/elm-vim'

Plugin 'scrooloose/nerdcommenter'
Plugin 'rking/ag.vim'
Plugin 'yegappan/mru'
Plugin 'tpope/vim-fugitive'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

" Language and Syntax
Plugin 'davidhalter/jedi-vim'
Plugin 'mxw/vim-jsx'
Plugin 'tikhomirov/vim-glsl'
Plugin 'claco/jasmine.vim'
Plugin 'digitaltoad/vim-pug'

call vundle#end()
filetype plugin indent on
syntax on

" }}}
"{{{ Options
set background=dark
"set colorcolumn=+1,100

set showcmd
set wildmenu
set lazyredraw

" TODO: scan for modelines and prompt to enable, show preview
set modeline " enable parsing in-file vim directives (not super secure...)

set foldenable
set foldmethod=indent
set foldlevelstart=2
set foldnestmax=10

set incsearch " highlight partial matches as you type
set ignorecase " don't distinguish between cases, partially overriden by smartcase
set smartcase " search is case sensitive if uppercase letters included in term
set hlsearch " highlight search

set number
set cursorline
set relativenumber

set laststatus=2
set encoding=utf-8
set expandtab
set shiftround
set tabstop=4
set softtabstop=4
set shiftwidth=4

" backupcopy deals with weirdness I don't fully understand about updating a
" file on write, this is needed for some build system's file watcher
set backupcopy=yes
" this other stuff was suggested but I haven't examined
"set noswapfile
"set backup
"set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
"set backupskip=/tmp/*,/private/tmp/*
"set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
"set writebackup

" {{{ Specific to filetype
"
" JS
" markdown
"set textwidth=100
" }}}
"
" }}}
" {{{ Variables
let g:mapleader=";"

" airline todo: learn statuline syntax to create custom sections
let g:airline#extensions#branch#enabled = 0

" lisp related
let g:slimv_lisp = '/usr/bin/clisp'
let g:slimv_impl = 'clisp'
let g:lisp_rainbow=1

"let g:UltiSnipsExpandTrigger="<c-b>"
"let g:UltiSnipsJumpForwardTrigger="<c-z>"
"let g:UltiSnipsJumpBackwardTrigger=""
"let g:UltiSnipsEditSplit="vertical"

" Python
let g:jedi#popup_on_dot = 0
let g:jedi#use_tabs_not_buffers = 1
let g:jedi#goto_command = "<leader>sd"
let g:jedi#goto_assignments_command = "<leader>sg"
let g:jedi#documentation_command = "<leader>sk"
let g:jedi#usages_command = "<leader>sn"
let g:jedi#rename_command = "<leader>sr"

" CtrlP settings
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
" }}}
" {{{ Mappings
" {{{ Experimental Mappings
nnoremap <leader>gb Gblame<CR>
" }}}

nnoremap <leader>nt :NERDTreeToggle<CR>

cabbrev W w
cabbrev Tabe tabe
cabbrev Wq x

nnoremap <leader><space> :MRU<CR>
nnoremap <leader>` :set paste!<CR>

nnoremap <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
nnoremap <silent> <leader>l :noh<CR>

" delete all trailing whitespace in the file
nnoremap <leader>cw :%s/\s\+$//e

" quickly search
nnoremap <leader>a :Ag<space>

" search for the visually highlighted text
vnoremap <leader>/ y/\V<C-R>"<CR>
" }}}
" {{{ Autocommands and File Specific
augroup filetype_python
    autocmd!
    autocmd FileType python     iabbrev <buffer> iff if:<left>
augroup END

augroup filetype_javascript
    autocmd!
    autocmd FileType javascript set tabstop=2 softtabstop=2 shiftwidth=2
augroup END

augroup filetype_markdown
    autocmd!
    autocmd BufRead,BufNewFile *.md set tw=100
augroup END

augroup filetype_go
    autocmd!
    autocmd BufRead,BufNewFile *.md set tw=100
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
"if filereadable($HOME . "/.vim/bundle/molokai/colors/molokai.vim")
  "colorscheme molokai
"endif
colorscheme PaperColor

" }}}
" in case I pick another fold method for shared code
" " vim:foldmethod=marker:foldlevel=0
