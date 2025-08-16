return {
    {
        'stevearc/oil.nvim',
        dependencies = { "nvim-tree/nvim-web-devicons" },
        lazy = false,
        config = function()
            require("oil").setup({
                default_file_explorer = true,
            })
            vim.keymap.set("n", "<leader>dt", ":Oil<CR>")
        end
    }
}
