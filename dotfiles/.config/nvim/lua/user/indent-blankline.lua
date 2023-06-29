local status_ok, indent_blankline = pcall(require, "indent_blankline")
if not status_ok then
  return
end

indent_blankline.setup({
  use_treesitter = true,
  show_current_context = true,
  show_current_context_start = false,
})

vim.cmd([[
  let g:indent_blankline_char = '⋮'
  let g:indent_blankline_context_char = '⋮'
]])
