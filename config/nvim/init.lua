-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("highlight-undo").setup({})
require("urlview").setup({})
vim.o.scrolloff = 10
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
