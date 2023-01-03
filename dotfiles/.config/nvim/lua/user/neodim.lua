local status_ok, neodim = pcall(require, "neodim")
if not status_ok then
  return
end

neodim.setup({
  alpha = 0.7,
  hide = {
    signs = false,
  },
})
