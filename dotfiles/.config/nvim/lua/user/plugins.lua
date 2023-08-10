local function isPackerNotInstalled(path)
  return vim.fn.empty(vim.fn.glob(path)) > 0
end

local function reloadNvimWhenSavingPluginsFile()
  vim.cmd([[
    augroup packer_user_config
      autocmd!
      autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup END
  ]])
end

-- Packer installation path for auto-install logic
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local packer_bootstrap

-- Require packer under protected call to not error on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  print("packer is not installed!")
  return
end

if isPackerNotInstalled(install_path) then
  packer_bootstrap = vim.fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print("Installing packer 💾... please close and reopen neovim.")
  vim.cmd([[ packadd packer.nvim ]])
end

reloadNvimWhenSavingPluginsFile()

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

  -- Themes
  use("oxfist/night-owl.nvim")

  -- LSP
  use("neovim/nvim-lspconfig")
  use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  })
  use("nvim-treesitter/playground")

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
  use("L3MON4D3/LuaSnip")
  use("rafamadriz/friendly-snippets")

  -- Better DX
  use("mrjones2014/nvim-ts-rainbow")
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
  use("kylechui/nvim-surround")
  use("jinh0/eyeliner.nvim")
  use("b0o/schemastore.nvim")
  use("stevearc/dressing.nvim")
  use("NvChad/nvim-colorizer.lua")
  use("folke/trouble.nvim")
  use("simrat39/symbols-outline.nvim")
  use({
    "akinsho/toggleterm.nvim",
    tag = "*",
    config = function()
      require("toggleterm").setup()
    end,
  })
  use("nvim-pack/nvim-spectre")

  -- Misc
  use("j-hui/fidget.nvim")

  if packer_bootstrap then
    require("packer").sync()
  end
end)
