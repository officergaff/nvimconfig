return {
    {
        "https://github.com/rafi/awesome-vim-colorschemes",
    },
    {
        "Mofiqul/dracula.nvim",
        lazy = false,
        priority = 1000,
    },
    {
        "ellisonleao/gruvbox.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("gruvbox").setup({
                contrast = "hard", -- can be "hard", "soft" or empty string
                transparent_mode = false,
            })
        end,
    }
}
