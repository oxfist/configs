set nocompatible "This is ViM, not Vi!

call pathogen#infect()
call pathogen#helptags()

" syntax stuff
syntax on
filetype on
filetype indent on
filetype plugin on
set t_Co=256

set nowrap
set tabstop=4
set backspace=indent,eol,start
set autoindent "Keep indentation from previous line
set copyindent
set number
set shiftwidth=4 " > < tabbing size
set smartindent
set showmatch
set ignorecase
set smartcase
set smarttab
set hlsearch
set incsearch

" Disable backups
set nobackup
set noswapfile

set expandtab "Tabs to spaces
set softtabstop=4

filetype plugin indent on

"Select text without the line numbers
set mouse=a

"Set yank and paste to work with the clipboard.
set clipboard=unnamedplus

"set keymap=accents

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

"Toggle line numbers with Ctrl+N+N
nmap <C-N><C-N> :set invnumber<CR>

"Map F7 to reindent entire file
map <F7> mzgg=G`z<CR>

" Clears highlight with ',' + '/'
nmap <silent> ,/ :nohlsearch<CR>

" 'W' for sudo saving
command W :execute ':silent w !sudo tee % > /dev/null' | :edit!

"Paste mode mapped to F2
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

colorscheme jellybeans
"colorscheme codeschool
"colorscheme ir_black
"colorscheme wombat
"colorscheme distinguished
"colorscheme railscasts
"colorscheme vividchalk

au BufRead,BufNewFile *.twig set filetype=htmljinja

filetype plugin on
"autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd w
autocmd FileType php setlocal makeprg=zca\ %<.php
autocmd FileType php setlocal errorformat=%f(line\ %l):\ %m
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeWinPos = "right"
