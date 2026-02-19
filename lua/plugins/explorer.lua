return {
  -- neo-tree（现代 NERDTree 替代，推荐）
  { "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    keys = {
      { "<C-n>t", "<cmd>Neotree toggle<cr>", desc = "NeoTree Toggle" },
      { "<C-n>p", "<cmd>Neotree reveal<cr>", desc = "NeoTree Reveal" },
    },
    opts = { filesystem = { follow_current_file = { enabled = true } } },
  },
}
