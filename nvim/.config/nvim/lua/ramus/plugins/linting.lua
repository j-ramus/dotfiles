return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lint = require("lint")

    -- Custom clangtidy linter config with full path to clang-tidy executable
    lint.linters.clangtidy = {
      cmd = "/usr/local/opt/llvm/bin/clang-tidy",  -- Replace with your actual clang-tidy path
      stdin = false,
      args = {"--extra-arg=-std=c++20"},  -- adjust args as needed
      stream = "stdout",
      ignore_exitcode = true,
      parser = require("lint.parser").from_pattern(
        [[^(.-):(%d+):(%d+): (warning|error|note): (.*)$]],
        {"file", "lnum", "col", "severity", "message"},
        {
          warning = vim.diagnostic.severity.WARN,
          error = vim.diagnostic.severity.ERROR,
          note = vim.diagnostic.severity.INFO,
        }
      ),
    }

    lint.linters_by_ft = {
      -- JavaScript and TypeScript
      javascript = { "eslint_d" },
      typescript = { "eslint_d" },
      javascriptreact = { "eslint_d" },
      typescriptreact = { "eslint_d" },
      svelte = { "eslint_d" },

      -- Python
      python = { "flake8", "mypy", "pylint" },

      -- C and C++
      c = { "clangtidy", "cppcheck" },
      cpp = { "clangtidy", "cppcheck" },

      -- Other filetypes you had:
      clojure = { "clojure_lsp" },
      verilog = { "iverilog" },
      tex = { "chktex" },
      markdown = { "markdownlint" },
      asm = { "nasm" },
    }

    -- Create a single autocmd group to lint on these events
    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint()
      end,
    })

    -- Optional: Map a keybinding to manually trigger linting on demand
    vim.keymap.set("n", "<leader>y", function()
      lint.try_lint()
    end, { desc = "Trigger linting for current file" })
  end,
}
