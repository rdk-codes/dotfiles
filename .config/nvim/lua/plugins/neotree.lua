return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    "3rd/image.nvim",
  },
  config = function()
    require("neo-tree").setup({
      close_if_last_window = true, -- Close Neo-tree if it's the last window
      window = {
        position = "current", -- open in current buffer (same as netrw)
        mappings = {
          ["<space>"] = "none", -- disable space toggle if you like
        },
      },
      filesystem = {
        hijack_netrw_behavior = "open_current", -- optional, hijack netrw
        follow_current_file = {
          enabled = true, -- focus current file
        },
      },
    })
    -- Keybinding to toggle Neo-tree in the current window (like netrw)
    vim.keymap.set("n", "<leader>e", ":Neotree filesystem reveal toggle<CR>", { silent = true, noremap = true })
  end,
}

