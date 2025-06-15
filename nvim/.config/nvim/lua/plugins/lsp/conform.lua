return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  keys = {
    {
      "<leader>gf",
      function()
        require("conform").format({ async = true, lsp_format = "fallback" })
      end,
      mode = "",
      desc = "format",
    },
  },
  opts = {
    notify_on_error = false,
    format_on_save = function(bufnr)
      local disable_filetypes = { c = true, cpp = true }
      if disable_filetypes[vim.bo[bufnr].filetype] then
        return nil
      else
        return {
          timeout_ms = 500,
          lsp_format = "fallback",
        }
      end
    end,
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "ruff_organize_imports", "ruff_fix", "ruff_format" },
    },
    formatters = {
      -- Ruff Format (like black)
      ruff_format = {
        command = "ruff",
        args = { "format", "-" },
        stdin = true,
      },

      -- Ruff Fix (like ruff check --fix)
      ruff_fix = {
        command = "ruff",
        args = { "check", "--fix", "--exit-zero", "-" },
        stdin = true,
      },

      -- Ruff Import Organizer (like ruff check --fix --select I)
      ruff_organize_imports = {
        command = "ruff",
        args = { "check", "--fix", "--exit-zero", "--select", "I", "-" },
        stdin = true,
      },
    },
  },
}
