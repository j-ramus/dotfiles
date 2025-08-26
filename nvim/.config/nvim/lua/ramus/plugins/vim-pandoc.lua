return {
    "vim-pandoc/vim-pandoc",
    ft = { "markdown", "pandoc" },
    dependencies = { "vim-pandoc/vim-pandoc-syntax" },
    config = function()
        -- Disable performance-heavy features
        vim.g['pandoc#modules#disabled'] = {"folding", "formatting", "bibliographies"}
        vim.g['pandoc#syntax#conceal#use'] = 0  -- Disable concealing
        vim.g['pandoc#folding#mode'] = "manual"  -- Manual folding only
        vim.g['pandoc#formatting#mode'] = "h"    -- Disable auto-formatting
    end
}
