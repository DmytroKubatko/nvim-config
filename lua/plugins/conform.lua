return { -- Autoformat
  'stevearc/conform.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  cmd = { 'ConformInfo' },
  keys = {
    {
      '<leader>f',
      function()
        require('conform').format { async = true, lsp_format = 'fallback' }
      end,
      mode = '',
      desc = '[F]ormat buffer',
    },
  },
  config = function()
    local conform = require 'conform'

    local prettier_configs = {
      '.prettierrc',
      '.prettierrc.js',
      '.prettierrc.cjs',
      '.prettierrc.json',
      '.prettierrc.yaml',
      '.prettierrc.yml',
      '.prettierrc.toml',
      'prettier.config.js',
      'prettier.config.cjs',
      'prettier.config.ts',
    }

    local oxfmt_configs = {
      'oxc.config.json',
      'oxlint.config.json',
      '.oxlintrc',
      '.oxlintrc.json',
    }

    local function has_config(ctx, filenames)
      return vim.fs.find(filenames, { path = ctx.dirname, upward = true })[1] ~= nil
    end

    local js_fts = { 'javascript', 'typescript', 'javascriptreact', 'typescriptreact', 'css', 'html', 'json', 'yaml', 'markdown', 'graphql' }
    local formatters_by_ft = { lua = { 'stylua' } }
    for _, ft in ipairs(js_fts) do
      formatters_by_ft[ft] = { 'prettierd', 'oxfmt', stop_after_first = true }
    end

    conform.setup {
      notify_on_error = false,
      format_on_save = function(bufnr)
        local disable_filetypes = { c = true, cpp = true, php = true }
        if disable_filetypes[vim.bo[bufnr].filetype] then
          return nil
        elseif vim.g.disable_autoformat or vim.b.disable_autoformat then
          return nil
        else
          return {
            timeout_ms = 500,
            lsp_format = 'fallback',
          }
        end
      end,
      formatters_by_ft = formatters_by_ft,
      formatters = {
        prettierd = {
          condition = function(_, ctx)
            return has_config(ctx, prettier_configs)
          end,
        },
        oxfmt = {
          condition = function(_, ctx)
            return has_config(ctx, oxfmt_configs)
          end,
        },
      },
    }

    vim.api.nvim_create_user_command('FormatDisable', function(args)
      if args.bang then
        -- FormatDisable! will disable formatting just for this buffer
        vim.b.disable_autoformat = true
      else
        vim.g.disable_autoformat = true
      end
    end, {
      desc = 'Disable autoformat-on-save',
      bang = true,
    })

    vim.api.nvim_create_user_command('FormatEnable', function()
      vim.b.disable_autoformat = false
      vim.g.disable_autoformat = false
    end, {
      desc = 'Re-enable autoformat-on-save',
    })
  end,
}
