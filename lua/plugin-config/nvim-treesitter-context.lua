return {
    {
        "nvim-treesitter/nvim-treesitter-context",
        config = function()
          require("treesitter-context").setup {
            enable = true,            -- 默认启用
            max_lines = 3,            -- 最多显示 3 行
            min_window_height = 10,   -- 窗口太小时不显示
            multiline_threshold = 4,  -- 超过 4 行折叠
            trim_scope = "outer",     -- 过长时从外层缩减
            mode = "cursor",          -- 按光标位置显示
          }
        end
      }
      
}
