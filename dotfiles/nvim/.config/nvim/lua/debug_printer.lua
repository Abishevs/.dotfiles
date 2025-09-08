-- ~/.config/nvim/lua/debug_printer.lua
local M = {}

function M.insert_debug_statement()
    local filetype = vim.bo.filetype

    if filetype == 'python' then
        M.insert_python_debug()
    elseif filetype == 'rust' then
        M.insert_rust_debug()
    else
        print("Debug statements not supported for this filetype: " .. filetype)
        return
    end
end

function M.insert_rust_debug()
    local line = vim.fn.line('.') - 1
    local var_name = vim.fn.expand("<cword>")  -- Gets the word under cursor

    local current_line = vim.api.nvim_buf_get_lines(0, line, line + 1, false)[1]
    local indent = current_line:match("^%s*")  -- Capture leading whitespace

    -- Prepare the debug statement with the same indentation
    local debug_statement = string.format('%sprintln!("DEBUG: {:?}", %s);', indent, var_name)

    -- Insert the debug statement on the next line
    vim.api.nvim_buf_set_lines(0, line + 1, line + 1, false, {debug_statement})
end

function M.insert_python_debug()
    local line = vim.fn.line('.') - 1
    local current_line = vim.api.nvim_buf_get_lines(0, line, line + 1, false)[1]
    local indent = current_line:match("^%s*")
    local var_name = vim.fn.expand("<cword>")
    local debug_statement = string.format('%sprint(f"DEBUG: {%s}")', indent, var_name)
    vim.api.nvim_buf_set_lines(0, line + 1, line + 1, false, {debug_statement})
end


function M.setup(opts)
	opts = opts or {}
	local keybind = opts.insert_debug_keymap or "<leader>dp"
	vim.keymap.set("n", keybind, M.insert_debug_statement)
end

return M
