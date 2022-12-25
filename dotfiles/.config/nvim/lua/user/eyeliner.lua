local status_ok, eyeliner = pcall(require, "eyeliner")
if not status_ok then
  return
end

local GLOBAL_NAMESPACE_ID = 0
local PRIMARY_HIGHLIGHT_FOREGROUND = "#afff5f"
local SECONDARY_HIGHLIGHT_FOREGROUND = "#5fffff"

vim.api.nvim_set_hl(GLOBAL_NAMESPACE_ID, "EyelinerPrimary", { fg = PRIMARY_HIGHLIGHT_FOREGROUND, bold = true })
vim.api.nvim_set_hl(GLOBAL_NAMESPACE_ID, "EyelinerSecondary", { fg = SECONDARY_HIGHLIGHT_FOREGROUND })

eyeliner.setup({
  highlight_on_key = true,
})
