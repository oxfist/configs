local status_ok, illuminate = pcall(require, "illuminate")
if not status_ok then
  return
end

illuminate.configure({
  providers = {
    "lsp",
    "treesitter",
    "regex",
  },
  delay = 100,
  filetypes_denylist = {
    "alpha",
    "checkhealth",
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
  min_count_to_highlight = 1,
  under_cursor = true,
})
