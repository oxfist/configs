local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
  return
end

local theme = require("alpha.themes.dashboard")
local v = vim.version()
local version = "NVIM v" .. v.major .. "." .. v.minor .. "." .. v.patch

theme.section.header.opts.hl = "@command"
theme.section.header.val = {
  "         //                 /*          ",
  "      ,(/(//,               *###        ",
  "    ((((((////.             /####%*     ",
  " ,/(((((((/////*            /########   ",
  "/*///((((((//////.          *#########/ ",
  "//////((((((((((((/         *#########/.",
  "////////((((((((((((*       *#########/.",
  "/////////(/(((((((((((      *#########(.",
  "//////////.,((((((((((/(    *#########(.",
  "//////////.  /(((((((((((,  *#########(.",
  "(////////(.    (((((((((((( *#########(.",
  "(////////(.     ,#((((((((((##########(.",
  "((//////((.       /#((((((((##%%######(.",
  "((((((((((.         #(((((((####%%##%#(.",
  "((((((((((.          ,((((((#####%%%%%(.",
  " .#(((((((.            (((((#######%%   ",
  "    /(((((.             .(((#%##%%/*    ",
  "      ,(((.               /(#%%#        ",
  "        ./.                 #*          ",
}

theme.section.buttons.val = {
  theme.button("e", "  > New file", ":ene <BAR> startinsert <CR>"),
  theme.button("f", "  > Find file", ":Telescope find_files<CR>"),
  theme.button("r", "  > Recent", ":Telescope oldfiles<CR>"),
  theme.button("s", "  > Settings", ":e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>"),
  theme.button("q", "  > Quit NVIM", ":qa<CR>"),
}

theme.section.footer.val = version

alpha.setup(theme.opts)
