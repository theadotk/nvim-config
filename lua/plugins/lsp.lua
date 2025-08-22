return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            {
                "folke/lazydev.nvim",
                ft = "lua",
                opts = {
                    library = {
                        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                    },
                },
            },
            {
                "mason-org/mason.nvim",
                opts = {
                    ui = {
                        border = "rounded",
                        width = 0.75,
                        height = 0.75
                    }
                }
            },
            { "saghen/blink.cmp" }
        },
        config = function()
            vim.lsp.enable({ "lua_ls", "clangd", "basedpyright" })
            vim.lsp.config("lua_ls", {})
            vim.lsp.config("clangd", {})
            vim.lsp.config("basedpyright", {})

            local function load_local_config()
                local local_config = vim.fn.getcwd() .. "/.nvim/init.lua"
                if vim.fn.filereadable(local_config) == 1 then
                    dofile(local_config)
                end
            end

            load_local_config()

            vim.api.nvim_create_autocmd('LspAttach', {
                callback = function(args)
                    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
                    if not client then return end

                    if not client:supports_method('textDocument/willSaveWaitUntil')
                        and client:supports_method('textDocument/formatting') then
                        vim.api.nvim_create_autocmd('BufWritePre', {
                            buffer = args.buf,
                            callback = function()
                                vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
                            end
                        })
                    end
                end,
            })

            vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { buffer = 0 })
        end,
    }
}
