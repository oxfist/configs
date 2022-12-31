-- Install packer automatically
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local packer_bootstrap

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  packer_bootstrap = vim.fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print("Installing packer 💾... please close and reopen neovim.")
  vim.cmd([[packadd packer.nvim]])
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
  print("packer is not installed!")
  return
end

return packer.startup(function(use)
  use("wbthomason/packer.nvim")

  -- Standard Lua plugins
  use("nvim-lua/popup.nvim")
  use("nvim-lua/plenary.nvim")

  -- Language utilities
  use({
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    setup = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  })
  use("pangloss/vim-javascript")
  use("maxmellon/vim-jsx-pretty")

  -- Themes
  use("~/Coding/night-owl.vim")
  -- use("haishanh/night-owl.vim")
  -- use("Julpikar/night-owl.nvim")
  use("folke/tokyonight.nvim")
  use("lunarvim/horizon.nvim")

  -- LSP
  use("neovim/nvim-lspconfig")
  use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  })
  use("nvim-treesitter/playground")

  -- Better DX
  use("p00f/nvim-ts-rainbow")
  use("nvim-treesitter/nvim-treesitter-context")
  use("JoosepAlviste/nvim-ts-context-commentstring")
  use("kyazdani42/nvim-web-devicons")
  use({ "kyazdani42/nvim-tree.lua", tag = "nightly" })
  use("nvim-telescope/telescope.nvim")
  use("windwp/nvim-autopairs")
  use("windwp/nvim-ts-autotag")
  use("numToStr/Comment.nvim")
  use("williamboman/mason.nvim")
  use("williamboman/mason-lspconfig.nvim")
  use("jose-elias-alvarez/null-ls.nvim")
  use("jayp0521/mason-null-ls.nvim")
  use({
    "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
  })
  use("lukas-reineke/indent-blankline.nvim")
  use("lewis6991/gitsigns.nvim")
  use("RRethy/vim-illuminate")
  use({ "kylechui/nvim-surround", tag = "*" })
  use("jinh0/eyeliner.nvim")
  use("b0o/schemastore.nvim")
  use("stevearc/dressing.nvim")
  use("NvChad/nvim-colorizer.lua")

  --- cmp
  use("hrsh7th/nvim-cmp")
  use("hrsh7th/cmp-nvim-lsp")
  use("hrsh7th/cmp-nvim-lua")
  use("hrsh7th/cmp-buffer")
  use("hrsh7th/cmp-path")
  use("hrsh7th/cmp-cmdline")
  use("saadparwaiz1/cmp_luasnip")
  use({ "David-Kunz/cmp-npm", requires = { "nvim-lua/plenary.nvim" } })

  --- Snippets
  use({ "L3MON4D3/LuaSnip", tag = "v1.*" }) -- Snippets
  use("rafamadriz/friendly-snippets")

  if packer_bootstrap then
    require("packer").sync()
  end
end)
