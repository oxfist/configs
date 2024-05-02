local status_ok, treesitter_configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

local status_ok_comment, comment = pcall(require, "Comment")
if not status_ok_comment then
  return
end

treesitter_configs.setup({
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = { enable = true, disable = { "yaml" } },
  autotag = {
    enable = true,
  },
  ensure_installed = {
    "astro",
    "bash",
    "c",
    "css",
    "graphql",
    "html",
    "javascript",
    "jsdoc",
    "json",
    "lua",
    "markdown",
    "markdown_inline",
    "query",
    "ruby",
    "rust",
    "toml",
    "typescript",
    "vim",
  },
  sync_install = false,
  playground = {
    enable = true,
  },
  query_linter = {
    enable = true,
    use_virtual_text = true,
    lint_events = { "BufWrite", "CursorHold" },
  },
})

ts_context_commentstring.setup({
  enable_autocmd = false,
})

comment.setup({
  pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
})
