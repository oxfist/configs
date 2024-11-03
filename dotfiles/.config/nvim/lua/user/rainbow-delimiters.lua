local status_ok, rainbow_delimiters = pcall(require, "rainbow-delimiters.setup")
if not status_ok then
  return
end

rainbow_delimiters.setup({
  highlight = {
    "RainbowDelimiterYellow",
    "RainbowDelimiterViolet",
    "RainbowDelimiterBlue",
  },
  query = {
    markdown = "",
    javascript = "rainbow-parens",
    typescript = "rainbow-parens",
    tsx = "rainbow-parens",
  },
})
