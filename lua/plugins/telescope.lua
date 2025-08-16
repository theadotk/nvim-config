return {
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.8',
        dependencies = {
            'nvim-lua/plenary.nvim',
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
        },
        config = function()
            local telescope = require('telescope')
            local builtin = require('telescope.builtin')
            local themes = require('telescope.themes')

            telescope.setup {
                defaults = {
                    mappings = {
                        n = {
                            ["<C-p>"] = require('telescope.actions.layout').toggle_preview
                        },
                        i = {
                            ["<Esc>"] = require('telescope.actions').close,
                            ["<C-c>"] = false
                        }
                    }
                },
                extensions = {
                    fzf = {}
                },
            }

            telescope.load_extension('fzf')

            local ivy_opts = {
                layout_config = {
                    height = 0.8
                }
            }

            vim.keymap.set("n", "<leader>ff", function() builtin.find_files(themes.get_ivy(ivy_opts)) end)
            vim.keymap.set("n", "<leader>gf", function() builtin.git_files(themes.get_ivy(ivy_opts)) end)
            vim.keymap.set("n", "<leader>ld", function() builtin.diagnostics(themes.get_dropdown()) end)
        end
    }
}
