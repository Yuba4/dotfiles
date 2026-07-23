-- [[ Codex ]]
-- OpenAI Codex CLI integration for Neovim.

local gh = require('util').gh

vim.pack.add { gh 'johnseth97/codex.nvim' }

require('codex').setup {
  keymaps = {
    toggle = nil,
    quit = '<C-q>',
  },
  border = 'rounded',
  width = 0.35,
  height = 0.8,
  autoinstall = false,
  panel = true,
  use_buffer = false,
}

vim.keymap.set({ 'n', 't' }, '<leader>cx', function() require('codex').toggle() end, { desc = 'Toggle Codex' })
