local status_ok, devicons = pcall(require, "nvim-web-devicons")
if not status_ok then
  return
end

devicons.setup()

devicons.set_icon({
  Dockerfile = { icon = "", name = "Dockerfile" },
  R = { icon = "", name = "R" },
  r = { icon = "", name = "R" },
  scm = { icon = "λ", name = "Scheme" },
  svg = { icon = "", name = "Svg" },
  txt = { icon = "", name = "Txt" },
})
