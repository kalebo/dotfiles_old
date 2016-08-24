execute pathogen#infect()
"------------------------------- Moving around -----------------------------

nnoremap k gk
nnoremap j gj
nnoremap gk k
nnoremap gj j

set backspace=2         " backspace in insert mode works like normal editor

set incsearch           " Highlight pattern matches as you type
set ignorecase          " ignore case when using a search pattern
set smartcase           " override 'ignorecase' when pattern

let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1 " Enable the list of buffers
let g:airline#extensions#tabline#fnamemod = ':t' " Show just the filename

"------------------------------- GUI settings ------------------------------

if has("gui_running")
colorscheme solarized
set bg=dark
set lines=26 columns=80
endif

set gfn=Luculent\ 9
"set gfn=Meslo\ LG\ M\ for\ Powerline\ 11 
"set gfn=Sauce\ Code\ Powerline\ Regular\ 12
"set gfn=Anonymous\ Pro\ 12
"set gfn=Envy\ Code\ R\ 9
set go=aegit

syntax on               " syntax highlighting
set number              " line numbers
set cursorline 
set linebreak
set hlsearch
"------------------------------- Text Editing ------------------------------
 
":au FocusLost * :wa "auto save on lost focus

set spell
cabbrev pt set spl=pt
cabbrev en set spl=en

filetype plugin indent on      " activates indenting for files
set autoindent          " auto indenting


iab xdate <c-r>=strftime("%Y-%m-%d")<cr>
iab xtime <c-r>=strftime("%H:%m")<cr>
