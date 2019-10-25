" {{{ Vundle Plugins and Init
"
call plug#begin('~/.vim/plugged')

" to try
" ultisnips
" Plug 'smkent/vim-pipe-preview'

" inccommand nosplit

" Interface
Plug 'vim-airline/vim-airline'
Plug 'tomasr/molokai'
Plug 'NLKNguyen/papercolor-theme'
Plug 'godlygeek/csapprox'
Plug 'scrooloose/nerdtree'
Plug 'jceb/vim-orgmode'
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'w0rp/ale'
Plug 'jremmen/vim-ripgrep'

"airblade/vim-gitgutter

" Actions
Plug 'tpope/vim-surround'
Plug 'Lokaltog/vim-easymotion'
Plug 'kovisoft/slimv'
Plug 'tpope/vim-speeddating'
Plug 'scrooloose/nerdcommenter'
Plug 'rking/ag.vim'
Plug 'yegappan/mru'
Plug 'tpope/vim-fugitive'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
"Plugin 'SirVer/ultisnips'


" Language and Syntax
"Plug 'neomake/neomake'
Plug 'mxw/vim-jsx'
Plug 'tikhomirov/vim-glsl'
Plug 'claco/jasmine.vim'
Plug 'digitaltoad/vim-pug'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
"Plug 'zchee/deoplete-jedi'
Plug 'ElmCast/elm-vim'
Plug 'guns/vim-clojure-static'
Plug 'tpope/vim-fireplace'

Plug 'cakebaker/scss-syntax.vim'

call plug#end()
let g:deoplete#enable_at_startup = 1

"let g:neomake_python_enabled_makers = ['flake8']
"let g:neomake_open_list = 2
"call neomake#configure#automake('w')

"let g:python_host_prog = '/Users/ian/.pyenv/versions/neovim2/bin/python'
"let g:python3_host_prog = '/Users/ian/.pyenv/versions/neovim3/bin/python'
let g:python_host_prog  = '/home/ian/.pyenv/versions/python2-venv/bin/python'
let g:python3_host_prog = '/home/ian/.pyenv/versions/python3-venv/bin/python'


" Error and warning signs.
let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'
" Enable integration with airline.
let g:airline#extensions#ale#enabled = 1

let g:scheme_builtin_swank=0


" }}}
"{{{ Options
set background=dark
"set colorcolumn=+1,100

set showcmd
set wildmenu
set lazyredraw

" TODO: scan for modelines and prompt to enable, show preview
set modeline " enable parsing in-file vim directives (not super secure...)

"set foldenable
"set foldmethod=indent
"set foldlevelstart=2
"set foldnestmax=10

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
"let g:jedi#popup_on_dot = 0
"let g:jedi#use_tabs_not_buffers = 1
"let g:jedi#goto_command = "<leader>sd"
"let g:jedi#goto_assignments_command = "<leader>sg"
"let g:jedi#documentation_command = "<leader>sk"
"let g:jedi#usages_command = "<leader>sn"
"let g:jedi#rename_command = "<leader>sr"

" CtrlP settings

if executable('rg')
  set grepprg=rg\ --color=never
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  let g:ctrlp_use_caching = 0
endif

" do I need these?
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
"let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
" }}}
" {{{ Mappings
" {{{ Experimental Mappings
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gb :Gblame<CR>
" }}}

nnoremap <leader>nf :NERDTreeFind<CR>
nnoremap <leader>nt :NERDTreeToggle<CR>

cabbrev W w
cabbrev Tabe tabe
cabbrev Wq x

"nnoremap <leader>b :Neomake!<CR>

nnoremap <leader><space> :MRU<CR>
nnoremap <leader>` :set paste!<CR>

nnoremap <leader>sv :source $MYVIMRC<CR>
nnoremap <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <leader>et :vsplit $MYTMUXCONF<CR>
nnoremap <leader>eb :vsplit $MYBASHRC<CR>
nnoremap <leader>eo :vsplit $MYORGMODE<CR>
nnoremap <silent> <leader>l :noh<CR>

nnoremap <leader>pi :PlugInstall<CR>

" delete all trailing whitespace in the file
nnoremap <leader>cw :%s/\s\+$//e

" quickly search
nnoremap <leader>a :Ag<space>

" search for the visually highlighted text
vnoremap <leader>/ y/\V<C-R>"<CR>

" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
"smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
"\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=0
  " set concealcursor=niv
endif

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

"augroup filetype_go
    "autocmd!
    "autocmd BufRead,BufNewFile *.md set tw=100
"augroup END

"  Go support
"autocmd BufWritePre *.go :Fmt " needs to be installed
"autocmd BufRead,BufNewFile *.go set filetype=go
"autocmd BufRead,BufNewFile *.go set makeprg=go\ build\ %

let g:go_auto_sameids = 1
let g:go_fmt_command = "goimports"
let g:go_addtags_transform = "snakecase"
let g:go_snippet_engine = "neosnippet"

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
"
