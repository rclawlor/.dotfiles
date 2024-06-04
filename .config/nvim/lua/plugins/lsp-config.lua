return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",	-- Lua
					"taplo",	-- TOML
					"clangd",	-- C/C++
					"bashls", 	-- bash
					"cmake",	-- CMake
					"dockerls", -- Docker
					"pyright", 	-- Python
					"rust_analyzer", 	-- Rust
                    "yamlls"      -- Yaml
				}
			})
		end
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")

			-- Lua
			lspconfig.lua_ls.setup({
				settings = {
					Lua = {
                        runtime = {
                            -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                            version = "LuaJIT",
                            path = vim.split(package.path, ";"),
                        },
						diagnostics = {
							globals = { "vim" }
						},
                        workspace = {
                            -- Make the server aware of Neovim runtime files and plugins
                            library = { vim.env.VIMRUNTIME },
                            checkThirdParty = false,
                        },
                        telemetry = {
                            enable = false,
                        },
					}
				},
			})

			-- Rust
			lspconfig.rust_analyzer.setup({
			  	settings = {
					["rust-analyzer"] = {
                        cargo = {
                            allFeatures = true,
                            loadOutDirsFromCheck = true,
                            runBuildScripts = true,
                        },
                        -- Add clippy lints for Rust.
                        checkOnSave = {
                            command = "clippy"
                        },
                        procMacro = {
                            enable = true,
                            ignored = {
                                ["async-trait"] = { "async_trait" },
                                ["napi-derive"] = { "napi" },
                                ["async-recursion"] = { "async_recursion" },
                            },
                        },
					},
			  	},
				capabilities = require('cmp_nvim_lsp').default_capabilities()
			})

            -- Python
			lspconfig.pyright.setup({
				capabilities = require('cmp_nvim_lsp').default_capabilities()
			})

            -- Yaml
            lspconfig.yamlls.setup({})

            -- TOML
            lspconfig.taplo.setup({})

            -- C/C++
            lspconfig.clangd.setup({})

            -- Bash
            lspconfig.bashls.setup({})

            -- CMake
            lspconfig.cmake.setup({})

            -- Docker
            lspconfig.dockerls.setup({})

			-- Use LspAttach autocommand to only map the following keys
			-- after the language server attaches to the current buffer
			vim.api.nvim_create_autocmd('LspAttach', {
			  	group = vim.api.nvim_create_augroup('UserLspConfig', {}),
			  	callback = function(ev)
					-- Enable completion triggered by <c-x><c-o>
					vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

					-- Buffer local mappings.
					-- See `:help vim.lsp.*` for documentation on any of the below functions
					local opts = { buffer = ev.buf }
					vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
					vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
					vim.keymap.set('n', 's', vim.lsp.buf.hover, opts)
					vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
					vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
					vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
					vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
					vim.keymap.set('n', '<space>wl', function()
				  		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
					end, opts)
					vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
					vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
					vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
					vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
					vim.keymap.set('n', '<space>f', function()
				  	vim.lsp.buf.format { async = true }
				end, opts)
			  end,
			})
		end
	}
}
