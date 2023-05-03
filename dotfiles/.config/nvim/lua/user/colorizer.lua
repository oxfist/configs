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
    checkhealth = { names = false },
    javascript = { names = false },
    json = { names = false },
    lua = { names = false },
    make = { names = false },
    mason = { names = false },
    toml = { names = false },
    typescript = { names = false },
    yaml = { names = false },
    vim = { names = false },
  },
})
