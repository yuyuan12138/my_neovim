local function setup_competitest_per_buffer()
  local abspath = vim.fn.expand('%:p')   -- 当前文件绝对路径
  if abspath == '' then return end
  -- 使用内建 sha256 产生 hex，取前 8 个字符作为短哈希
  local ok, hash = pcall(vim.fn.sha256, abspath)
  if not ok then
    -- 如果没有 sha256（极少见），退回到 sha1；若仍不存在，可改为其它策略
    hash = vim.fn.sha1(abspath)
  end
  hash = hash:sub(1,8)

  local fname_noext = vim.fn.expand('%:t:r') -- 文件名（不含扩展名）
  local input_fmt  = string.format("%s_%s_input$(TCNUM).txt", fname_noext, hash)
  local output_fmt = string.format("%s_%s_output$(TCNUM).txt", fname_noext, hash)

  -- -- 调用插件 setup（如果插件允许多次 setup，这样做最稳妥）
  require("competitest").setup{
    maximum_time = 3000,
    companion_port = 22365,
    testcases_directory = "E:/OneDrive/Project/cp/tmp/tc/",
    testcases_use_single_file = false,
    start_receiving_persistently_on_setup = false,
    testcases_auto_detect_storage = true,
    testcases_input_file_format  = input_fmt,
    testcases_output_file_format = output_fmt,
    runner_ui = { interface = "split" },
  }

  -- 备用写法（如果插件不通过 setup 读取，而是读取全局变量），可启用以下两行：
  -- vim.g.competitest_testcases_input_file_format  = input_fmt
  -- vim.g.competitest_testcases_output_file_format = output_fmt
end

-- 在打开/保存源码文件时设置（按需改 filetype/pattern）
vim.api.nvim_create_autocmd({"BufEnter", "BufWritePost"}, {
  pattern = {"*.*"},
  callback = setup_competitest_per_buffer,
})
-- basic
require('basic')
-- plugins
require('plugins')
-- keybindings
require('keybindings')


