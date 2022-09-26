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
  "eslint",
  "html",
  "jsonls",
  "tsserver",
  "marksman",
  "stylelint_lsp",
  "tailwindcss",
  "rust_analyzer",
  "sumneko_lua",
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
  automatic_installation = true
}

for _, server in pairs(LANGUAGE_SERVERS) do
  opts = {
    on_attach = require("lsp.handlers").on_attach,
    capabilities = require("lsp.handlers").capabilities,
  }

  server = vim.split(server, "@")[1]

  lspconfig[server].setup(opts)
end
