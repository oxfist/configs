local status_ok, treesitter_configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

-- TODO: fix unused highlight?
local status_ok_highlight, highlight = pcall(require, "nvim-treesitter.highlight")
if not status_ok_highlight then
  return
end

local status_ok_treesitter_context, treesitter_context = pcall(require, "treesitter-context")
if not status_ok_treesitter_context then
  return
end

local status_ok_comment, comment = pcall(require, "Comment")
if not status_ok_comment then
  return
end

treesitter_configs.setup({
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
  ensure_installed = "all",
  sync_install = false,
  -- ignore_install = { "" }, -- List of parsers to ignore installing
  highlight = {
    enable = true,
    -- disable = { "" }, -- Disable in these languages
    additional_vim_regex_highlighting = true,
  },
  indent = { enable = true, disable = { "yaml" } },
  rainbow = {
    enable = true,
    extended_mode = true,
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
})

treesitter_context.setup()

comment.setup({
  pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
})
