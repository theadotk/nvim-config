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

            vim.api.nvim_create_autocmd("FileType", {
                pattern = "oil",
                callback = function()
                    vim.opt_local.number = false
                    vim.opt_local.relativenumber = false
                end
            })
        end
    }
}
