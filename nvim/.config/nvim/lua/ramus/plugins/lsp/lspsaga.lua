return {
  "nvimdev/lspsaga.nvim",
  branch = "main",
  event = "LspAttach",
  config = function()
    local ok, lspsaga = pcall(require, "lspsaga")
    if not ok then
      vim.notify("lspsaga not found", vim.log.levels.WARN)
      return
    end
    
    lspsaga.setup({
      ui = {
        border = "rounded",
      },
      symbol_in_winbar = {
        enable = false,
      },
      lightbulb = {
        enable = false,
      },
    })
  end,
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
}

