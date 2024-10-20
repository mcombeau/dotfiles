local opt = vim.opt

-- Line numbers
opt.relativenumber = true -- show relative line numbers
opt.number = true -- show absolute line number for current line

-- Tabs and indents
opt.tabstop = 2 -- 2 spaces for tabs
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- expand tabs to spaces
opt.autoindent = true -- use indent from the current line for the next line
opt.smartindent = true -- use smart indenting, i.e. extra indent after opening {
opt.wrap = false -- disable line wrapping

-- Search settings
opt.ignorecase = true -- make search case-insensitive
opt.smartcase = true -- if mixed-case in search, make seach sensitive

opt.cursorline = true -- highlight the current line

-- Appearance
opt.termguicolors = true -- so colorscheme shows up properly
opt.background = "dark" -- default to dark version of a colorscheme
opt.signcolumn = "yes" -- show line column on left hand side

-- Backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- Clipboard
opt.clipboard:append("unnamedplus") -- use the system clipboard as default register when yanking/pasting

-- Split Windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

-- Swap files
opt.swapfile = false -- disable swapfiles
opt.backup = false -- disable file backups

-- Scrolloff
vim.opt.scrolloff = 8 -- try to stay 8 lines away from top/bottom of screen
