return {

  "neovim/nvim-lspconfig",

  event = { "BufReadPre", "BufNewFile" },

  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "ziglang/zig.vim",
    { "antosha417/nvim-lsp-file-operations", config = true },
    { "folke/neodev.nvim", opts = {} },
    { "nvimtools/none-ls.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
  },

  config = function()
    -- import plugins
    local lspconfig = require("lspconfig")
    local mason_lspconfig = require("mason-lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")
    local keymap = vim.keymap

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        local opts = { buffer = ev.buf, silent = true }
        opts.desc = "Show LSP references"
        keymap.set("n", "<leader>gR", "<cmd>Telescope lsp_references<CR>", opts)
        opts.desc = "Go to declaration"
        keymap.set("n", "<leader>gD", vim.lsp.buf.declaration, opts)
        opts.desc = "Show LSP definitions"
        keymap.set("n", "<leader>gd", "<cmd>Telescope lsp_definitions<CR>", opts)
        opts.desc = "Show LSP implementations"
        keymap.set("n", "<leader>gi", "<cmd>Telescope lsp_implementations<CR>", opts)
        opts.desc = "Show LSP type definitions"
        keymap.set("n", "<leader>gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)
        opts.desc = "Go to previous diagnostic"
        keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
        opts.desc = "Go to next diagnostic"
        keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
        opts.desc = "Show documentation for what is under cursor"
        keymap.set("n", "K", vim.lsp.buf.hover, opts)
        opts.desc = "Restart LSP"
        keymap.set("n", "rs", ":LspRestart", opts)
      end,
    })

vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#3e424b", fg = "#ed5d91" }) -- Set background and foreground color of the float box
vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#FC9D9A" }) 
    -- capabilities for autocompletion
    --
    local capabilities = cmp_nvim_lsp.default_capabilities()


        vim.diagnostic.config({
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = "󰚌",
          [vim.diagnostic.severity.WARN] = "󰚑",
          [vim.diagnostic.severity.INFO] = "󰋔",
          [vim.diagnostic.severity.HINT] = "󰟟",
        },
      },
      virtual_text = false,
      virtual_lines = false,
      underline = true,
      severity_sort = true,
      float = { border = "rounded", source = "always" },
    })


    mason_lspconfig.setup({
      handlers = {

        -- default handler (for all installed servers without a dedicated handler)
        function(server_name)
          lspconfig[server_name].setup({
            capabilities = capabilities,
          })
        end,


        -- Pyright for Python
    --["pyright"] = function()
    --  lspconfig.pyright.setup({
    --    capabilities = capabilities,
    --    settings = {
    --      python = {
    --        analysis = {
    --          typeCheckingMode = "basic", -- Options: "off", "basic", "strict"
    --          autoSearchPaths = true,
    --          useLibraryCodeForTypes = true,
    --        },
    --      },
    --    },
    --    root_dir = lspconfig.util.root_pattern("pyproject.toml", "setup.py", ".git") or vim.loop.cwd,
    --  })
    --end,

    -- Ruff for linting and formatting
    ["ruff"] = function()
      lspconfig.ruff.setup({
        capabilities = capabilities,
        root_dir = lspconfig.util.root_pattern("pyproject.toml", "ruff.toml", ".git") or vim.loop.cwd,
        settings = {
          -- Optional: Customize Ruff settings
          args = { "--extend-select", "I" }, -- Enable additional checks (e.g., isort for imports)
        },
      })
    end,

        -- clangd with custom cmd and root_dir
        ["clangd"] = function()
          lspconfig["clangd"].setup({
            cmd = { "clangd", "--query-driver=/usr/bin/clang,/usr/bin/gcc", "--all-scopes-completion" },
            root_dir = require("lspconfig.util").root_pattern("compile_commands.json", ".git"),
            capabilities = capabilities,
          })
        end,

                -- ZLS with custom settings
        ["zls"] = function()
          lspconfig.zls.setup({
            -- Server-specific settings for ZLS
            -- For example:
            filetypes = { "zig", "zir" },
            root_dir = lspconfig.util.root_pattern("build.zig", ".git") or vim.loop.cwd,
            single_file_support = true,
            -- Optional ZLS-specific configuration options, as suggested by zigtools.org
            -- settings = {
            --   zls = {
            --     enable_build_on_save = true,
            --     zig_exe_path = '/path/to/your/zig_executable', -- If not in PATH
            --   }
            -- }
          })
        end,

        -- lua language server with special settings
        ["lua_ls"] = function()
          lspconfig["lua_ls"].setup({
            capabilities = capabilities,
            settings = {
              Lua = {
                diagnostics = {
                  globals = { "vim" },
                },
                completion = {
                  callSnippet = "Replace",
                },
              },
            },
          })
        end,

        -- texlab for LaTeX
        ["texlab"] = function()
          lspconfig["texlab"].setup({
            capabilities = capabilities,
            settings = {
              texlab = {
                build = {
                  executable = "latexmk",
                  args = { "-pdf", "-interaction=nonstopmode", "%f" },
                },
                lint = {
                  enable = false,
                },
              },
            },
          })
        end,
      },
    })
  end,
}


