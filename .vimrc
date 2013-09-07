" syntax stuff
syntax on
filetype on
filetype indent on
filetype plugin on
set t_Co=256

set autoindent "Keep indentation from previous line
set smartindent
set cindent

set shiftwidth=4 " > < tabbing size
set expandtab "Tabs to spaces
set tabstop=4
set softtabstop=4

"Select text without the line numbers
set mouse+=a

" F11 to toggle paste mode
map <F11> :set invpaste<CR>
set pastetoggle=<F11>

"set keymap=accents

"Paste mode mapped to F2
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

" Lines
set nu!

call pathogen#infect()

colorscheme jellybeans
"colorscheme codeschool
"colorscheme ir_black
"colorscheme wombat
"colorscheme distinguished
"colorscheme railscasts
"colorscheme vividchalk

au BufRead,BufNewFile *.twig set filetype=htmljinja

filetype plugin on
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd w
autocmd FileType php setlocal makeprg=zca\ %<.php
autocmd FileType php setlocal errorformat=%f(line\ %l):\ %m
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeWinPos = "right"
