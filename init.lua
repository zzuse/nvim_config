-- ~/.config/nvim/init.lua

-- 加速启动（可选，Neovim 0.9+）
vim.loader.enable()

-- 引导 lazy.nvim（如果没装自动下载）
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- 下面开始覆盖/用 Lua 重写核心部分（优先级更高）
-- 加载插件列表
require('config.keymaps')
require("lazy").setup("plugins",  {-- 会自动加载 lua/plugins/*.lua
	rocks = {
		enabled = false,          -- ← Add this line (or set to false if already present)
	},
})
require('config.options')
require('config.autocmds')
require('config.functions')  -- 放自定义函数
