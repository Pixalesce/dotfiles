-- blink documentation
-- https://cmp.saghen.dev/configuration/keymap.html
return {
  {
    'saghen/blink.cmp',
    dependencies = 'rafamadriz/friendly-snippets',
    version = 'v0.*',
    opts = {
      keymap = {
        preset = 'default',
        ['<C-c>'] = { 'select_and_accept' },
        ['<C-u>'] = { 'scroll_documentation_up', 'fallback' },
        ['<C-d>'] = { 'scroll_documentation_down', 'fallback' },
        ['<C-l>'] = { 'snippet_forward', 'fallback' },
        ['<C-h>'] = { 'snippet_backward', 'fallback' },
      },

      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = 'mono'
      },

      signature = { enabled = true },
      sources = {
        providers = {
          snippets = {
            opts = {
              search_paths = { "~/.config/nvim/lua/config/plugins/snippets" },
            },
          },
          lsp = {
            opts = {},
          },
          buffer = {
            opts = {},
          },
          path = {
            opts = {},
          },
        },
      }
    },
  },
}
