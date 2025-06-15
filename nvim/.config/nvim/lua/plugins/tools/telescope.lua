return {
  "nvim-telescope/telescope.nvim",
  event = "VimEnter",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      cond = function()
        return vim.fn.executable("make") == 1
      end,
    },
    { "nvim-telescope/telescope-ui-select.nvim" },
    { "nvim-tree/nvim-web-devicons" },
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local builtin = require("telescope.builtin")

    telescope.setup({
      defaults = {
        winblend = 0,
        border = true,
        color_devicons = true,
        file_ignore_patterns = { "node_modules", ".git/" },
        mappings = {
          i = {
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
          },
        },
      },
      extensions = {
        ["ui-select"] = require("telescope.themes").get_dropdown(),
      },
    })

    pcall(telescope.load_extension, "fzf")
    pcall(telescope.load_extension, "ui-select")

    vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "help" })
    vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "keymaps" })
    vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "files" })
    vim.keymap.set("n", "<leader>fs", builtin.builtin, { desc = "search telescope" })
    vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "search cwd" })
    vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "live grep" })
    vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "diagnostics search" })
    vim.keymap.set("n", "<leader>fR", builtin.resume, { desc = "resume" })
    vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "recents" })
    vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "buffers" })

    vim.keymap.set("n", "<leader>//", function()
      builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
        winblend = 10,
        previewer = false,
      }))
    end, { desc = "fuzzy search current buffer" })

    vim.keymap.set("n", "<leader>f/", function()
      builtin.live_grep({
        grep_open_files = true,
        prompt_title = "Live Grep in Open Files",
      })
    end, { desc = "live grep open" })

    vim.keymap.set("n", "<leader>fn", function()
      builtin.find_files({ cwd = vim.fn.stdpath("config") })
    end, { desc = "nvim dot search" })
  end,
}
