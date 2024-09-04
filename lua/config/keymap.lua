vim.g.mapleader = " "

local map = vim.keymap.set

function opts(desc)
	if desc == nil then
		desc = ""
	end

	return { noremap = true, desc = desc }
end

-- window
map("n", "s", "", opts(nil)) -- 取消s默认功能
map("n", "sv", ":vsp<CR>", opts(nil)) -- 执行vsp命令，垂直分屏
map("n", "sh", ":sp<CR>", opts(nil)) -- 执行sp命令，水平分屏
map("n", "sc", "<C-w>c", opts(nil)) -- 关闭当前窗口
map("n", "so", "<C-w>o", opts(nil)) -- 关闭其它窗口

-- Window Jump
-- alt + hjklDDown窗口之间跳转
map("n", "<A-h>", "<C-w>h", opts(nil))
map("n", "<A-j>", "<C-w>j", opts(nil))
map("n", "<A-k>", "<C-w>k", opts(nil))
map("n", "<A-l>", "<C-w>l", opts(nil))

-- 左右比例控制
map("n", "<C-Left>", ":vertical resize -2<CR>", opts(nil))
map("n", "<C-Right>", ":vertical resize +2<CR>", opts(nil))
map("n", "s,", ":vertical resize -10<CR>", opts(nil))
map("n", "s.", ":vertical resize +10<CR>", opts(nil))
-- 上下比例
map("n", "sj", ":resize +10<CR>", opts(nil))
map("n", "sk", ":resize -10<CR>", opts(nil))
-- 相等比例
map("n", "s=", "<C-w>=", opts(nil))

-- nvim-tree
map("n", "<A-S-f>", ":NvimTreeFindFile<CR>", opts(nil)) -- find file in file explorer

-- buffline
map("n", "[", ":BufferLineCyclePrev<CR>", opts(nil)) -- toggle to previous tab
map("n", "]", ":BufferLineCycleNext<CR>", opts(nil)) -- toggle to next tabs

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
map("n", "<Leader>a", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts("code action"))
map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts("go to definition"))
map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts("go to implementation"))
map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts("go to references"))

-- ToggleTerm
vim.api.nvim_exec(
	[[
  autocmd TermEnter term://*toggleterm#*
      \ tnoremap <silent><c-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>
]],
	false
)

map("n", "<C-t>", '<Cmd>exe v:count1 . "ToggleTerm"<CR>', { silent = true })
map("i", "<C-t>", '<Esc><Cmd>exe v:count1 . "ToggleTerm"<CR>', { silent = true })
