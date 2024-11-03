local status_ok, night_owl = pcall(require, "night-owl")
if not status_ok then
  return
end

-- Set to compile theme colorgen package
-- vim.cmd([[autocmd BufWritePost ~/Coding/night-owl.nvim/night-owl.toml :!colorgen-nvim night-owl.toml]])

night_owl.setup()
vim.cmd([[ colorscheme night-owl ]])
