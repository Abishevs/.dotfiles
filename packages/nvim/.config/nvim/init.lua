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

require("config.settings")
require("lazy").setup("plugins")
require("config.keymaps")


-- Set to auto so can be changed here
-- latte, frappe, macchiato, mocha
vim.cmd.colorscheme "catppuccin-macchiato"
