return {
  "stevearc/oil.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  lazy = false,
  opts = {
    -- default_file_explorer = true,
    skip_confirm_for_simple_edits = true,
    view_options = {
      show_hidden = true,
    },
    keymaps = {
      ["<leader>e"] = "actions.close",
    },
  },
  keys = {
    { "<leader>e", "<cmd>Oil<CR>", { desc = "oil" } },
  },
}
