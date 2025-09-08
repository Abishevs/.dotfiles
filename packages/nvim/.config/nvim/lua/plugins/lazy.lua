return {
	'tpope/vim-fugitive',
	'nvim-tree/nvim-web-devicons',
	'lervag/vimtex',
	'dpelle/vim-LanguageTool',
	{
		"rcarriga/nvim-notify",
		config = function()
			require("notify").setup({
				background_colour = "#000000",
			})
		end
	},

	--[[ {
		"folke/noice.nvim",
		config = function()
			require("noice").setup({
				-- add any options here
				-- routes = {
				--   {
				--     view = "notify",
				--     filter = { event = "msg_showmode" },
				--   },
				-- },
			})
		end,
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			"rcarriga/nvim-notify",
		}
	}, ]]

}
