local status_ok, neodim = pcall(require, "neodim")
if not status_ok then
  return
end

neodim.setup({
  alpha = 0.6,
  hide = {
    signs = false,
  },
})
