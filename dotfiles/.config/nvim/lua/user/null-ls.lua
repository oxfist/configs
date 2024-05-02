local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
  return
end

local status_ok_mason_null, mason_null_ls = pcall(require, "mason-null-ls")
if not status_ok_mason_null then
  return
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- IMPORTANT: Make sure all binaries referenced below are available in the terminal
local ENSURE_INSTALLED = {
  "eslint_d",
  "markdownlint",
  "prettierd",
  "shellcheck",
  "stylua",
  "selene",
  -- "pyright",
  "mypy",
  "ruff",
  "blackd",
}

local lsp_formatting = function(bufnr)
  -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
  vim.lsp.buf.format({
    filter = function(client)
      return client.name == "null-ls"
    end,
    bufnr = bufnr,
  })
end

local eslint_d = require("none-ls.diagnostics.eslint_d")
local ruff = require("none-ls.diagnostics.ruff")
local shellcheck_diagnostics = require("none-ls-shellcheck.diagnostics")
local shellcheck_code_actions = require("none-ls-shellcheck.code_actions")

mason_null_ls.setup({
  ensure_installed = ENSURE_INSTALLED,

  sources = {
    eslint_d,
    ruff,
    shellcheck_code_actions,
    shellcheck_diagnostics,
    null_ls.builtins.diagnostics.markdownlint,
    null_ls.builtins.diagnostics.mypy,
    null_ls.builtins.diagnostics.selene,
    null_ls.builtins.formatting.markdownlint,
    null_ls.builtins.formatting.prettierd.with({
      prefer_local = "node_modules/.bin",
      filetypes = {
        "vue",
        "svelte",
        "html",
        "yaml",
        "graphql",
      },
    }),
    null_ls.builtins.formatting.stylua,
  },

  handlers = {
    eslint_d = function(_source_name, _methods)
      null_ls.register(eslint_d)
    end,

    shellcheck = function(_source_name, _methods)
      null_ls.register(shellcheck_diagnostics)
      null_ls.register(shellcheck_code_actions)
    end,

    ruff = function(_source_name, _methods)
      null_ls.register(ruff)
    end,

    -- latexindent = function(_source_name, _methods)
    --   null_ls.register(null_ls.builtins.formatting.latexindent.with({
    --     extra_args = {
    --       "-m",
    --     },
    --   }))
    -- end,
  },
})

null_ls.setup({
  sources = {
    -- Sources only support by none-ls
    null_ls.builtins.formatting.blackd,
  },
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
