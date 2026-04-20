return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  keys = {
    -- explorer
    {
      '<leader>ee',
      function()
        Snacks.explorer()
      end,
      desc = 'Toggle [E]xplorer',
    },
    {
      '<leader>ef',
      function()
        Snacks.explorer.reveal()
      end,
      desc = '[E]xplorer [F]ocus current buffer',
    },
    -- picker
    {
      '<leader>fh',
      function()
        Snacks.picker.help()
      end,
      desc = '[F]ind [H]elp',
    },
    {
      '<leader>fk',
      function()
        Snacks.picker.keymaps()
      end,
      desc = 'Find [K]eymaps',
    },
    {
      '<leader>ff',
      function()
        Snacks.picker.files()
      end,
      desc = 'Find [F]iles',
    },
    {
      '<leader>fa',
      function()
        Snacks.picker.files { hidden = true }
      end,
      desc = 'Find [A]ll files (hidden)',
    },
    {
      '<leader>fc',
      function()
        Snacks.picker.grep_word()
      end,
      desc = 'Find [C]ursor word',
    },
    {
      '<leader>fs',
      function()
        Snacks.picker.grep()
      end,
      desc = 'Find by grep [S]earch',
    },
    {
      '<leader>fw',
      function()
        Snacks.picker.lsp_workspace_symbols()
      end,
      desc = '[F]ind [W]orkspace symbols',
    },
    {
      '<leader>gs',
      function()
        Snacks.picker.git_status()
      end,
      desc = '[G]it [S]tatus',
    },
    {
      '<leader>gc',
      function()
        Snacks.picker.git_log()
      end,
      desc = '[G]it [C]ommits',
    },
    {
      '<leader><leader>',
      function()
        Snacks.picker.buffers()
      end,
      desc = '[ ] Find existing buffers',
    },
    {
      '<leader>/',
      function()
        Snacks.picker.lines()
      end,
      desc = '[/] Fuzzy search in current buffer',
    },
    -- lazygit
    {
      '<leader>lg',
      function()
        Snacks.lazygit()
      end,
      desc = '[L]azy[G]it',
    },
    -- terminal
    {
      '<leader>tt',
      function()
        Snacks.terminal()
      end,
      desc = '[T]erminal toggle',
    },
    {
      '<leader>to',
      function()
        Snacks.terminal.open()
      end,
      desc = '[T]erminal [O]pen new',
    },
  },
  ---@type snacks.Config
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    bigfile = { enabled = true },
    dashboard = { enabled = false },
    explorer = { enabled = true },
    indent = { enabled = true },
    input = { enabled = true },
    picker = { enabled = true },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
    terminal = { enabled = true },
    lazygit = { enabled = true },
  },
}
