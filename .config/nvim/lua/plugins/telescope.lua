return {
    "nvim-telescope/telescope.nvim",
    version = false,
    dependencies = {
        { "nvim-lua/plenary.nvim" },
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")
        local builtin = require("telescope.builtin")

        telescope.setup({
            defaults = {
                prompt_prefix = " ",
                selection_caret = " ❯ ",
                sorting_strategy = "ascending",
                layout_strategy = "horizontal",
                layout_config = {
                    horizontal = {
                        preview_width = 48, -- Disables preview
                        results_width = 1, -- Results take full width
                        width = 0.9, -- Big width (90% of window)
                        height = 0.85, -- Big height (85% of window)
                        prompt_position = "top",
                        preview_cutoff = 1,
                    },
                },
                winblend = 15, -- Transparency
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
            pickers = {
                find_files = { hidden = true, previewer = false },
                live_grep = { previewer = true },
                oldfiles = { previewer = false },
                buffers = { sort_lastused = true, previewer = false },
            },
            extensions = {
                fzf = {
                    fuzzy = true,
                    override_generic_sorter = true,
                    override_file_sorter = true,
                    case_mode = "smart_case",
                },
            },
        })

        telescope.load_extension("fzf")

        vim.keymap.set("n", "<leader><leader>", builtin.find_files, { desc = "Find Files" })
        vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live Grep" })
        vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Recent Files" })
        vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Buffers" })
        vim.keymap.set("n", "<leader>fc", builtin.colorscheme, { desc = "Themes" })
        vim.keymap.set("n", "<leader>fv", builtin.vim_options, { desc = "Options" })
    end,
}
