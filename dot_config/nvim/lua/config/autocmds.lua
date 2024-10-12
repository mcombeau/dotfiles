-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
--
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*/monoquoi.nvim/lua/monoquoi/*.lua", -- Adjust the pattern to match the files you want
  callback = function()
    vim.cmd("Lazy reload monoquoi.nvim")
    print("Monoquoi plugin reloaded!")
  end,
})

-- Function to check if a file exists
local function file_exists(name)
  local f = io.open(name, "r")
  if f ~= nil then
    io.close(f)
    return true
  else
    return false
  end
end

-- Check for specific git config in the repository
local function has_git_config(config)
  local config_value = vim.fn.system("git config --get " .. config)
  return config_value ~= nil and config_value ~= ""
end

-- Disable autoformat if a specific git config or condition is met
vim.api.nvim_create_autocmd({ "BufEnter" }, {
  callback = function()
    local cwd = vim.fn.getcwd() -- Get current working directory
    -- Disable autoformat if a specific file or git condition is found
    if has_git_config("format.disable") or file_exists(cwd .. "/.disable_format") then
      vim.b.autoformat = false
    else
      vim.b.autoformat = true
    end
  end,
})
