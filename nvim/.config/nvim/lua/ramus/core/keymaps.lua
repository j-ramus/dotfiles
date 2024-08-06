vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk"})

keymap.set("i", "teh", "the")
keymap.set("i", "Teh", "The")
keymap.set("i", "thier", "their")
keymap.set("i", "Thier", "Their")
keymap.set("i", "osu", "Oregon State University")
keymap.set("i", "jr", "John Ramus")


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

keymap.set("n", "<leader>to", "<cmd>tabnew <bar> Telescope oldfiles<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab
keymap.set("n", "<leader>tt", "<cmd>tabnew <bar> NvimTreeToggle<CR>)", { desc = "New Tab"}) -- New blank tab

keymap.set("n", "<Leader>o", ":Telescope oldfiles<CR>", { desc = "Recent Files", silent = true })
keymap.set("n", "<Leader>b", ":Telescope buffers<CR>", { desc = "Active Buffers", silent = true })
keymap.set("n", "<Leader>r", ":Telescope registers<CR>", { desc = "Registers", silent = true })

keymap.set("n", "<Leader>0",":normal! Go<CR>", { desc = "New Line", silent = true })

keymap.set("n", "<Leader>ll", ":VimtexCompile<CR>", { desc = "Toggle tex compiler", silent = true })
keymap.set("n", "<Leader>lt", ":VimtexTocToggle<CR>", { desc = "Toggle tex TOC", silent = true })
