return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  dependencies = {
    "windwp/nvim-ts-autotag",
  },
  config = function()
    -- import nvim-treesitter plugin
    local treesitter = require("nvim-treesitter.configs")

    -- configure treesitter
    treesitter.setup({ -- enable syntax highlighting
      highlight = {
        enable = true,
        -- Disable treesitter for latex (vimtex handles it better)
        disable = { "latex" },
      },
      -- enable indentation
      indent = { enable = true },
      -- enable autotagging (w/ nvim-ts-autotag plugin)
      autotag = {
        enable = true,
      },
      -- ensure these language parsers are installed
      ensure_installed = {
        "arduino",
        "bash",
        "c",
        "commonlisp",
        "cmake",
        "cpp",
        "csv",
        "dockerfile",
        "diff",
        "fortran",
        "git_config",
        "git_rebase",
        "gitattributes",
        "gitcommit",
        "gitignore",
        "go",
        "json",
        "markdown",
        "markdown_inline",
        "latex",
        "lua",
        "matlab",
        "nasm",
        "python",
        "regex",
        "rust",
        "ssh_config",
        "toml",
        "v",
        "vim",
        "vimdoc",
        "verilog",
        "xml",
        "yaml",
        "zig",
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
    })
  end,
}
