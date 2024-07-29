vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

opt.relativenumber = true
opt.number = true   -- Gives line number instead of 0 
--Tabs and Indentation
opt.tabstop = 2 --2 spaces per tab
opt.shiftwidth = 2 --2 spaces per indent width
opt.expandtab = true --expand tab to spaces
opt.autoindent = true --copy previous line indent

opt.wrap = true --enable line wrapping
opt.linebreak = true --don't split words on wrap

opt.foldcolumn = "auto"
opt.smoothscroll = true

--search settings
opt.ignorecase = true
opt.smartcase = true

opt.cursorline = true

opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"
opt.backspace = "indent,eol,start"
opt.clipboard:append("unnamedplus") --use system clipboard

opt.mousemodel = 'popup'

opt.splitright = true
opt.splitbelow = true

opt.spell = true                   -- turns on spellchecker
opt.spelllang = { 'en_us' }        -- sets spelling dictionary
