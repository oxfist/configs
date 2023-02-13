local status_ok, dressing = pcall(require, "dressing")
if not status_ok then
  return
end

dressing.setup({
  input = {
    get_config = function()
      if vim.api.nvim_buf_get_option(0, "filetype") == "NvimTree" then
        return { enabled = false }
      end
    end,
  },
})
