" syntax stuff
syntax on
set t_Co=256

set autoindent "Keep indentation from previous line
set smartindent
set cindent

set shiftwidth=4 " > < tabbing size
set expandtab "Tabs to spaces
set tabstop=4
set softtabstop=4

set keymap=accents

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

filetype plugin on
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd w

function! NERDTreeQuit()
  redir => buffersoutput
  silent buffers
  redir END
"                     1BufNo  2Mods.     3File           4LineNo
  let pattern = '^\s*\(\d\+\)\(.....\) "\(.*\)"\s\+line \(\d\+\)$'
  let windowfound = 0

  for bline in split(buffersoutput, "\n")
    let m = matchlist(bline, pattern)

    if (len(m) > 0)
      if (m[2] =~ '..a..')
        let windowfound = 1
      endif
    endif
  endfor

  if (!windowfound)
    quitall
  endif
endfunction
autocmd WinEnter * call NERDTreeQuit()
