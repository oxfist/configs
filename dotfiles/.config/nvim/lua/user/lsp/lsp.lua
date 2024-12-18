-- Setup in the following order as per: https://github.com/williamboman/mason-lspconfig.nvim#setup
local status_ok, mason = pcall(require, "mason")
if not status_ok then
  return
end

local status_ok_mason_lspconfig, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok_mason_lspconfig then
  return
end

local status_ok_lspconfig, lspconfig = pcall(require, "lspconfig")
if not status_ok_lspconfig then
  return
end

local status_ok_windows, windows = pcall(require, "lspconfig.ui.windows")
if not status_ok_windows then
  return
end

-- These will be installed by Mason but not necessarily register them.
local ENSURE_INSTALLED_LSPS = {
  "bashls",
  "cssmodules_ls",
  "emmet_language_server",
  "html",
  "jsonls",
  "lua_ls",
  "marksman",
  "pylsp",
  -- "ruff",
  "rust_analyzer",
  "solargraph",
  "stylelint_lsp",
  "tailwindcss",
  "taplo",
  "ts_ls",
  "vimls",
  "yamlls",
  -- "cssls",
  -- "ruby_ls",
}

mason.setup({
  ui = {
    border = "rounded",
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
  },
})

mason_lspconfig.setup({
  ensure_installed = ENSURE_INSTALLED_LSPS,
  automatic_installation = true,
})

windows.default_options.border = "rounded"

local lsp_opts = {
  on_attach = require("user.lsp.handlers").on_attach,
  capabilities = require("user.lsp.handlers").capabilities,
}

-- TODO: extract this to a lsp.lua config file
for _, server in pairs(ENSURE_INSTALLED_LSPS) do
  server = vim.split(server, "@")[1]

  if server == "jsonls" then
    local jsonls_opts = require("user.lsp.settings.jsonls")
    lsp_opts = vim.tbl_deep_extend("force", jsonls_opts, lsp_opts)
  end

  if server == "lua_ls" then
    local lua_ls_opts = require("user.lsp.settings.lua_ls")
    lsp_opts = vim.tbl_deep_extend("force", lua_ls_opts, lsp_opts)
  end

  if server == "stylelint_lsp" then
    local stylelint_opts = require("user.lsp.settings.stylelint_lsp")
    lsp_opts = vim.tbl_deep_extend("force", stylelint_opts, lsp_opts)
  end

  if server == "pylsp" then
    local pylsp_opts = require("user.lsp.settings.pylsp")
    lsp_opts = vim.tbl_deep_extend("force", pylsp_opts, lsp_opts)
  end

  if server == "rust_analyzer" then
    local rust_analyzer_opts = {
      cmd = {
        "rustup",
        "run",
        "stable",
        "rust-analyzer",
      },
    }
    lsp_opts = vim.tbl_deep_extend("force", rust_analyzer_opts, lsp_opts)
  end

  -- Set up each LSP server
  lspconfig[server].setup(lsp_opts)
end
