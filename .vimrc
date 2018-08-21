set nocompatible "This is ViM, not Vi!

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

set colorcolumn=80

"Select text without the line numbers
set mouse=a

"Set yank and paste to work with the clipboard.
set clipboard=unnamedplus

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

"Toggle line numbers with Ctrl+N+N
nmap <C-N><C-N> :set invnumber<CR>

"Map F7 to reindent entire file
map <F7> mzgg=G`z<CR>

" Clears highlight after searching with ',' + '/'
nmap <silent> ,/ :nohlsearch<CR>

" 'W' for sudo saving
command W :execute ':silent w !sudo tee % > /dev/null' | :edit!

"Paste mode mapped to F2
nnoremap <F2> :set invpaste paste?<CR>

"Go back to normal mode typing 'k' + 'j'
:inoremap kj <ESC>
set pastetoggle=<F2>
set showmode

colorscheme jellybeans
"colorscheme codeschool
"colorscheme ir_black
"colorscheme wombat
"colorscheme distinguished
"colorscheme railscasts
"colorscheme vividchalk

"autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd w
autocmd FileType php setlocal makeprg=zca\ %<.php
autocmd FileType php setlocal errorformat=%f(line\ %l):\ %m
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeWinPos = "right"

" *** Vundle and plugins ***

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'alvan/vim-closetag'
Plugin 'JulesWang/css.vim' " only necessary if your Vim version < 7.4
Plugin 'sheerun/vim-polyglot'
Plugin 'vim-syntastic/syntastic'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'neoclide/vim-jsx-improve'
Plugin 'Valloric/MatchTagAlways'
Plugin 'leshill/vim-json'
Plugin 'danro/rename.vim'
Plugin 'tpope/vim-rails'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-abolish'

call vundle#end()            " required

"JavaScript
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
let g:polyglot_disabled = ["graphql", "jsx"]
let g:used_javascript_libs = 'underscore,backbone,react'
let g:javascript_plugin_jsdoc = 1
let g:syntastic_javascript_checkers = ['']
let g:mta_filetypes = { 'html': 1, 'xml': 1, 'javascript': 1 }

"Ruby
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1
let g:syntastic_ruby_checkers = ['rubocop']
let ruby_space_errors = 1

let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.js,*.jsx,*.html.erb"

" air-line
" Enable Powerline fonts in order to display glyphs on Airline
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_symbols.notexists = '∄'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
