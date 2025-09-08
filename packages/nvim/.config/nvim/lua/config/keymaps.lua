local func = require("functions")

-- C and C++ adjusments
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "c", "cpp" },
    callback = function()
        vim.opt_local.tabstop = 4
        vim.opt_local.shiftwidth = 4
        vim.opt_local.expandtab = true
    end,
})

-- Copies current abs file path
vim.keymap.set("n", "<Leader>yp", func.copy_file_path,  { silent = true })

vim.keymap.set("n", "<Leader>wdg", ":VimwikiDiaryGenerateLinks<CR>", { silent = true })  -- Personal
vim.keymap.set("n", "<Leader>wdn", ":VimwikiMakeDiaryNote<CR>", { silent = true })  -- Personal
vim.keymap.set("n", "<Leader>wdt", ":VimwikiMakeTomorrowDiaryNote<CR>", { silent = true })  -- Personal
vim.keymap.set("n", "<Leader>wdy", ":VimwikiMakeYesterdayDiaryNote<CR>", { silent = true })  -- Personal

-- greatest remaps ever
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Remap window terminal mode to get working esc
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', { noremap = true, silent = true })

vim.keymap.set("n", "<leader>pf", vim.cmd.Ex)
vim.keymap.set("n", "<leader>o", vim.cmd.MarkdownPreview)

-- Debug printer setings
local debug_printer = require("debug_printer")
debug_printer.setup({
	insert_debug_keymap = "<leader>qp"
})
