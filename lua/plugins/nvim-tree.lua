return {
  'nvim-tree/nvim-tree.lua',
  version = '*',
  lazy = false,
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    -- disable netrw at the very start of your init.lua
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    -- optionally enable 24-bit colour
    vim.opt.termguicolors = true

    require('nvim-tree').setup {
      renderer = {
        highlight_git = true,
        highlight_diagnostics = true,
        icons = {
          glyphs = {
            default = '󰈙',
            symlink = '',
            bookmark = '󰆤',
            modified = '●',
            folder = {
              arrow_open = '▾',
              arrow_closed = '▸',
              default = '',
              open = '',
              empty = '',
              empty_open = '',
              symlink = '',
              symlink_open = '',
            },
            git = {
              unstaged = '',
              staged = '',
              unmerged = '',
              renamed = '',
              untracked = '',
              deleted = '',
              ignored = '',
            },
          },
        },
      },
    }

    vim.keymap.set({ 'n' }, '<leader>ee', '<CMD>NvimTreeToggle<CR>', { desc = 'Toggle Nvim Tree' })
  end,
}
