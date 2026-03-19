return {
  'saghen/blink.cmp',
  event = 'VimEnter',
  version = '1.*',
  dependencies = {
    'folke/lazydev.nvim',
  },
  --- @module 'blink.cmp'
  --- @type blink.cmp.Config
  opts = {
    keymap = {
      preset = 'super-tab',

      ['<C-k>'] = { 'select_prev' },
      ['<C-j>'] = { 'select_next' },
    },

    appearance = {
      nerd_font_variant = 'normal',
    },

    completion = {
      documentation = { auto_show = true, auto_show_delay_ms = 500 },
      accept = { auto_brackets = { enabled = false } },
    },

    sources = {
      default = { 'lsp', 'path', 'lazydev', 'buffer' },
      providers = {
        lazydev = { module = 'lazydev.integrations.blink', score_offset = 100 },
      },
    },

    fuzzy = { implementation = 'lua' },

    signature = { enabled = true },
  },
}
