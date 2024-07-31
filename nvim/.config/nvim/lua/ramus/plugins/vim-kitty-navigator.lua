return {
  'knubie/vim-kitty-navigator',
  enabled = true,
  config = function()
    vim.g.kitty_navigator_no_mappings = 1

    vim.keymap.set('n', '<c-a>h', '<cmd>KittyNavigateLeft<cr>', { noremap = true, silent = true })
    vim.keymap.set('n', '<c-a>j', '<cmd>KittyNavigateDown<cr>', { noremap = true, silent = true })
    vim.keymap.set('n', '<c-a>k', '<cmd>KittyNavigateUp<cr>', { noremap = true, silent = true })
    vim.keymap.set('n', '<c-a>l', '<cmd>KittyNavigateRight<cr>', { noremap = true, silent = true })
  end,
}
