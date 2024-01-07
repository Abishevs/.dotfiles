local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.opt.smartindent = true
vim.opt.relativenumber = true
vim.opt.nu = true
vim.opt.showmode = false
vim.opt.scrolloff = 20
vim.o.shell = "/usr/bin/zsh"
vim.opt.textwidth = 72
vim.opt.conceallevel = 1
vim.o.termguicolors = true

require("lazy").setup("plugins")


vim.keymap.set("n", "<leader>pf", vim.cmd.Ex)
vim.keymap.set("n", "<leader>o", vim.cmd.MarkdownPreview)

vim.cmd.colorscheme "catppuccin"

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])
--
-- -- next greatest remap ever 
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

