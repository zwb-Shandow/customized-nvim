local colorscheme = "onedarker"
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("not found colorscheme " .. colorscheme)
  return
end
