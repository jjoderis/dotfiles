return {
	{
		"hrsh7th/cmp-nvim-lsp",
	},
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
		},
		config = function()
			local ls = require("luasnip")
			local types = require("luasnip.util.types")

			ls.config.set_config({
				history = true,

				updateevents = "TextChanged, TextChangedI",

				enable_autosnippets = true,

				-- ext_opts = {
				-- 	[types.choiceNode] = {
				-- 		active = {
				-- 			virt_text = { { "<-", "Error" } },
				-- 		},
				-- 	},
				-- },
			})

			require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/lua/plugins/snippets" })

			ls.filetype_extend("cpp", { "c" })
			ls.filetype_extend("typescript", { "javascript" })
			ls.filetype_extend("typescriptreact", { "typescript" })
			ls.filetype_extend("typescriptreact", { "javascript" })

			vim.keymap.set({ "i", "s" }, "<C-L>", function()
				if ls.expand_or_jumpable() then
					ls.expand_or_jump()
				end
			end, { silent = true })

			vim.keymap.set({ "i", "s" }, "<C-Y>", function()
				ls.expand()
			end, { silent = true })

			vim.keymap.set({ "i", "s" }, "<C-H>", function()
				ls.jump(-1)
			end, { silent = true })

			vim.keymap.set({ "i", "s" }, "<C-I>", function()
				if ls.choice_active() then
					ls.change_choice(1)
				end
			end, { silent = true })

			vim.keymap.set("n", "<leader><leader>s", "<cmd>source ~/.config/nvim/lua/plugins/completions.lua<CR>")
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		config = function()
			local cmp = require("cmp")

			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				experimental = {
					ghost_text = true,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({
						behavior = cmp.ConfirmBehavior.Insert,
						select = true,
					}),
					["<Tab>"] = cmp.mapping(function(fallback)
						fallback()
					end),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" }, -- For luasnip users.
				}, {
					{ name = "buffer", keyword_length = 5 },
				}),
			})
		end,
	},
}
