return {
	'nvim-treesitter/nvim-treesitter',
	config = function()
		require('nvim-treesitter.configs').setup {
			-- Add languages to be installed here that you want installed for treesitter
			ensure_installed = { 
				'go', 'lua', 'python', 'rust', 'typescript', 'regex', 
				'bash', 'markdown', 'markdown_inline', 'sql', 'org'
			},

		}
	end
}

