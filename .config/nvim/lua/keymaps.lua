local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

local NORMAL_MODE = "n"
local INTERACTIVE_MODE = "i"
local VISUAL_MODE = "v"

local ESCAPE_KEY = "<ESC>"
local SPACE_KEY = "<Space>"

keymap("", SPACE_KEY, "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap(NORMAL_MODE, "<C-h>", "<C-w>h", opts)
keymap(NORMAL_MODE, "<C-j>", "<C-w>j", opts)
keymap(NORMAL_MODE, "<C-k>", "<C-w>k", opts)
keymap(NORMAL_MODE, "<C-l>", "<C-w>l", opts)

keymap(INTERACTIVE_MODE, "kj", ESCAPE_KEY, opts)
keymap(INTERACTIVE_MODE, "KJ", ESCAPE_KEY, opts)

keymap(VISUAL_MODE, "<", "<gv", opts)
keymap(VISUAL_MODE, ">", ">gv", opts)
keymap(VISUAL_MODE, "p", '"_dP', opts)
