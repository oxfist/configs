local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

local NORMAL_MODE = "n"
local INSERT_MODE = "i"
local VISUAL_MODE = "v"
local ANY_MODE = ""

local ENTER_KEY = "<CR>"
local ESCAPE_KEY = "<ESC>"
local RUN_CODE_KEY = "<F8>"
local SPACE_KEY = "<Space>"

keymap(ANY_MODE, SPACE_KEY, "<Nop>", opts)
keymap(ANY_MODE, RUN_CODE_KEY, ":MarkdownPreview<CR>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap(NORMAL_MODE, "<C-h>", "<C-w>h", opts)
keymap(NORMAL_MODE, "<C-j>", "<C-w>j", opts)
keymap(NORMAL_MODE, "<C-k>", "<C-w>k", opts)
keymap(NORMAL_MODE, "<C-l>", "<C-w>l", opts)
keymap(NORMAL_MODE, "<Leader>e", ":NvimTreeToggle" .. ENTER_KEY, opts)
keymap(NORMAL_MODE, "<Leader>t", ":TSHighlightCapturesUnderCursor" .. ENTER_KEY, opts)
keymap(NORMAL_MODE, "<Leader>k", ":Telescope keymaps" .. ENTER_KEY, opts)
keymap(NORMAL_MODE, "<Leader>p", ":TSPlaygroundToggle" .. ENTER_KEY, opts)
keymap(NORMAL_MODE, "<Leader>,", ":nohlsearch" .. ENTER_KEY, opts)
keymap(NORMAL_MODE, "<C-p>", ":Telescope find_files" .. ENTER_KEY, opts)

keymap(INSERT_MODE, "<C-p>", "", opts)
keymap(INSERT_MODE, "<C-n>", "", opts)
keymap(INSERT_MODE, "kj", ESCAPE_KEY, opts)
keymap(INSERT_MODE, "KJ", ESCAPE_KEY, opts)

keymap(VISUAL_MODE, "<", "<gv", opts)
keymap(VISUAL_MODE, ">", ">gv", opts)
keymap(VISUAL_MODE, "p", '"_dP', opts)

-- Yes, we're just executing a bunch of Vimscript using vim.cmd
vim.cmd([[
  " Use Tab to expand and jump through snippets
  imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'
  smap <silent><expr> <Tab> luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<Tab>'

  " Use Shift-Tab to jump backwards through snippets
  imap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
  smap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
]])
