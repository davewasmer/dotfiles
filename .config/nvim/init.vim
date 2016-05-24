"""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""

colorscheme codeschool
syntax enable           " enable syntax processing
filetype indent on      " load filetype-specific indent files
filetype plugin on      " load filetype-specific plugin files
set ttyfast             " Assume a fast terminal connection
set encoding=utf-8 nobomb " Use UTF-8 without BOM
set hidden              " Allow hidden buffers
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set wildignore+=*/node_modules/*,*/tmp/*

"""""""""""""""""""""""""""""""""""
" Tabs & Spaces
"""""""""""""""""""""""""""""""""""

set tabstop=2           " number of visual spaces each TAB counts for
"set softtabstop=2       " number of spaces each TAB counts for when editing
set expandtab           " tabs are spaces
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
set colorcolumn=80      " Show line length guide at 80

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
" Fix mustache filetype detection (see https://github.com/mustache/vim-mustache-handlebars/issues/41)
au BufRead,BufNewFile *.hbs setfiletype mustache

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

" Curly brace, parens, and brackets create new blocks with proper indentation
inoremap {<cr> {<cr>}<c-o>O
inoremap [<cr> [<cr>]<c-o>O
inoremap (<cr> (<cr>)<c-o>O

" Join lines without spaces by default
nnoremap J Jdiw

" Add newlines from normal mode
"nnoremap <C-M> i<CR><Esc>

"""""""""""""""""""""""""""""""""""
" Custom mappings
"""""""""""""""""""""""""""""""""""

let mapleader=","       " leader is comma
inoremap jj <esc>
nnoremap ; :
nnoremap <Space> i <Esc>l

" nnoremap <leader>w :bp\|bd #<CR>
nnoremap <leader>w :Bdelete<CR>

nnoremap <leader>j :bn<CR>
nnoremap <leader>k :bp<CR>
nnoremap <C-s> :w<CR>

nnoremap <leader>g :lnext<CR>

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
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mattn/emmet-vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'editorconfig/editorconfig-vim'
Plug 'Valloric/YouCompleteMe'
Plug 'Raimondi/delimitMate'
Plug 'scrooloose/syntastic'
Plug 'ervandew/supertab'
Plug 'moll/vim-bbye'
Plug 'sheerun/vim-polyglot'
Plug 'othree/es.next.syntax.vim'
Plug 'tomtom/tcomment_vim'
"Plug 'scrooloose/nerdcommenter'
"Plug 'tpope/vim-fugitive'
"Plug 'fholgado/minibufexpl.vim'
"Plug 'alvan/vim-closetag'
"Plug 'mustache/vim-mustache-handlebars'
"Plug 'xolox/vim-session'
"Plug 'xolox/vim-misc'
"Plug 'bling/vim-bufferline'
"Plug 'KabbAmine/vCoolor.vim'

call plug#end()

"""""""""""""""""""""""""""""""""""
" polyglot
"""""""""""""""""""""""""""""""""""

let g:polyglot_disabled = ['js']

"""""""""""""""""""""""""""""""""""
" minibufexpl
"""""""""""""""""""""""""""""""""""

"nnoremap <leader>b :MBEOpen<CR>

"""""""""""""""""""""""""""""""""""
" YouCompleteMe
"""""""""""""""""""""""""""""""""""

let g:ycm_min_num_of_chars_for_completion = 1

"""""""""""""""""""""""""""""""""""
" Ultisnips
"""""""""""""""""""""""""""""""""""

let g:UltiSnipsSnippetDirectories=[$HOME.'/.config/nvim/ultisnips']

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

"""""""""""""""""""""""""""""""""""
" NerdTree
"""""""""""""""""""""""""""""""""""

" Open NERDTree on startup, unless a file was specified
:function Open_nerdtree_on_startup()
  NERDTree
  wincmd p
endfunction
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && (!exists("s:std_in") || argv(0) == '.') | :call Open_nerdtree_on_startup() | endif
" open NerdTree on ,t
nnoremap <leader>t :NERDTreeToggle<CR>
let NERDTreeShowHidden=1       " show hidden files by default
let NERDTreeIgnore = ['\.DS_Store', '.git'] " ignore DS_Store files in NerdTree

"""""""""""""""""""""""""""""""""""
" NerdCommenter
"""""""""""""""""""""""""""""""""""

" Use // for SASS comments by default
let NERD_scss_alt_style=1

"""""""""""""""""""""""""""""""""""
" Syntastic
"""""""""""""""""""""""""""""""""""

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_loc_list_height = 3
let g:syntastic_javascript_checkers = ["eslint"]
let g:syntastic_javascript_eslint_exec = "/Users/daw/.nvm/versions/node/v5.10.0/bin/eslint"
let g:syntastic_scss_scss_lint_exec='/Users/daw/.rvm/gems/ruby-2.3.0/bin/scss-lint'
let g:syntastic_mode_map = { 'passive_filetypes': ['html'] }

"""""""""""""""""""""""""""""""""""
" Closetag
"""""""""""""""""""""""""""""""""""

"let g:closetag_filenames = "*.html,*.hbs"

"""""""""""""""""""""""""""""""""""
" CtrlP
"""""""""""""""""""""""""""""""""""

let g:ctrlp_map = '<c-p>'
let g:ctrlp_show_hidden = 1
let g:ctrlp_brief_prompt = 1
let g:ctrlp_working_path_mode = 'a'

"""""""""""""""""""""""""""""""""""
" Vim Session
"""""""""""""""""""""""""""""""""""

"let g:session_directory = "~/.config/nvim/sessions"
"let g:session_default_name = ".vimsession"
"" If a file was specified, don't load the session from this directory (since
"" we just want to quick edit that file). Otherwise, autoload sessions
"let g:session_autoload = argc() == 0 && !exists("s:std_in") ? 'no' : 'yes'
"let g:session_autosave = 'yes'
"let g:session_autosave_periodic = 5
"let g:session_autosave_silent = 1

"""""""""""""""""""""""""""""""""""
" Emmet
"""""""""""""""""""""""""""""""""""

let g:user_emmet_expandabbr_key = '<C-e>'

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
   \ [ 'x', 'error', 'warning' ]
   \ ]

"""""""""""""""""""""""""""""""""""
" Surround
"""""""""""""""""""""""""""""""""""

" ERB style surround tags (<% %>)
let g:surround_{char2nr('=')} = "<%= \r %>"
let g:surround_{char2nr('-')} = "<% \r %>"

"""""""""""""""""""""""""""""""""""
" Editor Config
"""""""""""""""""""""""""""""""""""

let g:EditorConfig_exec_path = 'usr/local/bin/editorconfig'
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

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
