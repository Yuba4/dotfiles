-- [[ LazyGit ]]
-- Open lazygit in a floating terminal from within Neovim.
-- Requires the `lazygit` CLI to be installed and on your PATH.

local gh = require('util').gh

vim.pack.add { gh 'kdheepak/lazygit.nvim' }

vim.keymap.set('n', '<leader>gg', '<cmd>LazyGit<cr>', { desc = '[G]it: Open Lazy[G]it' })
