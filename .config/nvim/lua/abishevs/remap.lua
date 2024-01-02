vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pf", vim.cmd.Ex)
vim.keymap.set("n", "<leader>o", vim.cmd.MarkdownPreview)


-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])
--
-- -- next greatest remap ever 
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
