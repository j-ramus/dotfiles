vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk"})

--autocorrect my dumb mistakes
--keymap.set("i", "teh", "the")
--keymap.set("i", "Teh", "The")
--keymap.set("i", "thier", "their")
--keymap.set("i", "Thier", "Their")
--keymap.set("i", "osu", "Oregon State University")
--keymap.set("i", "adn", "and")


keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>ss", "<C-w>v", { desc = "Duplicate vertically" }) -- split window vertically
keymap.set("n", "<leader>sd", "<C-w>s", { desc = "Duplicate horizontally" }) -- split window horizontally
keymap.set("n", "<leader>sh", "<C-w>n", { desc = "New horizontal split" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window
keymap.set("n", "<leader>sv", "<cmd>vs <bar> enew<CR>", { desc = "New vertical split"})
keymap.set("n", "<leader>so", "<cmd> only <CR>", { desc = "Close all but current split"})

-- tabs
keymap.set("n", "<leader>to", "<cmd>tabnew <bar> Telescope oldfiles<CR>", { desc = "Open recent files in anew tab" }) -- open new tab
keymap.set("n", "<leader>tz", "<cmd>tabnew <bar> term<CR>", { desc = "Open terminal in a new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab
keymap.set("n", "<leader>tt", "<cmd>tabnew <bar> NvimTreeToggle<CR>)", { desc = "Open file explorer in new tab"}) -- New blank tab

-- search
keymap.set("n", "<Leader>o", ":Telescope oldfiles<CR>", { desc = "Recent Files", silent = true })
keymap.set("n", "<Leader>b", ":Telescope buffers<CR>", { desc = "Active Buffers", silent = true })
keymap.set("n", "<Leader>r", ":Telescope registers<CR>", { desc = "Registers", silent = true })

keymap.set("n", "<Leader>0",":normal! Go<CR>", { desc = "New Line", silent = true })

-- LaTeX
keymap.set("n", "<Leader>ll", ":VimtexCompile<CR>", { desc = "Toggle tex compiler", silent = true })
keymap.set("n", "<Leader>lt", ":VimtexTocToggle<CR>", { desc = "Toggle tex TOC", silent = true })
keymap.set("n", "<Leader>lw", "<Cmd>!texcount -1 '%:p'<CR>", { desc = "Word Count", silent = true})
keymap.set("n", "<Leader>ta", "<Cmd>tab all<CR>", { desc = "All buffers into tabs", silent = true })
-- keymap.set("n", "<Leader>md", "<Cmd>MarkdownToPDF<CR>", { desc = "Compile Markdown to PDF", silent = true })

-- Arduino-cli
keymap.set('n', '<leader>al', function()
  require('lazy').load({plugins = {'vim-arduino'}})
  -- Optionally call plugin-specific functions here
end, { desc = 'Lazy-Load vim-arduino' })

keymap.set("n", "<leader>aa", "<Cmd>AirduinoAttach<CR>", { desc = "Attach to board" })
keymap.set("n", "<leader>ac", "<Cmd>AirduinoChooseBoard<CR>", { desc = "Choose board" })
keymap.set("n", "<leader>ax", "<Cmd>AirduinoChooseProgrammer<CR>", { desc = "Choose programmer" })
keymap.set("n", "<leader>ap", "<Cmd>AirduinoChoosePort<CR>", { desc = "Choose serial port" })
keymap.set("n", "<leader>ab", "<Cmd>AirduinoVerify<CR>", { desc = "Build sketch" })
keymap.set("n", "<leader>au", "<Cmd>AirduinoUpload<CR>", { desc = "Build and upload sketch" })
keymap.set("n", "<leader>ad", "<Cmd>AirduinoSerial<CR>", { desc = "Serial debugger" })
keymap.set("n", "<leader>aD", "<Cmd>AirduinoUploadAndSerial<CR>", { desc = "Build, upload, and conect for debugging" })
keymap.set("n", "<leader>ai", "<Cmd>AirduinoInfo<CR>", { desc = "Display internal information" })

-- Move chenks of highlighted thext with shift+j shift+k
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- LaTeX snippets
keymap.set("n", "<leader>lsh", "<Cmd>r ~/Documents/LaTeX/templates/hw1.tex<CR>20j2wa", { desc = "Homwork template; basic"})
-- keymap.set("n", "<leader>lsn", "<Cmd>r ~/Documents/LaTeX/templates/notes.tex<CR>kdd14j3w<Cmd>r! echo(date +' %B %e' | sed 's/^ *//'<CR>", { desc = "Note taking template"})
keymap.set("n", "<leader>lst1", "<Cmd>r ~/Documents/LaTeX/snippets/truthTable1<CR>", { desc = "Small truth table"})
keymap.set("n", "<leader>lst2", "<Cmd>r ~/Documents/LaTeX/snippets/truthTable2<CR>", { desc = "Large truth table"})
keymap.set("n", "<leader>lsi", "<Cmd> r ~/Documents/LaTeX/snippets/studentid<CR>", { desc = "OSU student ID"})
keymap.set("n", "<leader>l9", "<Cmd> r ~/Documents/LaTeX/snippets/dynamicParenthesis<CR>6li", { desc = "Dynamic parenthesis"})

keymap.set("n", "<leader>lsx", "<Cmd> r ~/Documents/LaTeX/snippets/crossProduct<CR>6li", { desc = "Cross Product"})

--C++ Snippets
keymap.set("n","<leader>csh", "<Cmd> r ~/Documents/LaTeX/snippets/fileheader<CR>", { desc = "C++ file header"})
keymap.set("n","<leader>lsf", "<Cmd> r ~/Documents/LaTeX/snippets/function<CR>", { desc = "C++ function comment"})

vim.keymap.set("n", "<leader>lsn", function()
  vim.cmd("r ~/Documents/LaTeX/templates/notes.tex")
  vim.cmd("normal! kdd20j3w")
  local date = vim.fn.system("date +'%B %d, %Y'")
  date = date:gsub("%s+$", "")
  vim.api.nvim_put({ "\\date{" .. date .. "}" }, "l", true, true)
  vim.cmd("normal! 3k2we")
  vim.cmd("startinsert")
end, { desc = "Note taking template with date" })


-- Marks
keymap.set("n", "<leader>m", ":Telescope marks<CR>", { desc = "Telescope Marks", silent = true})



-- C++ Snippets
keymap.set("n", "<leader>cts", "<Cmd>r ~/Documents/cpp/snippets/neutral<CR>", { desc = "Flexible main file"})

--DAP
--vim.keymap.set("n", "<F5>", function() require'dap'.continue() end)
-- vim.keymap.set("n", "<F10>", function() require'dap'.step_over() end)
-- vim.keymap.set("n", "<F11>", function() require'dap'.step_into() end)
-- vim.keymap.set("n", "<F12>", function() require'dap'.step_out() end)
-- vim.keymap.set("n", "<F6>", function() require'dap'.toggle_breakpoint() end)
-- vim.keymap.set("n", "<F7>", function() require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: ')) end)



-- Toggle diagnostics globally
function ToggleGlobalDiagnostics()
    diagnostics_enabled = not diagnostics_enabled
    if diagnostics_enabled then
        vim.diagnostic.enable()  -- Enable globally
        print("Diagnostics Enabled (Global)")
    else
        vim.diagnostic.enable(false)
        --vim.diagnostic.disable()  -- Disable globally
        print("Diagnostics Disabled (Global)")
    end
end

vim.keymap.set({'n', 'i'}, '<F1>', ToggleGlobalDiagnostics, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>vg', ToggleGlobalDiagnostics, { noremap = true, silent = true, desc = "Toggle Diagnostics" })


vim.keymap.set("n", "<leader>D", "<CMD>Telescope diagnostics bufnr=0<CR>",  { desc = "Buffer Diagnostics" })
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Line Diagnoostics"})

-- LSP Saga
vim.keymap.set("n", "<F5>", "<cmd>Lspsaga lsp_finder<CR>", { desc = "Lspsaga Finder" })
vim.keymap.set("n", "gp", "<cmd>Lspsaga peek_definition<CR>", { desc = "Peek Definition" })
vim.keymap.set("n", "<F6>", "<cmd>Lspsaga peek_definition<CR>", { desc = "Peek Definition" })
vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", { desc = "Code Action" })
vim.keymap.set("n", "<F4>", "<cmd>Lspsaga code_action<CR>", { desc = "Code Action" })
vim.keymap.set("n", "r", "<cmd>Lspsaga rename<CR>", { desc = "Rename" })
vim.keymap.set("n", "<F3>", "<cmd>Lspsaga show_line_diagnostics<CR>", { desc = "Line Diagnostics" })


-- Claude
keymap.set("n", "<leader>cc", "<cmd>ClaudeCode<cr>", { desc = "Open Claude Chat" })
keymap.set("v", "<leader>cs", "<cmd>ClaudeSend<cr>", { desc = "Send selection to Claude" })
keymap.set("n", "<leader>cf", "<cmd>ClaudeFile<cr>", { desc = "Send current file to Claude" })
