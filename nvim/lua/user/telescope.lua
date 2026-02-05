local M = {
  "nvim-telescope/telescope.nvim",
  dependencies = { 'nvim-lua/plenary.nvim' },
  lazy = true,
  cmd = "Telescope",
}

function M.config()
  local actions = require "telescope.actions"
  require("telescope").setup {
    defaults = {
      layout_strategy = 'vertical',
      mappings = {
        i = {
          ["<C-n>"] = actions.cycle_history_next,
          ["<C-p>"] = actions.cycle_history_prev,

          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,

          ["<C-q>"] = actions.close,

          ["<C-d>"] = actions.delete_buffer,
        },
        n = {
          ["<C-d>"] = actions.delete_buffer,
          ["<esc>"] = actions.close,
          ["j"] = actions.move_selection_next,
          ["k"] = actions.move_selection_previous,
          ["q"] = actions.close,
        },
      },
    }
  }
end

return M
