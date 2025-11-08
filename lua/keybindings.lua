-- ================== 编译运行（Windows PowerShell） ==================
-- 注意：Windows 下需要 .\ 前缀执行 exe 文件
-- F5: 仅编译（检查错误）
vim.keymap.set('n', '<F5>', function()
    vim.cmd('silent w')  -- 保存文件
    local output = vim.fn.expand('%:p:r') .. '.exe'
    vim.cmd('!g++ % -o %<.exe -std=c++23 -O2 -Wall -DLOCAL -I E:/OneDrive/Project/cp/debug')
  end)

-- nvim-tree
vim.keymap.set('n', '<A-m>', ':NvimTreeToggle<CR>', {noremap = true, silent = true})

-- CompetiTest
vim.keymap.set('n', "<C-A-b>", function()
  vim.cmd('silent w')  
  vim.cmd('CompetiTest run')
end)
vim.keymap.set('n', "<C-b>", function()
    vim.cmd('silent w')
    vim.cmd('CompetiTest show_ui')
end)

vim.keymap.set('n', '<F2>', ':CompetiTest receive testcases<CR>')

local opt = {noremap = true, silent = true}

-- 缩进代码
vim.keymap.set('v', '<', '<gv', opt)
vim.keymap.set('v', '>', '>gv', opt)
-- 上下移动选中的文本
vim.keymap.set('v', 'J', ":move '>+1<CR>gv-gv", opt)
vim.keymap.set('v', 'K', ":move '<-2<CR>gv-gv", opt)
-- VISUAL 模式中粘贴的时候默认会复制被粘贴的文本 很反人类 不需要
vim.keymap.set('v', 'p', '"_dP', opt)

-- NORMAL
vim.keymap.set('n', 'q', ':q<CR>', opt)
vim.keymap.set('n', '<C-R>s', ':w<CR>', {noremap = true})
vim.keymap.set('n', 'qq', ':q!<CR>', opt)

local function clang_format_buffer()
  local fname = vim.api.nvim_buf_get_name(0)
  if fname == '' then
    -- local ft = vim.bo.filetype
    -- local assume = 'untitled.' .. (ft == '' and 'cpp' or ft)
    -- vim.cmd('%!clang-format --assume-filename=' .. vim.fn.shellescape(assume) .. ' -style=file')
    print('Please save file, or use <leader>F to format unsaved buffer')
    return
  else
    -- saved: format in-place
    vim.cmd('write')
    vim.fn.system({
      'E:\\LLVM\\bin\\clang-format.exe', 
      '-style=file',
      '-i', 
      vim.api.nvim_buf_get_name(0)
    })
    vim.cmd('edit!')
  end
end

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = {"*.c","*.cpp","*.h","*.hpp"},
  callback = function() clang_format_buffer() end,
})

vim.keymap.set('n', '<F10>', clang_format_buffer, { noremap=true})


-- INSERT
vim.keymap.set('i', 'jk', '<ESC>', opt)
