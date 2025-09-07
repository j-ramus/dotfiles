return {
  "ggandor/leap.nvim",
  config = function()
    local leap = require("leap")
    
    -- Don't use default mappings (which would override s/S)
    -- leap.add_default_mappings()
    
    -- Customize leap settings
    leap.opts.highlight_unlabeled_phase_one_targets = false
    leap.opts.case_sensitive = false
    leap.opts.equivalence_classes = { ' \t\r\n', }
    
    -- Safe labels (avoid punctuation that might interfere)
    leap.opts.safe_labels = 'sfnut/SFNLHMUGTZ?'
    leap.opts.labels = 'sfnjklhodweimbuyvrpgtaqc/SFNJKLHODWEIMBUYVRPGTAQC?'
    
    -- Custom highlight groups for better visibility
    vim.api.nvim_set_hl(0, 'LeapBackdrop', { link = 'Comment' })
    vim.api.nvim_set_hl(0, 'LeapMatch', {
      fg = 'white',
      bold = true,
      nocombine = true,
    })
    
    -- Use f/F for leap (replaces find-char motions)
    vim.keymap.set({'n', 'x', 'o'}, 'f', '<Plug>(leap-forward)')
    vim.keymap.set({'n', 'x', 'o'}, 'F', '<Plug>(leap-backward)')
    
    -- Cross-window search
    vim.keymap.set({'n', 'x', 'o'}, 'gs', '<Plug>(leap-cross-window)')
  end,
}