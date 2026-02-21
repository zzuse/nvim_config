return {
  -- 自动安装 LSP 服务器（gopls, pyright/ruff, clangd）
  { "williamboman/mason.nvim", config = true },
  { "williamboman/mason-lspconfig.nvim" },

  -- lazydev.nvim: Define spec but load manually
  {
    "folke/lazydev.nvim",
    ft = "lua", -- Load on lua files, or manually required
    opts = {
      library = {
        { path = "luvit-meta/library", words = { "vim%.uv" } },
      },
    },
  },
  { "Bilal2453/luvit-meta", lazy = true }, -- optional `vim.uv` typings

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
    lazy = false, -- Force early loading
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "folke/lazydev.nvim", -- Dependency ensures it's available
    },
    config = function()
      -- Explicitly setup lazydev BEFORE lspconfig setup
      require("lazydev").setup({
        library = {
          { path = "luvit-meta/library", words = { "vim%.uv" } },
        },
      })

      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = { "gopls", "pyright", "clangd", "lua_ls" },
        handlers = {
          function(server_name)
            require("lspconfig")[server_name].setup({})
          end,
        },
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
