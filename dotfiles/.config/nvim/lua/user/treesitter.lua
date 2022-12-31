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
    additional_vim_regex_highlighting = true,
  },
  indent = { enable = true, disable = { "yaml" } },
  autotag = {
    enable = true,
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
  ensure_installed = { "vim", "lua", "javascript", "html", "css", "rust", "typescript", "bash" },
  sync_install = false,
  -- ignore_install = { "" }, -- List of parsers to ignore installing
  rainbow = {
    enable = true,
    extended_mode = false,
    max_file_lines = nil,
    colors = {
      "#ffd701", -- yellow from night-owl theme
      "#c792ea", -- purple form night-owl theme
      "#82aaff", -- blue from night-owl theme
    },
  },
  playground = {
    enable = true,
  },
  query_linter = {
    enable = true,
    use_virtual_text = true,
    lint_events = { "BufWrite", "CursorHold" },
  },
})

comment.setup({
  pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
})
