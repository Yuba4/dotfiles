local gh = require('util').gh

vim.pack.add { gh 'esmuellert/codediff.nvim' }

vim.keymap.set('n', '<leader>gd', '<cmd>CodeDiff<cr>', { desc = '[G]it: Open Code[D]iff' })
