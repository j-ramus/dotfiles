require("ramus.core")
require("ramus.lazy")
require("ramus.dap-config")

-- Open oil when starting nvim with no arguments
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    if vim.fn.argc() == 0 then
      vim.defer_fn(function()
        require("oil").open()
      end, 10)
    end
  end,
})


require('lualine').setup({
  sections = {
    lualine_x = { 
      "encoding", { 
        "fileformat", symbols = { 
          unix = " ", dos = "󰨡 ", mac = " "
        }, color = { fg = '#FF0000'} 
      }, "filetype" 
    },
  },
})


