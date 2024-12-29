require("ramus.core")
require("ramus.lazy")
require("ramus.dap-config")
require('lualine').setup({
	sections = {
		lualine_x = { "encoding", { "fileformat", symbols = { unix = "󰞦" } }, "filetype" },
	},
})
