"""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""

colorscheme oceandeep   " use luna colorscheme
syntax enable           " enable syntax processing
filetype indent on      " load filetype-specific indent files
filetype plugin on      " load filetype-specific plugin files
set ttyfast             " Assume a fast terminal connection
set encoding=utf-8 nobomb " Use UTF-8 without BOM
set hidden              " Allow hidden buffers
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

"""""""""""""""""""""""""""""""""""
" Tabs & Spaces
"""""""""""""""""""""""""""""""""""

set tabstop=2           " number of visual spaces each TAB counts for
"set softtabstop=2       " number of spaces each TAB counts for when editing
"set expandtab           " tabs are spaces
set shiftwidth=2

"""""""""""""""""""""""""""""""""""
" Editor GUI
"""""""""""""""""""""""""""""""""""

set number              " show line numbers
set showcmd             " show last entered command in bottom bar (or in powerline)
set cursorline          " highlight current line
set showmatch           " highlight matching [{()}]
set ruler               " Show the cursor position
set showmode            " Show the current mode

" Show “invisible” characters
set lcs=tab:▸\ ,trail:·,nbsp:_
set list

"""""""""""""""""""""""""""""""""""
" Other GUI options
"""""""""""""""""""""""""""""""""""

set wildmenu            " visual autocomplete for command menu
set lazyredraw          " redraw only when we need to.
set noerrorbells        " disable error bells
set shortmess=atI       " Don’t show the intro message when starting Vim
set title               " Show the filename in the window titlebar

"""""""""""""""""""""""""""""""""""
" Search
"""""""""""""""""""""""""""""""""""

set incsearch           " search as characters are entered
set hlsearch            " highlight matches
set gdefault            " Add the g flag to search/replace by default

" Only do case-sensitive searching when the search includes a capital letter
set ignorecase
set smartcase

" nnoremap <CR> :noh<CR><CR>

"""""""""""""""""""""""""""""""""""
" Movement
"""""""""""""""""""""""""""""""""""

" move to beginning/end of line
nnoremap B ^
nnoremap E $
" $/^ doesn't do anything
nnoremap $ <nop>
nnoremap ^ <nop>

" Split pane movement made simpler (just Ctrl-j/k/h/l)
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set nostartofline       " Don’t reset cursor to start of line when moving around.
set scrolloff=5         " Start scrolling 5 lines before the horizontal window border

"""""""""""""""""""""""""""""""""""
" Editing
"""""""""""""""""""""""""""""""""""

set esckeys             " Allow cursor keys in insert mode
set backspace=indent,eol,start " Allow backspace in insert mode
set nowrap              " don't wrap lines by default

autocmd BufWritePre * :call StripTrailingWhitespaces()   " Strip trailing whitespace on save

set backupdir=~/.config/nvim/backups " Centralize backups
set directory=~/.config/nvim/swaps   " Centrialize swapfiles
if exists("&undodir")
	set undodir=~/.config/nvim/undo    " And undo history
endif
set backupskip=/tmp/*,/private/tmp/*  " Don’t create backups when editing files in certain directories

" Respect modeline in files
set modeline
set modelines=4

set splitbelow          " new horizontal splits appear below
set splitright          " new vertical splits appear right

"""""""""""""""""""""""""""""""""""
" Custom mappings
"""""""""""""""""""""""""""""""""""

let mapleader=","       " leader is comma
inoremap jj <esc>
" Ctrl-c closes the current buffer without closing the window
nnoremap <C-c> :bp\|bd #<CR>

"""""""""""""""""""""""""""""""""""
" Clipboard
"""""""""""""""""""""""""""""""""""

set clipboard=unnamed   " Use the OS clipboard by default

"""""""""""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')

Plug 'jeffkreeftmeijer/vim-numbertoggle'                 " Use relative line numbers intelligently
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'      " Snippets
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }  " File browser
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'rking/ag.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdcommenter'
Plug 'mattn/emmet-vim'
Plug 'xolox/vim-session'
Plug 'xolox/vim-misc'
Plug 'Shougo/deoplete.nvim'
Plug 'bling/vim-bufferline'
Plug 'KabbAmine/vCoolor.vim'
Plug 'terryma/vim-multiple-cursors'

call plug#end()

"""""""""""""""""""""""""""""""""""
" NerdTree
"""""""""""""""""""""""""""""""""""

" Open NERDTree on startup, unless a file was specified
:function Open_nerdtree_on_startup()
  NERDTree
	wincmd p
endfunction
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | :call Open_nerdtree_on_startup() | endif
" open NerdTree on Ctrl-N
map <C-t> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1       " show hidden files by default
let NERDTreeIgnore = ['\.DS_Store', '.git'] " ignore DS_Store files in NerdTree

"""""""""""""""""""""""""""""""""""
" CtrlP
"""""""""""""""""""""""""""""""""""

let g:ctrlp_map = '<c-p>'
let g:ctrlp_show_hidden = 1

"""""""""""""""""""""""""""""""""""
" Vim Session
"""""""""""""""""""""""""""""""""""

let g:session_directory = "~/.config/nvim/sessions"
let g:session_default_name = ".vimsession"
" If a file was specified, don't load the session from this directory (since
" we just want to quick edit that file). Otherwise, autoload sessions
let g:session_autoload = argc() == 0 && !exists("s:std_in") ? 'no' : 'yes'
let g:session_autosave = 'yes'
let g:session_autosave_periodic = 5
let g:session_autosave_silent = 1

"""""""""""""""""""""""""""""""""""
" Emmet
"""""""""""""""""""""""""""""""""""

let g:user_emmet_expandabbr_key='<Tab>'

"""""""""""""""""""""""""""""""""""
" Deoplete (autocompletion)
"""""""""""""""""""""""""""""""""""

let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_camel_case = 1

" Candidate selection keys
" inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
" function! s:my_cr_function()
"     return (pumvisible() ? '\<C-y>' : '' ) . '\<CR>'
" endfunction
" function! s:my_cr_function() abort
"   return deoplete#mappings#close_popup() . '\<CR>'
" endfunction
" inoremap <expr><TAB>  pumvisible() ? '\<C-n>' : '\<TAB>'
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <silent><expr> <CR> pumvisible() ? deoplete#mappings#close_popup() : "\<CR>"

"""""""""""""""""""""""""""""""""""
" Airline
"""""""""""""""""""""""""""""""""""

let g:airline_theme = 'luna'
let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_powerline_fonts = 1
let g:airline#extensions#bufferline#enabled = 1
let g:airline#extensions#bufferline#overwrite_variables = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#csv#enabled = 0
let g:airline#extensions#hunks#enabled = 1
let g:airline#extensions#virtualenv#enabled = 0
let g:airline#extensions#eclim#enabled = 0
let g:airline#extensions#wordcount#enabled = 0

let g:airline#extensions#default#layout = [
   \ [ 'a', 'b', 'c' ],
   \ [ 'x' ]
   \ ]

"""""""""""""""""""""""""""""""""""
" Surround
"""""""""""""""""""""""""""""""""""

" ERB style surround tags (<% %>)
let g:surround_{char2nr('=')} = "<%= \r %>"
let g:surround_{char2nr('-')} = "<% \r %>"

"""""""""""""""""""""""""""""""""""
" Functions
"""""""""""""""""""""""""""""""""""

" Strip trailing whitespace
function! StripTrailingWhitespaces()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	:%s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
endfunction
