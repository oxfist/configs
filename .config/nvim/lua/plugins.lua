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
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup END
]])

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
  use "lunarvim/horizon.nvim"

  -- Language utilities
  use {
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    setup = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  }
  use "pangloss/vim-javascript"
  use "maxmellon/vim-jsx-pretty"

  -- LSP
  use "williamboman/mason.nvim"
  use "williamboman/mason-lspconfig.nvim"
  use "neovim/nvim-lspconfig"
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }

  -- Better UX

  use "p00f/nvim-ts-rainbow"
  use "nvim-treesitter/playground"
  use "kyazdani42/nvim-web-devicons"
  use { "kyazdani42/nvim-tree.lua", tag = "nightly" }
  use "nvim-telescope/telescope.nvim"
  use "windwp/nvim-autopairs"
  use {
    "numToStr/Comment.nvim", config = function()
      require('Comment').setup()
    end
  }

  --- cmp
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-nvim-lua"
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use "saadparwaiz1/cmp_luasnip"
  use { 'David-Kunz/cmp-npm', requires = { 'nvim-lua/plenary.nvim' } }

  --- Snippets
  use {"L3MON4D3/LuaSnip", tag = "v1.*"}  -- Snipets

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
