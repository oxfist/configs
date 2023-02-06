local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
  return
end

local status_ok_mason_null, mason_null_ls = pcall(require, "mason-null-ls")
if not status_ok_mason_null then
  return
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- IMPORTANT: Make sure all binaries referenced below are installed
local NULL_LS_SOURCES = {
  "eslint_d",
  "markdownlint",
  "prettierd",
  "shellcheck",
  "stylua",
  "luacheck",
}

mason_null_ls.setup({
  ensure_installed = NULL_LS_SOURCES,
})

mason_null_ls.setup_handlers({
  eslint_d = function(_source_name, _methods)
    null_ls.register(null_ls.builtins.diagnostics.eslint_d)
  end,
  markdownlint = function(_source_name, _methods)
    null_ls.register(null_ls.builtins.diagnostics.markdownlint)
    null_ls.register(null_ls.builtins.formatting.markdownlint)
  end,
  luacheck = function(_source_name, _methods)
    null_ls.register(null_ls.builtins.diagnostics.luacheck)
  end,
  prettierd = function(_source_name, _methods)
    null_ls.register(null_ls.builtins.formatting.prettierd)
  end,
  shellcheck = function(_source_name, _methods)
    null_ls.register(null_ls.builtins.diagnostics.shellcheck)
  end,
  stylua = function(_source_name, _methods)
    null_ls.register(null_ls.builtins.formatting.stylua)
  end,
})

local lsp_formatting = function(bufnr)
  -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
  vim.lsp.buf.format({
    filter = function(client)
      return client.name == "null-ls"
    end,
    bufnr = bufnr,
  })
end

null_ls.setup({
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          lsp_formatting(bufnr)
        end,
      })
    end
  end,
})
