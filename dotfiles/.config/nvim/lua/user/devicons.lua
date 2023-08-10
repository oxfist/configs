local status_ok, devicons = pcall(require, "nvim-web-devicons")
if not status_ok then
  return
end

devicons.setup()

devicons.set_icon({
  scm = {
    icon = "λ",
    color = "#000000",
    cterm_color = "16",
    name = "Scheme",
  },
  txt = {
    icon = "",
    color = "#447028",
    cterm_color = "22",
    name = "Txt",
  },
})
