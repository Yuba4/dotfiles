local gh = require('util').gh

vim.g.mkdp_auto_start = 0
vim.g.mkdp_auto_close = 0
vim.g.mkdp_refresh_slow = 0
vim.g.mkdp_command_for_global = 0
vim.g.mkdp_open_to_the_world = 0
vim.g.mkdp_echo_preview_url = 0
vim.g.mkdp_filetypes = { 'markdown' }
vim.g.mkdp_theme = 'dark'
vim.g.mkdp_combine_preview = 1
vim.g.mkdp_combine_preview_auto_refresh = 1

vim.pack.add { gh 'iamcco/markdown-preview.nvim' }

vim.keymap.set('n', '<leader>tm', '<cmd>MarkdownPreviewToggle<cr>', { desc = '[T]oggle [M]arkdown preview' })
