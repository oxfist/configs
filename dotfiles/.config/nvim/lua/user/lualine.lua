local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  return
end

lualine.setup({
  options = {
    theme = "night-owl",
  },
  sections = {
    lualine_b = {
      {
        "branch",
      },
      {
        "diff",
      },
      {
        "diagnostics",
        symbols = { error = " ", warn = "⚠️ ", info = " ", hint = " " },
      },
    },
    lualine_c = {
      {
        "filename",
      },
      {
        "filesize",
      },
    },
  },
  extensions = {
    "nvim-tree",
  },
})
