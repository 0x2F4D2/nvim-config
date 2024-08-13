-- Neovim基础配置
-- 编码
vim.opt.encoding = "UTF-8"
vim.opt.fileencoding = "utf-8"

-- Tab
vim.opt.tabstop = 2 -- tab所占空间
vim.opt.softtabstop = 2 -- 编辑时tab所占空间
vim.opt.shiftwidth = 2 -- 插入2个空格到tab
vim.opt.expandtab = true -- tab 是空格

-- UI Configus
vim.opt.number = true -- 显示行号
vim.opt.virtualedit = 'onemore'  -- 允许光标在行末之后移动
vim.opt.cursorline = true -- 高亮
vim.opt.colorcolumn = "120" -- 右侧参考线
vim.opt.autoindent = true -- 新行对其上一行
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.mouse = "a" -- 鼠标支持
vim.opt.showtabline = 2 -- tabline
-- vim.opt.showmode = false --隐藏vim模式提示
-- Searching
vim.opt.ignorecase = true -- 搜索大小写不敏感，除非包含大写
vim.opt.smartcase = true
-- vim.opt.hlsearch = true -- 高亮显示项
vim.opt.fillchars = "eob: " -- 隐藏空白行
vim.opt.scrolloff = 0  -- 限制上下滚动范围

vim.opt.autoread = true -- 文件修改时，自动加载

vim.opt.wildmenu = true -- 补全增强
vim.opt.pumheight = 6 -- 补全最多显示6行

vim.opt.clipboard = 'unnamedplus' -- 使用系统剪贴板
vim.opt.termguicolors = true


vim.filetype.add({
  extension = {
    wxml = "html",
    wxss = "css",
  }
})

