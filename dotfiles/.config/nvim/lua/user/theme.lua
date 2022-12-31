-- Set color for current line number
vim.cmd(
  [[autocmd ColorScheme * highlight CursorLineNr cterm=bold term=bold gui=bold ctermfg='yellow' guifg='yellow' ctermbg=NONE guibg=NONE]]
)

vim.cmd([[autocmd BufWritePost ~/Coding/night-owl.vim/estilo/syntax/base.yml :!yarn render]])

vim.cmd("colorscheme night-owl")
