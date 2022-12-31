local status_ok, colorizer = pcall(require, "colorizer")
if not status_ok then
  return
end

colorizer.setup({
  user_default_options = {
    RRGGBBAA = true,
  },
  filetypes = {
    "*",
    lua = {
      names = false,
    },
    yaml = {
      names = false,
      mode = "virtualtext",
      virtualtext = "◼︎",
    },
    javascript = {
      names = false,
    },
    typescript = {
      names = false,
    },
  },
})
