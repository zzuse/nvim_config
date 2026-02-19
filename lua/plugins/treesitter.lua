-- lua/plugins/treesitter.lua

return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "master",
        lazy = false,               -- ← Critical: load immediately (treesitter can't be fully lazy)
        priority = 1000,            -- ← Load early, before other plugins that depend on it
        build = ":TSUpdate",        -- Auto-update parsers after install/sync

        config = function()
            -- Now safe to require because lazy=false + priority ensures it's loaded
            local configs = require("nvim-treesitter.configs")

            configs.setup({
                ensure_installed = {
                    "go", "python", "c", "cpp", "lua", "vim", "vimdoc", "query",
                    "markdown", "markdown_inline", "bash", "json", "yaml", -- expand as needed
                },
                highlight = { enable = true },
                indent = { enable = true },
            })
        end,
    },
}
