-- Setup mason first
require("mason").setup()
require('mason-lspconfig').setup({
    ensure_installed = {
        'jedi_language_server',
        'eslint',
        'intelephense',
        'clangd',
        'html',
        "lua_ls",
        "rust_analyzer",
        "ts_ls",
    },
})

-- Common LSP capabilities and on_attach
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Modern method: Use LspAttach autocommand instead of on_attach function
vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP actions',
    callback = function(event)
        local opts = { buffer = event.buf, remap = false }

        --Keymaps
        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end,
            vim.tbl_extend("force", { desc = "Jump to definition" }, opts))

        vim.keymap.set("n", "K", function() vim.lsp.buf.hover({ border = "rounded" }) end,
            vim.tbl_extend("force", { desc = "Display hover information" }, opts))

        vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end,
            vim.tbl_extend("force", { desc = "Search workspace symbols" }, opts))

        vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end,
            vim.tbl_extend("force", { desc = "Open diagnostic float window" }, opts))

        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end,
            vim.tbl_extend("force", { desc = "Jump to next diagnostic" }, opts))

        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end,
            vim.tbl_extend("force", { desc = "Jump to previous diagnostic" }, opts))

        vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end,
            vim.tbl_extend("force", { desc = "Trigger code actions" }, opts))

        vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end,
            vim.tbl_extend("force", { desc = "Find references" }, opts))

        vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end,
            vim.tbl_extend("force", { desc = "Rename symbols" }, opts))

        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end,
            vim.tbl_extend("force", { desc = "Display signature help" }, opts))

        -- Formatting Keymap (Specific to HTML if needed, or global)
        vim.keymap.set("n", "<leader>f", function()
             vim.lsp.buf.format({
                filter = function(client)
                    -- Example: forcing HTML server only for HTML files
                    if vim.bo.filetype == 'html' then return client.name == 'html' end
                    return true
                end
            })
        end, { desc = "Format current buffer" })
    end,
})

-- Configure diagnostics
vim.diagnostic.config({
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = 'e',
            [vim.diagnostic.severity.WARN] = 'w',
            [vim.diagnostic.severity.INFO] = 'i',
            [vim.diagnostic.severity.HINT] = 'h',
        }
    },
    virtual_text = false,
    update_in_insert = false,
    float = {
        border = "rounded",
        source = true,
        header = "",
        prefix = "",
    },
})

-- Auto-show diagnostics on hover (CursorHold)
vim.api.nvim_create_autocmd("CursorHold", {
    callback = function()
        local opts = {
            focusable = false,
            close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
            border = 'rounded',
            source = true,
            prefix = ' ',
            scope = 'cursor',
        }
        vim.diagnostic.open_float(nil, opts)
    end
})

-- Adjust hover time
vim.opt.updatetime = 1000

-- Ensure lspconfig is loaded to populate default settings
require('lspconfig')

-- Enable LSP servers using the modern vim.lsp.enable approach
local servers = {
    'jedi_language_server',
    'eslint',
    'intelephense',
    'clangd',
    'html',
    'lua_ls',
    'rust_analyzer',
    'ts_ls',
}

-- Define the HTML specific settings to fix formatting
local html_settings = {
    html = {
        format = {
            templating = true,
            wrapLineLength = 120,
            wrapAttributes = 'force-expand-multiline',
            indentInnerHtml = true,
        }
    }
}

for _, server in ipairs(servers) do
    local opts = {
        capabilities = capabilities,
    }

    if server == 'html' then
        opts.settings = html_settings
    end

    if vim.lsp.config[server] then
        vim.lsp.config[server] = vim.tbl_deep_extend("force", vim.lsp.config[server], opts)

        vim.lsp.enable(server)
    end
end
