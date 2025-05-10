return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local actions_state = require("telescope.actions.state")
    local actions_layout = require("telescope.actions.layout")

    telescope.setup({
      defaults = {
        path_display = { "truncate" },
        layout_strategy = "vertical",
        layout_config = {
          horizontal = {
            width = 0.8,
          },
          vertical = {
            prompt_position = "top",
            height = 0.9,
            width = 0.9,
            preview_height = 0.5,
          },
        },
        preview = {
          hide_on_startup = true,
        },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
            ["<C-j>"] = actions.move_selection_next, -- move to next result
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
            ["<C-y>"] = function()
              local entry = actions_state.get_selected_entry()
              local cb_opts = vim.opt.clipboard:get()
              if vim.tbl_contains(cb_opts, "unnamed") then
                vim.fn.setreg("*", entry.path)
              end
              if vim.tbl_contains(cb_opts, "unnamedplus") then
                vim.fn.setreg("+", entry.path)
              end
              vim.fn.setreg("", entry.path)
            end,
            ["<C-p>"] = actions_layout.toggle_preview,
          },
        },
      },
    })

    telescope.load_extension("fzf")
    telescope.load_extension("dir")

    local keymap = vim.keymap

    keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
    keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
    keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
    keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
    keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "List open buffers" })
    keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Telescope help tags" })

    -- find in directory plugin keymaps
    keymap.set("n", "<leader>fd", "<cmd>Telescope dir live_grep<CR>", { noremap = true, silent = true })
    keymap.set("n", "<leader>pd", "<cmd>Telescope dir find_files<CR>", { noremap = true, silent = true })

    keymap.set("n", "<leader>/", function()
      -- You can pass additional configuration to telescope to change theme, layout, etc.
      require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
        winblend = 10,
        previewer = false,
      }))
    end, { desc = "[/] Fuzzily search in current buffer" })
  end,
}
