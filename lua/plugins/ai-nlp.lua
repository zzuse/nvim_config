return {
    {
        "monkoose/neocodeium",
        config = function()
            require("neocodeium").setup({
                -- 可选：启用/禁用某些功能
                enable = true
            })
            -- 常用快捷键（可选）
            vim.keymap.set("i", "<C-g>",
                           function() require("neocodeium").accept() end)
            vim.keymap.set("i", "<C-x>",
                           function() require("neocodeium").clear() end)
        end
    }, --
    -- 或 GitHub Copilot（需订阅）
    -- { "github/copilot.vim" },
    -- LLM 聊天/生成（支持 Ollama 本地模型，如 llama3）
    --
    {
        "Robitx/gp.nvim",
        config = function()
            require("gp").setup({
                providers = {
                    gemini = {
                        endpoint = "https://generativelanguage.googleapis.com/v1beta/models",
                        secret = os.getenv("GEMINI_API_KEY")
                    }
                    -- 可同时加 ollama（本地）或其他
                },
                -- 默认用 gemini 模型
                default_chat_model = {
                    provider = "gemini",
                    model = "gemini-3-flash"
                },
                hooks = {
                    -- :GpChatNew → 新聊天窗口
                    -- :GpWhisper → 语音输入（需麦克风）
                }
            })
        end,
        keys = {
            {"<leader>cc", "<cmd>GpChatNew<cr>", desc = "Gemini New Chat"}, {
                "<leader>ca",
                ":'<,'>GpChatRespond<cr>",
                mode = "v",
                desc = "Ask Gemini about selection"
            },
            {"<leader>cg", "<cmd>GpGenerate<cr>", desc = "Generate with Gemini"}
        }
    }
}
