local status_ok, ibl = pcall(require, "ibl")
if not status_ok then
  return
end

ibl.setup({
  indent = { char = "▏" },
  scope = { show_start = false, show_exact_scope = true },
  whitespace = { remove_blankline_trail = false },
})
