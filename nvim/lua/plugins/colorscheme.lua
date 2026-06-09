return {
  -- GitHub Darkテーマ
  {
    "projekt0n/github-nvim-theme",
    name = "github-theme",
    main = "github-theme",
    lazy = false,
    priority = 1000,
    opts = {},
  },

  -- LazyVimにgithub_darkを読み込ませる
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "github_dark",
    },
  },
}
