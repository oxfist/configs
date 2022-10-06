local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
  return
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- Make sure all binaries referenced below are installed
local SOURCES = {
  null_ls.builtins.formatting.prettierd,
  null_ls.builtins.formatting.markdownlint
}

local lsp_formatting = function(bufnr)
  -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
  vim.lsp.buf.format({
    filter = function(client)
      return client.name == "null-ls"
    end,
    bufnr = bufnr
  })
end

null_ls.setup({
  sources = SOURCES,
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
