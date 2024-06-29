-- Vim commands
vim.cmd("set tabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set autoindent")
vim.cmd("set expandtab")
vim.cmd("set clipboard+=unnamedplus")

-- Centre screen when moving up/down
vim.cmd(":nnoremap <C-d> <C-d>zz")
vim.cmd(":nnoremap <C-u> <C-u>zz")

-- Prevent use of arrow keys
vim.cmd(":nnoremap <up> <nop>")
vim.cmd(":nnoremap <down> <nop>")
vim.cmd(":nnoremap <left> <nop>")
vim.cmd(":nnoremap <right> <nop>")
vim.cmd(":nnoremap <s> <nop>")

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

vim.api.nvim_create_user_command("SendRPC",
    function()
        vim.api.nvim_call_function(
            "rpcnotify",
            {
                0,
                "Hello",
                {"World!"}
            }
        )
    end,
    {}
)

vim.api.nvim_set_keymap("n", "gg", "<cmd>LazyGit<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<space>e", "<cmd>lua vim.diagnostic.open_float()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<C-s>", "<cmd>RegexRailroad<CR>", {noremap = true, silent = true})

