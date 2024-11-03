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

keymap(NORMAL_MODE, "<C-c>", ESCAPE_KEY, opts)
keymap(NORMAL_MODE, "<C-d>", "<C-d>zz", opts)
keymap(NORMAL_MODE, "<C-u>", "<C-u>zz", opts)
keymap(NORMAL_MODE, "<C-h>", "<C-w>h", opts)
keymap(NORMAL_MODE, "<C-j>", "<C-w>j", opts)
keymap(NORMAL_MODE, "<C-k>", "<C-w>k", opts)
keymap(NORMAL_MODE, "<C-l>", "<C-w>l", opts)
keymap(NORMAL_MODE, "<D-P>", ":Telescope commands" .. ENTER_KEY, opts)
keymap(
  NORMAL_MODE,
  "<Leader>f",
  ":lua require('spectre').open({ is_close = false }); require('spectre').resume_last_search();" .. ENTER_KEY,
  opts
)
keymap(NORMAL_MODE, "<Leader>d", ":TroubleToggle" .. ENTER_KEY, opts)
keymap(NORMAL_MODE, "<Leader>h", ":Telescope highlights" .. ENTER_KEY, opts)
keymap(NORMAL_MODE, "<Leader>i", ":Inspect" .. ENTER_KEY, opts)
keymap(NORMAL_MODE, "<Leader>k", ":Telescope keymaps" .. ENTER_KEY, opts)
keymap(NORMAL_MODE, "<Leader>e", ":NvimTreeToggle" .. ENTER_KEY, opts)
keymap(NORMAL_MODE, "<Leader>s", ":SymbolsOutline" .. ENTER_KEY, opts)
keymap(NORMAL_MODE, "<Leader>t", ":TSHighlightCapturesUnderCursor" .. ENTER_KEY, opts)
keymap(NORMAL_MODE, "<Leader>p", ":TSPlaygroundToggle" .. ENTER_KEY, opts)
keymap(NORMAL_MODE, "<Leader>,", ":nohlsearch" .. ENTER_KEY, opts)
keymap(NORMAL_MODE, "<F20>", ":Telescope find_files" .. ENTER_KEY, opts)
keymap(NORMAL_MODE, "n", "nzzzv", opts)
keymap(NORMAL_MODE, "N", "Nzzzv", opts)

keymap(INSERT_MODE, "<C-c>", ESCAPE_KEY, opts)
keymap(INSERT_MODE, "<C-p>", "", opts)
keymap(INSERT_MODE, "<C-n>", "", opts)
keymap(INSERT_MODE, "kj", ESCAPE_KEY, opts)
keymap(INSERT_MODE, "KJ", ESCAPE_KEY, opts)
keymap(INSERT_MODE, "<A-BS>", "<C-w>", opts)

keymap(VISUAL_MODE, "<", "<gv", opts)
keymap(VISUAL_MODE, ">", ">gv", opts)
-- keymap(VISUAL_MODE, "p", '"_dP', opts)
keymap(VISUAL_MODE, "J", ":m '>+1<CR>gv=gv", opts)
keymap(VISUAL_MODE, "K", ":m '>-2<CR>gv=gv", opts)
