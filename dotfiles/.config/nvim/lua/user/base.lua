vim.cmd("autocmd!")

vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
vim.opt.backup = false
vim.opt.clipboard = "unnamedplus"
vim.opt.completeopt = { "menuone", "noselect" }
vim.opt.cmdheight = 2
vim.opt.conceallevel = 0
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.mouse = "a"
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.updatetime = 300
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 4
vim.opt.wrap = true
vim.opt.breakindent = true
vim.opt.signcolumn = "yes"
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.cursorlineopt = "line,number"
vim.opt.colorcolumn = "100"
vim.opt.guicursor = "n-v-c:block-Cursor/lCursor,i-ci-ve:ver25-Cursor/lCursor,r-cr:hor20,o:hor50"
vim.opt.list = true
-- vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

vim.api.nvim_command([[
  set listchars=tab:\→\ ,multispace:·
]])

vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
  pattern = "Brewfile",
  command = "set filetype=ruby",
})

vim.g.python3_host_prog = "~/.pyenv/versions/py3nvim/bin/python"

vim.api.nvim_create_autocmd("VimEnter", {
  desc = "Auto select virtualenv Nvim open",
  pattern = "*",
  callback = function()
    local venv = vim.fn.findfile("pyproject.toml", vim.fn.getcwd() .. ";")
    -- if venv ~= "" then
    --   require("venv-selector").retrieve_from_cache()
    -- end
  end,
  once = true,
})

-- Function to source a project-specific config if it exists
local function load_project_config()
  local project_config = vim.fn.getcwd() .. "/.nvim/init.lua"
  if vim.fn.filereadable(project_config) == 1 then
    vim.cmd("source " .. project_config)
  end
end

-- Create autocommands using nvim_create_autocmd
vim.api.nvim_create_autocmd("VimEnter", {
  pattern = "*",
  callback = load_project_config,
})

vim.api.nvim_create_autocmd("DirChanged", {
  pattern = "*",
  callback = load_project_config,
})
