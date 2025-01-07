return {
    {
        "jay-babu/mason-nvim-dap.nvim",
        event = "VeryLazy",
        dependencies = {
            "williamboman/mason.nvim",
            "mfussenegger/nvim-dap",
        },
        opts = {
          handlers = {},
        },
    },
    {
      "rcarriga/nvim-dap-ui",
      event = "VeryLazy",
      dependencies = {
        "mfussenegger/nvim-dap",
        "nvim-neotest/nvim-nio",
      },
      config = function()
      require("dapui").setup()
      end,
    },
}
