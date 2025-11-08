return {
    -- {
    --     "nvim-lualine/lualine.nvim",
    --     requires = { 'nvim-tree/nvim-web-devicons'},
    --     config = function() require("lualine").setup({
            
    --     }) end,
    -- }
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
          require("lualine").setup {
            options = {
              theme = "auto",   -- 自动适配 desert 背景
              section_separators = { left = "", right = "" },
              component_separators = { left = "", right = "" },
              globalstatus = true, -- 单一状态栏
            },
            sections = {
              lualine_a = { "mode" },
              lualine_b = { "branch", "diff", "diagnostics" },
              lualine_c = { { "filename", path = 1 } }, -- 显示相对路径
              lualine_x = { "encoding", "fileformat", "filetype" },
              lualine_y = { "progress" },
              lualine_z = { "location" },
            },
          }
        end
      }
      
}