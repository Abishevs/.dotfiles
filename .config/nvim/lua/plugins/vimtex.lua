return {
	'mhinz/neovim-remote',
	{'lervag/vimtex',
	opt = true,
	config = function ()
		vim.g.vimtex_view_general_viewer = 'zathura'
	end,
	}
}
