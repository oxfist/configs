local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

nvim_tree.setup({
  actions = {
    open_file = {
      window_picker = {
        enable = false,
      },
    },
  },
  auto_reload_on_write = true,
  reload_on_bufenter = true,
  diagnostics = {
    enable = true,
  },
  disable_netrw = true,
  hijack_netrw = true,
  hijack_cursor = true,
  filters = {
    dotfiles = false,
    custom = { "^.git$" },
  },
  open_on_setup = false,
  update_cwd = true,
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
  git = {
    enable = true,
    ignore = false,
  },
  renderer = {
    group_empty = true,
    full_name = true,
    highlight_git = true,
    highlight_opened_files = "all",
    indent_markers = {
      enable = true,
      inline_arrows = true,
      icons = {
        corner = "│",
        edge = "│",
        item = "│",
        bottom = "─",
        none = " ",
      },
    },
  },
  view = {
    width = 35,
  },
})
