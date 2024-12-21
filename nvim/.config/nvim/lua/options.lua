require "nvchad.options"

-- add yours here!

local o = vim.o
local g = vim.g

if vim.g.neovide then
  g.neovide_transparency = 0.95
  o.guifont = "FiraCode Nerd Font:h12"
  -- o.cmdheight = 0
  -- g.neovide_fullscreen = true
end

-- o.cursorlineopt ='both' -- to enable cursorline!
o.number = true
o.relativenumber = true
o.scrolloff = 4
o.sidescrolloff = 0
o.wrap = false
-- o.hlsearch = false;
