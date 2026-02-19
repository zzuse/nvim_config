local map = vim.keymap.set
local opts = { noremap = true, silent = true }
local g = vim.g

-- Leader
g.mapleader = '\\'   -- 默认是 \ ，你没改的话；想空格就 " "

-- 你的映射
map('n', '<Leader>c', ':set cursorline!<CR>', opts)
map('n', '<Leader>a', ':set paste!<CR>', opts)
map('n', '<Leader>n', ':set nu!<CR>', opts)
map('n', '<Leader>r', ':set relativenumber!<CR>', opts)
map('n', '<Leader>t', ':set expandtab!<CR>', opts)
map('n', '<Leader>p', ':lua MyClosePairToggle()<CR>', opts)  -- 改成调用 lua 函数
map('n', '<Leader>q', ':q<CR>', opts)
map('n', '<Leader>wq', ':wq<CR>', opts)

map('n', '<Leader>ww', ':set diffopt+=iwhite<CR>', opts)
map('n', '<Leader>nw', ':set diffopt-=iwhite<CR>', opts)

map('n', '<F4>', ':vert diffsplit ', { noremap = true })   -- 留个空格让你输入文件名
map('n', '<F5>', ':e ++enc=cp936<CR>', opts)
map('n', '<F6>', ':e ++enc=utf-8<CR>', opts)
map('n', '<F7>', ':set syntax=fasm<CR>', opts)
map('n', '<F8>', ':set fileencoding=utf-8<CR>', opts)

-- splits resize
map('n', '<Leader>j', '<C-w>-', opts)
map('n', '<Leader>k', '<C-w>+', opts)
map('n', '<Leader>h', '<C-w><', opts)
map('n', '<Leader>l', '<C-w>>', opts)

-- 窗口最大化（保留你的函数）
map('n', '<F1>m', ':lua MaximizeVOC()<CR>', opts)
map('n', '<F2>m', ':lua MaximizeMBP()<CR>', opts)

-- Q 格式化
map('n', 'Q', 'gq', opts)
