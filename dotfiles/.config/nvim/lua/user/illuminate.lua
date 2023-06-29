local status_ok_illuminate, illuminate = pcall(require, "illuminate")
if not status_ok_illuminate then
  return
end

illuminate.configure({
  providers = {
    "lsp",
    "treesitter",
    "regex",
  },
  delay = 200,
  filetypes_denylist = {
    "alpha",
    "dirvish",
    "fugitive",
    "help",
    "lir",
    "neogitstatus",
    "packer",
    "qf",
    "spectre_panel",
    "toggleterm",
    "DressingSelect",
    "NvimTree",
    "Outline",
    "TelescopePrompt",
    "Trouble",
  },
  min_count_to_highlight = 2,
})
