set expandtab
set tabstop=2 shiftwidth=2 softtabstop=2
set autoindent

" Shift-Enter prints the end keyword at the end of the block.
imap <S-CR>    <CR><CR>end<Esc>-cc

"if !exists( "*EndToken" )
"  function EndToken()
"    let current_line = getline( '.' )
"    let braces_at_end = '{\s*|\(,\|\s\|\w*|\s*\)\?$'
"    if match( current_line, braces_at_end ) >= 0
"      return '}'
"    else
"      return 'end'
"    endif
"  endfunction
"endif

"imap <S-CR> <ESC>:execute 'normal o' . EndToken()<CR>O
