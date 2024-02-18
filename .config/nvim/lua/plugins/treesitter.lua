return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local config = require("nvim-treesitter.configs")
		config.setup({
			ensure_installed = {
				"lua",
				"python",
				"rust",
				"bash",
				"toml",
				"c",
				"cpp",
				"proto"
			},
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = true },
		})
	end
}
