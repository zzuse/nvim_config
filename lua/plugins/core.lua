return {
  -- 颜色方案（你原来的 molokai，有现代 fork）
  { "tomasr/molokai", priority = 1000, config = function() vim.cmd.colorscheme("molokai") end },

  -- 其他你自制的（如果还在用）
  { dir = "~/.vim/bundle/log.vim" },  -- 如果你想保留自定义 syntax
}
