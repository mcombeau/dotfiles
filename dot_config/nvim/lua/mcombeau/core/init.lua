require("mcombeau.core.options")
require("mcombeau.core.keymaps")

-- Associate .cgi files with php
vim.api.nvim_command("autocmd BufNewFile,BufRead *.cgi setfiletype php")
