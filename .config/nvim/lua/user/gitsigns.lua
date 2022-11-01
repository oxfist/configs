local status_ok_gitsigns, gitsigns = pcall(require, "gitsigns")
if not status_ok_gitsigns then
  return
end

gitsigns.setup()
