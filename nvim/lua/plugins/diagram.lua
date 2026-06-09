return {
  {
    "3rd/image.nvim",
    -- magick_cli を使うため LuaRocks 経由のビルドを無効化
    build = false,
    opts = {
      backend = "kitty", -- Ghostty は Kitty graphics protocol 対応
      processor = "magick_cli",
      integrations = {
        markdown = {
          enabled = true,
          clear_in_insert_mode = false,
          only_render_image_at_cursor = false,
          filetypes = { "markdown" },
        },
      },
      -- 表示サイズ上限を緩めて図を大きく描画する
      max_width_window_percentage = 100,
      max_height_window_percentage = 90,
    },
  },
  {
    "3rd/diagram.nvim",
    dependencies = { "3rd/image.nvim" },
    ft = { "markdown" },
    -- プラグイン読み込み後に require を解決するため opts を関数化
    opts = function()
      return {
        integrations = {
          require("diagram.integrations.markdown"),
        },
        renderer_options = {
          mermaid = {
            theme = "default", -- "default" | "dark" | "forest" | "neutral"
            background = "white", -- 透過だと暗色端末で文字が読めない
            scale = 4, -- 高解像度化（小さい文字も鮮明に）
            -- mmdc に puppeteer 設定を渡し、システムの Chrome を使わせる
            cli_args = { "-p", vim.fn.stdpath("config") .. "/puppeteer-config.json" },
          },
        },
      }
    end,
  },
}
