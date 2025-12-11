require("ramus.core")
require("ramus.lazy")
require("ramus.dap-config")

-- Tab bar only shows when there are 2+ tabs
vim.opt.showtabline = 1

vim.opt.autoread = true
vim.opt.updatetime = 1000  -- Check every 1000ms (1 second)

vim.api.nvim_create_autocmd({"FocusGained", "BufEnter", "CursorHold"}, {
  pattern = "*",
  command = "checktime"
})
