-- Yes, we're just executing a bunch of Vimscript using vim.cmd
vim.cmd([[
  " Use Tab to expand and jump through snippets
  imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'
  smap <silent><expr> <Tab> luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<Tab>'

  " Use Shift-Tab to jump backwards through snippets
  imap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
  smap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
]])

local status_ok, _ = pcall(require, "luasnip")
if not status_ok then
  return
end

local status_ok_vscode, from_vscode = pcall(require, "luasnip.loaders.from_vscode")
if not status_ok_vscode then
  return
end

local status_ok_lua, from_lua = pcall(require, "luasnip.loaders.from_lua")
if not status_ok_lua then
  return
end

from_lua.load({
  paths = "~/.config/nvim/LuaSnip",
})
from_vscode.lazy_load()
