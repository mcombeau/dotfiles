-- ~/.config/nvim/lua/test_lush.lua
local lush_loaded, lush = pcall(require, "lush")
if lush_loaded then
  print("lush.nvim loaded successfully")
else
  print("Failed to load lush.nvim")
end
