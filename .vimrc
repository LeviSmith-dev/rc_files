" Use Vim settings, rather than Vi settings (Much Better).
" This must be first, because it changes other options as a side effect.
set nocompatible

" source~/.vimrc.before if it exists.
if filereadable(expand("~/.vimrc.before"))
source ~/.vimrc.before
endif

"============== General Config ================

set number relativenumber       "Line Numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline histroy
set showcmd                     "Show incomplete cmds down bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set visualbell                  "No sound
set autoread                    "Reload files changed outside vim
set cursorline                  "highlights the line you are one
set tabstop=2                   "sets number of visual spaces for tab
set softtabstop=2               "number of spaces in tab when editing

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.jsbach.com/319/configuring-vim-right
set hidden

"turn on syntax highlighting
syntax enable
" set background=dark
"colorscheme blueish
syntax on


" Change leader to a comma because the backslash is to far away
" That means all \x command turn into ,x
" The mapleader has to be set before vundle starts loading all
" the plugins.
let mapleader=","
set timeout timeoutlen=1500

"================= Turn off Swap Files =================

set noswapfile
set nobackup
set nowb

"================  Persistent Undo ====================

" Keep undo history across sessions, by storing in file.
" Only works all the time.
if has('persistant_undo') && !isdirectory(expand('~').'/.vim/backups')
silent !mkdir ~/.vim/backups > /dev/null 2>&1
set undodir=~/.vim/backups
set undofile
endif

"=============== Folds ===============================

set foldmethod=indent    "fold based on indent
set foldnestmax=3        "deepest fold is 3 levels
set nofoldenable         "dont fold by default

" ================= Scrolling ======================

set scrolloff=8          "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" ================ Search ===========================

set incsearch       " Find the next match as we type the search
set hlsearch        " Highlight searches by default
set ignorecase      " Ignore case when searching...
set smartcase       " ...unless we type a capital

" ================ Indentation ======================

set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

filetype plugin on
filetype indent on

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

set nowrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points

" ================ Custom Settings ========================

" Window pane resizing
nnoremap <silent> <Leader>[ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>] :exe "resize " . (winheight(0) * 2/3)<CR>

" ===== Seeing Is Believing =====

" " Assumes you have a Ruby with SiB available in the PATH
" " If it doesn't work, you may need to `gem install seeing_is_believing -v
" 3.0.0.beta.6`
" " ...yeah, current release is a beta, which won't auto-install
"
" " Annotate every line
"
nmap <leader>b :%!seeing_is_believing --timeout 12 --line-length 500 --number-of-captures 300 --alignment-strategy chunk<CR>;
"
"  " Annotate marked lines
"
nmap <leader>n :%.!seeing_is_believing --timeout 12 --line-length 500 --number-of-captures 300 --alignment-strategy chunk --xmpfilter-style<CR>;
"
"  " Remove annotations
"
nmap <leader>c :%.!seeing_is_believing --clean<CR>;
"
"  " Mark the current line for annotation
"
nmap <leader>m A # => <Esc>
"
"  " Mark the highlighted lines for annotation
"
vmap <leader>m :norm A # => <Esc>

" Plugin call to ctrl p for fuzzy file search
"

autocmd StdinReadPre * let s:std_in=1
map <C-c> :NERDTreeToggle<CR>

execute pathogen#infect()
