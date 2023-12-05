local status_ok_gitsigns, gitsigns = pcall(require, "gitsigns")
if not status_ok_gitsigns then
  return
end

gitsigns.setup({
  current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
    virt_text_priority = 5000,
    delay = 1000,
    ignore_whitespace = false,
  },
})
