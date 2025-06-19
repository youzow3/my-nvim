
vim.opt.number = true
vim.opt.expandtab = false
vim.opt.backup = true
home_dir = vim.env.HOME
vim.opt.backupdir = home_dir .. "/backup/nvim"

require("config.lazy")
require("config.keymap")

