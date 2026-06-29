return {
  {
    "johnseth97/codex.nvim",
    lazy = true,
    cmd = { "Codex", "CodexToggle" },
    keys = {
      {
        "<leader>cx",
        function()
          require("codex").toggle()
        end,
        desc = "Toggle Codex popup",
        mode = { "n", "t" },
      },
    },
    opts = {
      keymaps = {
        quit = "<C-q>",
      },
      border = "rounded",
      width = 0.8,
      height = 0.8,
      autoinstall = false, -- codex CLI は brew で導入済み
      panel = true, -- フローティングではなく縦分割で開く
      use_buffer = false,
    },
  },
}
