return {
  -- 自动安装 LSP 服务器（gopls, pyright/ruff, clangd）
  { "williamboman/mason.nvim", config = true },
  { "williamboman/mason-lspconfig.nvim" },
  { "neovim/nvim-lspconfig" },

  -- 补全（2025–2026 推荐 blink.cmp，更快、更简单）
  { "saghen/blink.cmp",
    version = "v1.*",
    dependencies = "rafamadriz/friendly-snippets",  -- snippets 来源
    opts = {
      keymap = { preset = "super-tab" },  -- 或 "enter" / "default"
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
      },
      signature = { enabled = true },  -- 函数签名提示
    },
  },

  -- LSP 配置
  {
    "neovim/nvim-lspconfig",
    dependencies = { "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim" },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = { "gopls", "pyright", "clangd", "lua_ls" },
      })

      -- 常用 LSP 快捷键（加到你的 keymaps.lua 也行）
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local bufnr = args.buf
          local map = function(mode, lhs, rhs) vim.keymap.set(mode, lhs, rhs, { buffer = bufnr }) end
          map("n", "gd", vim.lsp.buf.definition)
          map("n", "K", vim.lsp.buf.hover)
          map("n", "<leader>ca", vim.lsp.buf.code_action)
          map("n", "<leader>rn", vim.lsp.buf.rename)
          -- 更多自己加
        end,
      })
    end,
  },
}
