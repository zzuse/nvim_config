return {
  -- 状态栏（替换 airline）
  { "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          theme = "molokai",
          icons_enabled = false,
          component_separators = { left = "|", right = "|" },
          section_separators = { left = "", right = "" },
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch", "diff" },
          lualine_c = { { "filename", path = 1 } },
          lualine_x = { "encoding", "fileformat", "filetype" },
          lualine_y = { "progress" },
          lualine_z = { "location" }
        }
      })
    end
  },

  -- 缩进线（替换 indentLine）
  { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = { indent = { char = "|" } } },
}
