vim.pack.add({
    {
        src = "https://github.com/saghen/blink.cmp",
        version = vim.version.range("^1"),
    },
})

-- Lazy load on first insert mode entry (may not necessary)
local group = vim.api.nvim_create_augroup("BlinkCmpLazyLoad", { clear = true })

vim.api.nvim_create_autocmd("InsertEnter", {
    pattern = "*",
    group = group,
    once = true,
    callback = function()
        require("blink.cmp").setup({
            keymap = {
                preset = "none",

                ['<C-e>'] = { 'show', 'show_documentation', 'hide_documentation' },
                ['<C-c>'] = { 'select_and_accept', 'fallback' },

                ['<C-p>'] = { 'select_prev', 'fallback_to_mappings' },
                ['<C-n>'] = { 'select_next', 'fallback_to_mappings' },

                ['<C-u>'] = { 'scroll_documentation_up', 'fallback' },
                ['<C-d>'] = { 'scroll_documentation_down', 'fallback' },

                ['<Tab>'] = { 'snippet_forward', 'fallback' },
                ['<S-Tab>'] = { 'snippet_backward', 'fallback' },
            },
            appearance = {
                nerd_font_variant = "mono",
                use_nvim_cmp_as_default = true,
            },
            completion = {
                documentation = { auto_show = true },
            },
            sources = {
                default = {
                    "lsp",
                    "path",
                    "snippets",
                    "buffer"
                },
            },
            fuzzy = { implementation = "prefer_rust_with_warning" },
        })
    end,
})

