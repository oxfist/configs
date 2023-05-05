local status_ok, neodim = pcall(require, "neodim")
if not status_ok then
  return
end

-- neodim.setup({
--   alpha = 0,
--   blend_color = "#000000",
--   update_in_insert = {
--     enable = false,
--   },
-- })

-- neodim.setup({
--   refresh_delay = 75,
--   alpha = 0.25,
--   hide = {
--     underline = true,
--     virtual_text = true,
--     signs = true,
--   },
--   -- update_in_insert = {
--   --   enable = false,
--   -- },
-- })
