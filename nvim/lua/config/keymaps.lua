-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local function format_and_save()
  LazyVim.format({ force = true })
  vim.cmd("write")
end

vim.schedule(function()
  vim.keymap.set({ "n", "x" }, "<C-s>", format_and_save, { desc = "Format and Save File" })
  vim.keymap.set({ "i", "s" }, "<C-s>", function()
    vim.cmd("stopinsert")
    vim.schedule(format_and_save)
  end, { desc = "Format and Save File" })
end)

vim.keymap.set("n", "<leader>tv", function()
  vim.cmd("vsplit | terminal")
  vim.cmd("startinsert")
end, { desc = "Terminal (vertical split)" })

local function toggle_right_terminal(count)
  require("snacks").terminal.toggle(nil, {
    count = count or vim.v.count1,
    win = {
      position = "right",
      width = 0.35,
    },
  })
end

vim.keymap.set("n", "<leader>tt", function()
  toggle_right_terminal()
end, { desc = "Terminal (right panel)" })

for terminal_number = 1, 4 do
  vim.keymap.set("n", "<leader>t" .. terminal_number, function()
    toggle_right_terminal(terminal_number)
  end, { desc = "Terminal " .. terminal_number .. " (right panel)" })

  vim.keymap.set("t", "<C-w>" .. terminal_number, function()
    toggle_right_terminal(terminal_number)
  end, { desc = "Terminal " .. terminal_number .. " (right panel)" })
end

vim.keymap.set("t", "<C-w>q", "<C-\\><C-n><C-w>q", { desc = "Close terminal" })

-- ターミナルモードからウィンドウ移動
vim.keymap.set("t", "<C-h>", "<C-\\><C-n><C-w>h", { desc = "Go to left window" })
vim.keymap.set("t", "<C-j>", "<C-\\><C-n><C-w>j", { desc = "Go to lower window" })
vim.keymap.set("t", "<C-k>", "<C-\\><C-n><C-w>k", { desc = "Go to upper window" })
vim.keymap.set("t", "<C-l>", "<C-\\><C-n><C-w>l", { desc = "Go to right window" })
