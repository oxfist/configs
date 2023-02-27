-- Setup in the following order as per: https://github.com/williamboman/mason-lspconfig.nvim#setup
local status_ok, mason = pcall(require, "mason")
if not status_ok then
  return
end

local status_ok_mason_config, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok_mason_config then
  return
end

local status_ok_lsp_config, lspconfig = pcall(require, "lspconfig")
if not status_ok_lsp_config then
  return
end

local status_ok_windows, windows = pcall(require, "lspconfig.ui.windows")
if not status_ok_windows then
  return
end

local LANGUAGE_SERVERS = {
  "bashls",
  "cssls",
  "cssmodules_ls",
  "html",
  "jsonls",
  "marksman",
  "ruby_ls",
  "rust_analyzer",
  "stylelint_lsp",
  "solargraph",
  "lua_ls",
  "tailwindcss",
  "taplo",
  "tsserver",
  "yamlls",
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
  ensure_installed = LANGUAGE_SERVERS,
  automatic_installation = true,
})

windows.default_options.border = "rounded"

for _, server in pairs(LANGUAGE_SERVERS) do
  local lsp_opts = {
    on_attach = require("user.lsp.handlers").on_attach,
    capabilities = require("user.lsp.handlers").capabilities,
  }

  server = vim.split(server, "@")[1]

  if server == "jsonls" then
    local jsonls_opts = require("user.lsp.settings.jsonls")
    lsp_opts = vim.tbl_deep_extend("force", jsonls_opts, lsp_opts)
  end

  if server == "ruby_ls" then
    local rubyls_opts = require("user.lsp.settings.ruby_ls")
    lsp_opts = vim.tbl_deep_extend("force", rubyls_opts, lsp_opts)
  end

  if server == "lua_ls" then
    local lua_ls_opts = require("user.lsp.settings.lua_ls")
    lsp_opts = vim.tbl_deep_extend("force", lua_ls_opts, lsp_opts)
  end

  if server == "stylelint_lsp" then
    local stylelint_opts = require("user.lsp.settings.stylelint_lsp")
    lsp_opts = vim.tbl_deep_extend("force", stylelint_opts, lsp_opts)
  end

  -- Set up each LSP server
  lspconfig[server].setup(lsp_opts)
end
