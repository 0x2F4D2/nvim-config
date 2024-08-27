vim.g.mapleader = " "

local map = vim.keymap.set

-- 部分操作需要搭配Alacritty的快捷键操作,比如Command + S保存
-- <D-s>
-- <D-w>

-- Past
map("v", "<D-c>", "y+")
map("v", "<C-c>", "y+")

-- window
map("n", "s", "") -- 取消s默认功能
map("n", "sv", ":vsp<CR>") -- 执行vsp命令，垂直分屏
map("n", "sh", ":sp<CR>") -- 执行sp命令，水平分屏
map("n", "sc", "<C-w>c") -- 关闭当前窗口
map("n", "so", "<C-w>o") -- 关闭其它窗口

-- Window Jump
-- alt + hjklDDown窗口之间跳转
map("n", "<A-h>", "<C-w>h")
map("n", "<A-j>", "<C-w>j")
map("n", "<A-k>", "<C-w>k")
map("n", "<A-l>", "<C-w>l")

-- 左右比例控制
map("n", "<C-Left>", ":vertical resize -2<CR>")
map("n", "<C-Right>", ":vertical resize +2<CR>")
map("n", "s,", ":vertical resize -10<CR>")
map("n", "s.", ":vertical resize +10<CR>")
-- 上下比例
map("n", "sj", ":resize +10<CR>")
map("n", "sk", ":resize -10<CR>")
-- 相等比例
map("n", "s=", "<C-w>=")

-- nvim-tree
map("n", "<A-S-f>", ":NvimTreeFindFile<CR>") -- find file in file explorer

-- buffline
map("n", "[", ":BufferLineCyclePrev<CR>") -- 切换到上一个标签
map("n", "]", ":BufferLineCycleNext<CR>") -- 切换到下一个标签

-- conform
map("", "<leader>f", function()
	require("conform").format({ async = true }, function(err)
		if not err then
			local mode = vim.api.nvim_get_mode().mode
			if vim.startswith(string.lower(mode), "v") then
				vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", true)
			end
		end
	end)
end, { desc = "Format code" })

-- lsp
map("n", "<Leader>a", "<cmd>lua vim.lsp.buf.code_action()<CR>")
map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>") -- go to definition
map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>") -- go to implementation
map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>") -- go to references

-- ToggleTerm
vim.api.nvim_exec(
	[[
  autocmd TermEnter term://*toggleterm#*
      \ tnoremap <silent><c-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>
]],
	false
)

-- 普通模式和插入模式的映射
map("n", "<C-t>", '<Cmd>exe v:count1 . "ToggleTerm"<CR>', { silent = true })
map("i", "<C-t>", '<Esc><Cmd>exe v:count1 . "ToggleTerm"<CR>', { silent = true })
