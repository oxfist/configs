local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

nvim_tree.setup({
  auto_reload_on_write = true,
  diagnostics = {
    enable = true,
  },
  disable_netrw = true,
  filters = {
    dotfiles = false,
    custom = { "^.git$" },
  },
  hijack_netrw = true,
  open_on_setup = false,
  update_cwd = true,
})
