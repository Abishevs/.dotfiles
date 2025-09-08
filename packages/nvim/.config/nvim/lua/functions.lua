local M = {}

function M.copy_file_path()
	local path = vim.fn.expand("%:p")  -- Get absolute file path
	if path == "" then
		print("No file open!")  -- Prevent errors if no file is open
		return
	end

	local home = vim.fn.expand("$HOME")  -- Get home directory
	if home ~= "" then
		path = path:gsub(home, "~")  -- Replace home path with ~
	end

	local cmd = "echo " .. vim.fn.shellescape(path) .. " | xclip -i -selection clipboard"
	vim.fn.system(cmd)

	print("Copied: " .. path)
end

return M
