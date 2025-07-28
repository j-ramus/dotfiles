return {

  "neovim/nvim-lspconfig",

  event = { "BufReadPre", "BufNewFile" },

  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
    { "folke/neodev.nvim", opts = {} },
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
        keymap.set("n", "<leader>gR", "Telescope lsp_references", opts)
        opts.desc = "Go to declaration"
        keymap.set("n", "<leader>gD", vim.lsp.buf.declaration, opts)
        opts.desc = "Show LSP definitions"
        keymap.set("n", "<leader>gd", "Telescope lsp_definitions", opts)
        opts.desc = "Show LSP implementations"
        keymap.set("n", "<leader>gi", "Telescope lsp_implementations", opts)
        opts.desc = "Show LSP type definitions"
        keymap.set("n", "<leader>gt", "Telescope lsp_type_definitions", opts)
        opts.desc = "See available code actions"
        --keymap.set({ "n", "v" }, "ca", vim.lsp.buf.code_action, opts)
        --opts.desc = "Smart rename"
        keymap.set("n", "rn", vim.lsp.buf.rename, opts)
        opts.desc = "Show buffer diagnostics"
        keymap.set("n", "<leader>D", "Telescope diagnostics bufnr=0", opts)
        opts.desc = "Show line diagnostics"
        keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
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

    -- capabilities for autocompletion
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
      virtual_text = true,
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

        -- clangd with custom cmd and root_dir
        ["clangd"] = function()
          lspconfig["clangd"].setup({
            cmd = { "clangd", "--query-driver=/usr/bin/clang,/usr/bin/gcc", "--all-scopes-completion" },
            root_dir = require("lspconfig.util").root_pattern("compile_commands.json", ".git"),
            capabilities = capabilities,
          })
        end,

        -- svelte server with on_attach to setup autocmd for file changes
        ["svelte"] = function()
          lspconfig["svelte"].setup({
            capabilities = capabilities,
            on_attach = function(client, bufnr)
              vim.api.nvim_create_autocmd("BufWritePost", {
                pattern = { "*.js", "*.ts" },
                callback = function(ctx)
                  client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.match })
                end,
              })
            end,
          })
        end,

        -- graphql server
        ["graphql"] = function()
          lspconfig["graphql"].setup({
            capabilities = capabilities,
            filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
          })
        end,

        -- emmet language server
        ["emmet_ls"] = function()
          lspconfig["emmet_ls"].setup({
            capabilities = capabilities,
            filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
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
                  enable = true,
                },
              },
            },
          })
        end,
      },
    })
  end,
}

