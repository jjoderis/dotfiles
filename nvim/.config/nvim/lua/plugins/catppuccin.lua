return {
	{
		"catppuccin/nvim",
		lazy = false,
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				default_integrations = true,
				-- transparent_background = true,
				custom_highlights = function(colors)
					return {
						-- Comment = { fg = colors.flamingo },
						-- TabLineSel = { bg = colors.pink },
						-- CmpBorder = { fg = colors.surface2 },
						-- Pmenu = { bg = colors.none },
						-- LineNr = { fg = colors.teal },
					}
				end,
			})
			vim.cmd.colorscheme("catppuccin-mocha")
		end,
	},
}
