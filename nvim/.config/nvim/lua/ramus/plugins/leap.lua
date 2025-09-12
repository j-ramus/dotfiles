return {
  "ggandor/leap.nvim",
  config = function()
    local leap = require("leap")
    
    -- Don't use default mappings (which would override s/S)
    -- leap.add_default_mappings()
    
    -- Customize leap settings
    leap.opts.highlight_unlabeled_phase_one_targets = true
    leap.opts.case_sensitive = false
    
    -- Custom highlight groups for better visibility
    vim.api.nvim_set_hl(0, 'LeapBackdrop', { link = 'Comment' })
    vim.api.nvim_set_hl(0, 'LeapMatch', {
      fg = 'white',
      bold = true,
      nocombine = true,
    })
    
    -- Use f/F for leap (replaces find-char motions)
    vim.keymap.set({'n', 'x', 'o'}, 'f', function() 
      leap.leap { 
        target_windows = { vim.fn.win_getid() },
        multiline = true,
        inclusive_op = true
      } 
    end)
    vim.keymap.set({'n', 'x', 'o'}, 'F', function() 
      leap.leap { 
        target_windows = { vim.fn.win_getid() }, 
        backward = true,
        multiline = true,
        inclusive_op = true
      } 
    end)
    
    -- Cross-window search
    vim.keymap.set({'n', 'x', 'o'}, 'gs', function() leap.leap { target_windows = vim.tbl_filter(
      function(win) return vim.api.nvim_win_get_config(win).focusable end,
      vim.api.nvim_tabpage_list_wins(0)
    ) } end)
  end,
}