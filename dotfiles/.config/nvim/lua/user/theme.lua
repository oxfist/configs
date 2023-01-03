-- Set color for current line number
-- vim.cmd(
--   [[autocmd ColorScheme * highlight CursorLineNr cterm=bold term=bold gui=bold ctermfg='yellow' guifg='yellow' ctermbg=NONE guibg=NONE]]
-- )

vim.cmd([[autocmd BufWritePost ~/Coding/night-owl.nvim/night-owl.toml :!colorgen-nvim night-owl.toml]])

-- vim.cmd("colorscheme night-owl")
vim.cmd("colorscheme nightowl")

vim.api.nvim_create_autocmd({ "FocusGained" }, {
  pattern = "*",
  command = "hi! link Visual VisualActive",
})

vim.api.nvim_create_autocmd({ "FocusLost" }, {
  pattern = "*",
  command = "hi! link Visual VisualInactive",
})
