local status_ok, autopairs = pcall(require, "nvim-autopairs")
if not status_ok then
  return
end

autopairs.setup({
  -- fast_wrap = {
  -- }
})

local status_ok_cmp_autopairs, cmp_autopairs = pcall(require, "nvim-autopairs.completion.cmp")
local status_ok_cmp, cmp = pcall(require, "cmp")

if not (status_ok_cmp_autopairs or status_ok_cmp) then
  return
end

cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
