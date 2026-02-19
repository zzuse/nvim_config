local opt = vim.opt
local g   = vim.g

-- 编码相关（现在基本都默认 utf-8，简化）
opt.encoding       = 'utf-8'
opt.fileencoding   = 'utf-8'
opt.fileencodings  = { 'ucs-bom', 'utf-8', 'cp936', 'gb18030', 'big5', 'euc-jp', 'euc-kr', 'latin1' }
opt.fileformat     = 'unix'

opt.backspace      = { 'indent', 'eol', 'start' }   -- 等价于 set backspace=indent,eol,start

opt.history        = 100
opt.undolevels     = 100

opt.ruler          = true
opt.showcmd        = true
opt.incsearch      = true
opt.hlsearch       = true

opt.matchpairs:append('<:>')   -- mps+=<:>

opt.tabstop        = 4
opt.shiftwidth     = 4
opt.softtabstop    = 4
opt.expandtab      = true

opt.number         = true
opt.relativenumber = true

opt.ignorecase     = true
opt.smartcase      = true

opt.path:append('../include/')

opt.foldmethod     = 'syntax'
opt.foldenable     = false   -- 你最后有 zR，所以默认不折叠

opt.backup         = false
opt.undodir        = vim.fn.expand('~/.vim/undodir')
-- if not vim.fn.isdirectory(opt.undodir:get()) then
--  vim.fn.mkdir(opt.undodir:get(), 'p', 0700)
-- end

opt.clipboard:append('unnamed')   -- 共享系统剪贴板（你最后又设了一次）

-- GUI / 终端相关（简化判断）
opt.mouse          = 'a'
opt.termguicolors  = true          -- 大部分现代终端都支持

-- cursorline / column 只在非 diff 模式
if not vim.o.diff then
  opt.cursorline   = true
  opt.cursorcolumn = true
end

opt.completeopt    = { 'longest', 'menu' }

-- 颜色方案（lua 里用 vim.cmd）
vim.cmd.colorscheme('molokai')

-- GUI 字体（只在 gui 时生效）
if vim.g.neovide or vim.fn.has('gui_running') == 1 then
  opt.guifont = 'Consolas:h12:cANSI'
end
