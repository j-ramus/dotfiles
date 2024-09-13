require("ramus.core.options")
require("ramus.core.keymaps")


-- Create a Neovim command for Pandoc PDF conversion
vim.api.nvim_create_user_command('MarkdownToPDF', function()
    vim.cmd('!pandoc % -o %:r.pdf')
end, {})
