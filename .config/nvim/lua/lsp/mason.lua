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

local LANGUAGE_SERVERS = {
  "bashls",
  "cssls",
  "cssmodules_ls",
  "html",
  "jsonls",
  "marksman",
  "rust_analyzer",
  "stylelint_lsp",
  "sumneko_lua",
  "tailwindcss",
  "tsserver",
  "yamlls",
}

mason.setup {
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
}

mason_lspconfig.setup {
  ensure_installed = LANGUAGE_SERVERS,
  automatic_installation = true,
}

for _, server in pairs(LANGUAGE_SERVERS) do
  local opts = {
    on_attach = require("lsp.handlers").on_attach,
    capabilities = require("lsp.handlers").capabilities,
  }

  server = vim.split(server, "@")[1]

  if server == "sumneko_lua" then
    local sumneko_opts = require "lsp.settings.sumneko_lua"
    opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
  end

  if server == "stylelint_lsp" then
    local stylelint_opts = require "lsp.settings.stylelint_lsp"
    opts = vim.tbl_deep_extend("force", stylelint_opts, opts)
  end

  lspconfig[server].setup(opts)
end
