return { -- Fuzzy Finder (files, lsp, etc)
  'nvim-telescope/telescope.nvim',
  event = 'VimEnter',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { -- If encountering errors, see telescope-fzf-native README for installation instructions
      'nvim-telescope/telescope-fzf-native.nvim',

      -- `build` is used to run some command when the plugin is installed/updated.
      -- This is only run then, not every time Neovim starts up.
      build = 'make',

      -- `cond` is a condition used to determine whether this plugin should be
      -- installed and loaded.
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
    { 'nvim-telescope/telescope-ui-select.nvim' },

    -- Useful for getting pretty icons, but requires a Nerd Font.
    { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
  },
  config = function()
    local telescope = require 'telescope'
    local actions = require 'telescope.actions'
    local actions_state = require 'telescope.actions.state'
    local actions_layout = require 'telescope.actions.layout'

    telescope.setup {
      defaults = {
        path_display = { 'truncate' },
        layout_strategy = 'horizontal',
        layout_config = {
          horizontal = {
            width = 0.9,
          },
          vertical = {
            prompt_position = 'top',
            height = 0.9,
            width = 0.9,
            preview_height = 0.5,
          },
        },
        preview = {
          hide_on_startup = false,
        },
        mappings = {
          i = {
            ['<C-k>'] = actions.move_selection_previous, -- move to prev result
            ['<C-j>'] = actions.move_selection_next, -- move to next result
            ['<C-q>'] = actions.send_selected_to_qflist + actions.open_qflist,
            ['<C-y>'] = function()
              local entry = actions_state.get_selected_entry()
              local cb_opts = vim.opt.clipboard:get()
              if vim.tbl_contains(cb_opts, 'unnamed') then
                vim.fn.setreg('*', entry.path)
              end
              if vim.tbl_contains(cb_opts, 'unnamedplus') then
                vim.fn.setreg('+', entry.path)
              end
              vim.fn.setreg('', entry.path)
            end,
            ['<C-p>'] = actions_layout.toggle_preview,
          },
        },
      },
    }

    -- Enable Telescope extensions if they are installed
    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ui-select')
    pcall(require('telescope').load_extension, 'attempt')

    -- See `:help telescope.builtin`
    local builtin = require 'telescope.builtin'
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = '[F]ind [H]elp' })
    vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = 'Find [K]eymaps' })
    vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find [F]iles' })
    vim.keymap.set('n', '<leader>fc', builtin.grep_string, { desc = 'Find current [W]ord' })
    vim.keymap.set('n', '<leader>fs', builtin.live_grep, { desc = 'Find by [G]rep' })
    vim.keymap.set('n', '<leader>gs', builtin.git_status, { desc = 'Find in Git Status' })
    vim.keymap.set('n', '<leader>gc', builtin.git_commits, { desc = 'Find in Git commits' })
    vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })

    -- Slightly advanced example of overriding default behavior and theme
    vim.keymap.set('n', '<leader>/', function()
      -- You can pass additional configuration to Telescope to change the theme, layout, etc.
      builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
      })
    end, { desc = '[/] Fuzzily search in current buffer' })
  end,
}
