local status_ok, _ = pcall(require, "luasnip")
if not status_ok then
  return
end

local status_ok_vscode, from_vscode = pcall(require, "luasnip.loaders.from_vscode")
if not status_ok_vscode then
  return
end

from_vscode.lazy_load()
