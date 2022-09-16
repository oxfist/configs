-- Install packer automatically
local install_path = vim.fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = vim.fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path
  }
  print "Installing packer 💾... please close and reopen neovim."
  vim.cmd [[packadd packer.nvim]]
end

-- Reload neovim when saving plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Require packer under protected call to not error on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  print "packer is not installed!"
  return
end

return packer.startup(function(use)
  use "wbthomason/packer.nvim"

  -- Standard Lua plugins
  use "nvim-lua/popup.nvim"
  use "nvim-lua/plenary.nvim"

  -- Themes
  use "haishanh/night-owl.vim"
  use "folke/tokyonight.nvim"

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
