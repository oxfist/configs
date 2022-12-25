local status_ok_indent_blankline, indent_blankline = pcall(require, "indent_blankline")
if not status_ok_indent_blankline then
  return
end

indent_blankline.setup({
  show_current_context = true,
})

-- vim.cmd([[highlight IndentBlanklineChar guifg=#26375D gui=nocombine]])
-- vim.cmd([[highlight IndentBlanklineContextChar guifg=#45566A gui=nocombine cterm=bold]])
