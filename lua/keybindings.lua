-- nvim-tree
vim.keymap.set('n', '<A-m>', ':NvimTreeToggle<CR>', {noremap = true, silent = true})

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
-- INSERT
vim.keymap.set('i', 'jk', '<ESC>', opt)
