-- 括号自动补全 toggle
_G.my_closepair = 2

function _G.MyClosePairToggle()
  if _G.my_closepair > 1 then
    _G.my_closepair = 1
    vim.cmd([[
      inoremap ( ()<ESC>i
      inoremap ) <c-r>=ClosePair(')')<CR>
      inoremap { {}<ESC>i
      inoremap } <c-r>=ClosePair('}')<CR>
      inoremap [ []<ESC>i
      inoremap ] <c-r>=ClosePair(']')<CR>
      inoremap " ""<ESC>i
      inoremap ' ''<ESC>i
    ]])
  else
    _G.my_closepair = 2
    vim.cmd([[
      iunmap (
      iunmap )
      iunmap {
      iunmap }
      iunmap [
      iunmap ]
      iunmap "
      iunmap '
    ]])
  end
end

vim.cmd([[
  function! ClosePair(char)
    if getline('.')[col('.') - 1] == a:char
      return "\<Right>"
    else
      return a:char
    endif
  endfunction
]])

-- 窗口最大化（你的原函数）
function _G.MaximizeVOC()
  vim.opt.lines = 41
  vim.opt.columns = 178
end

function _G.MaximizeMBP()
  vim.opt.lines = 36
  vim.opt.columns = 158
end

-- 搜索高亮闪烁（Damian Conway 风格）
function _G.HLNext(blinktime)
  vim.cmd([[
    highlight RedOnRed ctermfg=red ctermbg=red
    if has("gui_running")
      highlight RedOnRed guifg=#000000 guibg=#F92672
    endif
  ]])
  local target_pat = [[\c\%#\%(]] .. vim.fn.getreg('/') .. [[.\{-}\)]]
  local ring = vim.fn.matchadd('RedOnRed', target_pat, 101)
  vim.cmd('redraw')
  vim.cmd('sleep ' .. math.floor(blinktime * 10) .. 'm')
  vim.fn.matchdelete(ring)
  vim.cmd('redraw')
end

-- 用法：在 keymaps 加
-- map('n', 'n', 'n:lua HLNext(0.4)<CR>', { noremap = true, silent = true })
-- map('n', 'N', 'N:lua HLNext(0.4)<CR>', { noremap = true, silent = true })
