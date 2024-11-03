local status_ok, treesitter_configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

local status_ok_comment, comment = pcall(require, "Comment")
if not status_ok_comment then
  return
end

local status_ok_context, ts_context_commentstring = pcall(require, "ts_context_commentstring")
if not status_ok_context then
  return
end

-- local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
-- parser_config.vim = {
--   install_info = {
--     url = "~/Coding/tree-sitter-vim", -- local path or git repo
--     files = { "src/parser.c", "src/scanner.c" }, -- note that some parsers also require src/scanner.c or src/scanner.cc
--     -- optional entries:
--     branch = "master", -- default branch in case of git repo if different from master
--     generate_requires_npm = false, -- if stand-alone parser without npm dependencies
--     requires_generate_from_grammar = true, -- if folder contains pre-generated src/parser.c
--   },
--   filetype = "vim", -- if filetype does not match the parser name
-- }

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
    -- "vim",
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
