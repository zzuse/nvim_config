local aug = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- 跳到上次位置
autocmd('BufReadPost', {
  group = aug('last_position', { clear = true }),
  pattern = '*',
  callback = function()
    local row, col = unpack(vim.api.nvim_buf_get_mark(0, '"'))
    if row > 0 and row <= vim.api.nvim_buf_line_count(0) then
      vim.api.nvim_win_set_cursor(0, { row, col })
    end
  end,
})

-- text 文件 textwidth
autocmd('FileType', {
  pattern = 'text',
  command = 'setlocal textwidth=1024',
})

-- C/C++ 格式
autocmd('FileType', {
  pattern = { 'c', 'cpp' },
  callback = function()
    vim.bo.formatoptions = 'croql'
    vim.bo.cindent = true
    vim.bo.comments = 'sr:/*,mb:*,el:*/,://'
  end,
})

-- 其他 filetype（如 *.expr → cpp）
autocmd({ 'BufNewFile', 'BufRead' }, {
  pattern = '*.expr',
  command = 'setf cpp',
})

-- 你的自定义 syntax（如果文件还在）
autocmd({ 'BufNewFile', 'BufRead' }, {
  pattern = { '*.sim', 'nginx.conf' },
  command = 'source ~/.vim/bundle/log.vim/syntax/sim.vim',   -- 或 nginx.vim
})

-- 默认不折叠
autocmd('BufRead', { command = 'normal zR' })
