return {
    "nvim-telescope/telescope.nvim",
    version = false,
    dependencies = {
        { "nvim-lua/plenary.nvim" },
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        'nvim-telescope/telescope-ui-select.nvim'
    },
    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")
        local builtin = require("telescope.builtin")

        telescope.setup(
        {
            defaults = {
                prompt_prefix = " ",
                selection_caret = " ❯ ",
                sorting_strategy = "ascending",
                layout_strategy = "horizontal",
                winblend = 15, 
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
              fzf = {
                fuzzy = true,
                override_generic_sorter = true,
                override_file_sorter = true,
                case_mode = "smart_case",
              },
              ["ui-select"] = {
                require("telescope.themes").get_dropdown {
                },
              },
            }
        })

        telescope.load_extension("fzf")
        telescope.load_extension("ui-select")

        vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "Buffers" })
        vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
        vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live Grep" })
        vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Recent Files" })
        vim.keymap.set("n", "<leader>fc", builtin.colorscheme, { desc = "Themes" })
        vim.keymap.set("n", "<leader>fv", builtin.vim_options, { desc = "Options" })
    end,
}
