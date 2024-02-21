-- Vim commands
vim.cmd("set tabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set autoindent")
vim.cmd("set noexpandtab")
vim.cmd("set clipboard+=unnamedplus")

vim.cmd(":nnoremap <C-d> <C-d>zz")		-- Centre screen when moving up/down
vim.cmd(":nnoremap <C-u> <C-u>zz")
vim.opt.number = true
vim.opt.signcolumn = "number"
vim.opt.relativenumber = true

-- Lua mappings
vim.api.nvim_create_autocmd('ColorScheme', {
	pattern = '*',
	callback = function()
		vim.api.nvim_set_hl(0, 'EyelinerPrimary', { fg = "#DCDCAA", bold = true, underline = false })
		vim.api.nvim_set_hl(0, 'EyelinerSecondary', { fg = "#D16969", bold = true, underline = false })
		vim.api.nvim_set_hl(0, 'EyelinerDimmed', { fg = "#808080", bold = false, underline = false })
	end,
})

local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({
	cmd = "lazygit",
	hidden = true
})

vim.api.nvim_create_user_command('LazyGit',
	function()
		lazygit:toggle()
	end,
	{}
)

vim.api.nvim_set_keymap("n", "gg", "<cmd>LazyGit<CR>", {noremap = true, silent = true})

