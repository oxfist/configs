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
  delay = 120,
  filetypes_denylist = {
    "dirvish",
    "fugitive",
    "alpha",
    "NvimTree",
    "packer",
    "neogitstatus",
    "Trouble",
    "lir",
    "Outline",
    "spectre_panel",
    "toggleterm",
    "DressingSelect",
    "TelescopePrompt",
  },
})
