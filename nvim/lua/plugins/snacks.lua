-- [[ snacks.nvim ]]
-- Collection of small QoL plugins by folke. Installed primarily so that
-- claudecode.nvim's "auto" terminal provider picks the snacks terminal
-- instead of the native floating terminal, which ghosts/corrupts on redraw
-- inside Neovim's built-in :terminal.

local gh = require('util').gh

vim.pack.add { gh 'folke/snacks.nvim' }

require('snacks').setup {}
