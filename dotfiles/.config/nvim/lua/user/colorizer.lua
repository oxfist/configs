local status_ok, colorizer = pcall(require, "colorizer")
if not status_ok then
  return
end

colorizer.setup({
  user_default_options = {
    RRGGBBAA = true,
    rgb_fn = true,
  },
  filetypes = {
    "*",
    javascript = {
      names = false,
    },
    typescript = {
      names = false,
    },
    lua = {
      names = false,
    },
    yaml = {
      names = false,
    },
    toml = {
      names = false,
    },
  },
})
