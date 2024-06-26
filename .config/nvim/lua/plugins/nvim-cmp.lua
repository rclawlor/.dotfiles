return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip"
	},
	event = "InsertEnter",
	config = function()
		local cmp = require("cmp")
		cmp.setup({
			snippet = {
      			expand = function(args)
        			require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      			end,
    		},
    		window = {
      			-- completion = cmp.config.window.bordered(),
      			-- documentation = cmp.config.window.bordered(),
    		},
			preselect = cmp.PreselectMode.None,
    		mapping = cmp.mapping.preset.insert({
      			['<C-b>'] = cmp.mapping.scroll_docs(-4),
      			['<C-f>'] = cmp.mapping.scroll_docs(4),
      			['<C-Space>'] = cmp.mapping.complete(),
      			['<C-e>'] = cmp.mapping.abort(),
      			['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
				['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "s" }),
				-- ['<C-k>'] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "s" }),
				['<Down>'] = cmp.mapping(function(fallback)
						cmp.close()
						fallback()
					end, { "i" }),
				['<Up>'] = cmp.mapping(function(fallback)
						cmp.close()
						fallback()
					end, { "i" }),
				}),
			sources = cmp.config.sources(
				{
			  		{ name = 'nvim_lsp' },
		  			{ name = 'luasnip' }, -- For luasnip users.
				},
				{
					{ name = 'buffer' },
					{ name = 'path' }
    			}
			)
		})
	end
}
