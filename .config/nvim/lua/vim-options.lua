vim.cmd("set tabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set autoindent")
vim.cmd("set noexpandtab")
vim.cmd("set clipboard+=unnamedplus")
vim.cmd(":nnoremap <C-d> <C-d>zz")
vim.opt.number = true
vim.opt.signcolumn = "number"
vim.opt.relativenumber = true

vim.api.nvim_create_autocmd('ColorScheme', {
	pattern = '*',
	callback = function()
		vim.api.nvim_set_hl(0, 'EyelinerPrimary', { fg = "#DCDCAA", bold = true, underline = false })
		vim.api.nvim_set_hl(0, 'EyelinerSecondary', { fg = "#D16969", bold = true, underline = false })
		vim.api.nvim_set_hl(0, 'EyelinerDimmed', { fg = "#808080", bold = false, underline = false })
	end,
})

-- vim.api.nvim_create_augroup("neotree_autoopen", { clear = true })
-- vim.api.nvim_create_autocmd("BufRead", { -- Changed from BufReadPre
--	desc = "Open neo-tree on enter",
--	group = "neotree_autoopen",
--	once = true,
--	callback = function()
--		if not vim.g.neotree_opened then
--    		vim.cmd "Neotree show"
--    		vim.g.neotree_opened = true
--    	end
--  	end,
--})
