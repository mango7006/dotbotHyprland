-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("highlight-undo").setup({})
require("urlview").setup({})
vim.o.scrolloff = 15
vim.filetype.add({
    extension = { rasi = "rasi" },
    pattern = {
        [".*/waybar/config"] = "jsonc",
        [".*/dunst/dunstrc"] = "hyprlang",
        [".*/kitty/*.conf"] = "bash",
        [".*/hypr/.*%.conf"] = "hyprlang",
        [".*/wofi/config"] = "hyprlang",
    },
})
vim.api.nvim_create_user_command("W", "write", {})
vim.api.nvim_create_user_command("Q", "quit", {})

vim.opt.sidescrolloff = 8
vim.opt.hlsearch = true
vim.opt.incsearch = true
