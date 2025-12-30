-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("highlight-undo").setup({})
require("urlview").setup({})
vim.o.scrolloff = 15

vim.opt.sidescrolloff = 8
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.keymap.set("x", "p", '"_dP', { noremap = true, silent = true })
