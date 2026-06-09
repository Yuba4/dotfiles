return {
  {
    "OXY2DEV/markview.nvim",
    -- 公式の指示どおり遅延読み込みしない（プラグイン側で対応済み）
    lazy = false,
  },
  -- markview が必要とする treesitter パーサーを確実に入れる
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "markdown", "markdown_inline" })
    end,
  },
}
