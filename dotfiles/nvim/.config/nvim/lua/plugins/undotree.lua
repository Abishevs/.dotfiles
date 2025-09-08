return {

    'mbbill/undotree',
    config = function()
        -- Set the undo directory
        local target_path = vim.fn.expand("~/.undodir")
        
        -- Create the directory if it doesn't exist
        if vim.fn.isdirectory(target_path) == 0 then
            vim.fn.mkdir(target_path, "p")
        end

        -- Configure undo settings
        vim.o.undodir = target_path
        vim.o.undofile = true

        -- Keybinding to toggle the UndoTree
	vim.keymap.set('n', '<leader>uu', function()
		vim.cmd.UndotreeToggle() 
		vim.cmd.UndotreeFocus() 
	end)


    end
}

