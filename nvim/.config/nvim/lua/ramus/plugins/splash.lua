local function show_splash()
  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, {
    "",
    "                               iiii                         ", 
    "                              i::::i                        ", 
    "                               iiii                         ", 
    "                                                            ", 
    "    vvvvvvv           vvvvvvviiiiiii    mmmmmmm    mmmmmmm  ", 
    "     v:::::v         v:::::v i:::::i  mm:::::::m  m:::::::mm", 
    "      v:::::v       v:::::v   i::::i m::::::::::mm::::::::::m",
    "       v:::::v     v:::::v    i::::i m::::::::::::::::::::::m",
    "        v:::::v   v:::::v     i::::i m:::::mmm::::::mmm:::::m",
    "         v:::::v v:::::v      i::::i m::::m   m::::m   m::::m",
    "          v:::::v:::::v       i::::i m::::m   m::::m   m::::m",
    "           v:::::::::v        i::::i m::::m   m::::m   m::::m",
    "            v:::::::v        i::::::im::::m   m::::m   m::::m",
    "             v:::::v         i::::::im::::m   m::::m   m::::m",
    "              v:::v          i::::::im::::m   m::::m   m::::m",
    "               vvv           iiiiiiiimmmmmm   mmmmmm   mmmmmm",
    "                                                             ",
    "                                                             ",
    "                           uuuuuuuuuuuuuuuuuuuuu.",
    "                       .u$$$$$$$$$$$$$$$$$$$$$$$$$$W.",
    "                     u$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$Wu.",
    "                   $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$i",
    "                  $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$",
    "             `    $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$",
    "               .i$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$i",
    "               $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$W",
    "              .$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$W",
    "             .$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$i",
    "             #$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$.",
    "             W$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$",
    "    $u       #$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$~",
    "    $#      `\"$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$",
    "    $i        $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$",
    "    $$        #$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$",
    "    $$         $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$",
    "    #$.        $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$#",
    "     $$      $iW$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$!",
    "     $$i      $$$$$$$#\"\" `\"\"\"#$$$$$$$$$$$$$$$$$#\"\"\"\"\"\"#$$$$$$$$$$$$$$$W",
    "     #$$W    `$$$#\"            \"       !$$$$$`           `\"#$$$$$$$$$$#",
    "      $$$     ``                 ! !iuW$$$$$                 #$$$$$$$#",
    "      #$$    $u                  $   $$$$$$$                  $$$$$$$~",
    "       \"#    #$$i.               #   $$$$$$$.                 `$$$$$$",
    "              $$$$$i.                \"\"\"#$$$$i.               .$$$$#",
    "              $$$$$$$$!         .   `    $$$$$$$$$i           $$$$$",
    "              `$$$$$  $iWW   .uW`        #$$$$$$$$$W.       .$$$$$$#",
    "                \"#$$$$$$$$$$$$#`          $$$$$$$$$$$iWiuuuW$$$$$$$$W",
    "                   !#\"\"    \"\"             `$$$$$$$##$$$$$$$$$$$$$$$$",
    "              i$$$$    .                   !$$$$$$ .$$$$$$$$$$$$$$$#",
    "             $$$$$$$$$$`                    $$$$$$$$$Wi$$$$$$#\"#$$`",
    "             #$$$$$$$$$W.                   $$$$$$$$$$$#   ``",
    "              `$$$$##$$$$!       i$u.  $. .i$$$$$$$$$#\"\"",
    "                 \"     `#W       $$$$$$$$$$$$$$$$$$$`      u$#",
    "                                W$$$$$$$$$$$$$$$$$$      $$$$W",
    "                                $$`!$$$##$$$$``$$$$      $$$$!",
    "                               i$\" $$$$  $$#\"`  \"\"\"     W$$$$",
    "                                                       W$$$$!",
    "                          uW$$  uu  uu.  $$$  $$$Wu#   $$$$$$",
    "                         ~$$$$iu$$iu$$$uW$$! $$$$$$i .W$$$$$$",
    "                 ..  !   \"#$$$$$$$$$$##$$$$$$$$$$$$$$$$$$$$#\"",
    "                 $$W  $     \"#$$$$$$$iW$$$$$$$$$$$$$$$$$$$$$W",
    "                 $#`   `       \"\"#$$$$$$$$$$$$$$$$$$$$$$$$$$$",
    "                                  !$$$$$$$$$$$$$$$$$$$$$#`",
    "                                  $$$$$$$$$$$$$$$$$$$$$$!",
    "                                $$$$$$$$$$$$$$$$$$$$$$$`",
    "                                 $$$$$$$$$$$$$$$$$$$$\"",
  })
  
  vim.api.nvim_set_current_buf(buf)
  
  -- Hide line numbers and sign column for splash screen
  vim.wo.number = false
  vim.wo.relativenumber = false
  vim.wo.signcolumn = "no"
  vim.wo.foldcolumn = "0"
  
  -- Hide bufferline/tabline and statusline for splash screen
  vim.o.showtabline = 0
  vim.o.laststatus = 0
  vim.o.ruler = false
  vim.o.showcmd = false
  
  -- Let Oil take over after brief delay in floating window mode
  vim.defer_fn(function()
    pcall(function()
      -- Open oil in a new window without affecting splash buffer
      local oil = require("oil")
      local current_buf = vim.api.nvim_get_current_buf()
      
      -- Calculate window size and position
      local width = math.min(80, vim.o.columns - 4)
      local height = math.min(20, vim.o.lines - 25)
      local row = 22
      local col = math.floor((vim.o.columns - width) / 2)
      
      -- Create floating window first
      local oil_buf = vim.api.nvim_create_buf(false, true)
      local win = vim.api.nvim_open_win(oil_buf, false, {
        relative = "editor",
        width = width,
        height = height,
        row = row,
        col = col,
        style = "minimal",
        border = "rounded",
      })
      
      -- Open oil in the floating window
      vim.api.nvim_set_current_win(win)
      oil.open(vim.fn.getcwd())
      
      -- Keep focus on the floating window
      vim.api.nvim_set_current_win(win)
      
      -- Create command abbreviation so :q becomes :qa in this buffer
      vim.api.nvim_buf_set_option(oil_buf, "buftype", "nofile")
      vim.cmd("cnoreabbrev <buffer> q qa")
      
      -- Watch for when oil opens a file and move it to main window
      local file_opened_autocmd
      file_opened_autocmd = vim.api.nvim_create_autocmd("BufEnter", {
        callback = function(ev)
          -- If a non-oil buffer is opened and we're still in the floating window
          if vim.bo[ev.buf].filetype ~= "oil" and vim.api.nvim_get_current_win() == win then
            -- Get the opened buffer
            local opened_buf = ev.buf
            
            -- Close the floating window
            pcall(vim.api.nvim_win_close, win, false)
            
            -- Find main window
            local main_wins = vim.tbl_filter(function(w)
              return vim.api.nvim_win_get_config(w).relative == ""
            end, vim.api.nvim_list_wins())
            
            if #main_wins > 0 then
              -- Switch to main window and show the opened buffer
              vim.api.nvim_set_current_win(main_wins[1])
              vim.api.nvim_set_current_buf(opened_buf)
              
              -- Restore normal window options from your config
              vim.wo.relativenumber = true
              vim.wo.number = true
              vim.wo.signcolumn = "yes"
              vim.wo.foldcolumn = "auto"
              
              -- Restore statusline and tabline
              vim.o.laststatus = 3
              vim.o.showtabline = 1  -- Only show when multiple tabs exist
              vim.o.ruler = true
              vim.o.showcmd = true
              
              -- Set custom tabline to show only filename, not path
              vim.opt.tabline = "%!v:lua.tabline_custom()"
            end
            
            -- Clean up the autocmd
            vim.api.nvim_del_autocmd(file_opened_autocmd)
          end
        end,
      })
    end)
  end, 700)
end

-- Show splash on startup with no arguments
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    if vim.fn.argc() == 0 then
      vim.defer_fn(show_splash, 50)
    end
  end,
})

-- Custom tabline function to show only filenames
function _G.tabline_custom()
  local tabline = ''
  for i = 1, vim.fn.tabpagenr('$') do
    local winnr = vim.fn.tabpagewinnr(i)
    local bufnr = vim.fn.tabpagebuflist(i)[winnr]
    local filename = vim.fn.fnamemodify(vim.fn.bufname(bufnr), ':t')
    if filename == '' then
      filename = '[No Name]'
    end
    
    if i == vim.fn.tabpagenr() then
      tabline = tabline .. '%#TabLineSel# ' .. filename .. ' '
    else
      tabline = tabline .. '%#TabLine# ' .. filename .. ' '
    end
  end
  tabline = tabline .. '%#TabLineFill#%T'
  return tabline
end

return {}
