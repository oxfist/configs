local status_ok_indent_blankline, indent_blankline = pcall(require, "indent_blankline")
if not status_ok_indent_blankline then
  return
end

indent_blankline.setup({
  use_treesitter = true,
  show_current_context = true,
})
