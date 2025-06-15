return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")
    local lazy_status = require("lazy.status")
    local colors = {
      bg = "none",
      surface = "#1f1d2e",
      text = "#e0def4",
      muted = "#6e6a86",
      love = "#eb6f92",
      gold = "#f6c177",
      rose = "#ea9a97",
      pine = "#3e8fb0",
      foam = "#9ccfd8",
      iris = "#c4a7e7",
      highlight = "#524f67",
    }

    local rosepine_theme = {
      normal = {
        a = { bg = colors.pine, fg = colors.surface, gui = "bold" },
        b = { bg = "none", fg = colors.text },
        c = { bg = "none", fg = colors.text },
      },
      insert = {
        a = { bg = colors.foam, fg = colors.surface, gui = "bold" },
        b = { bg = "none", fg = colors.text },
        c = { bg = "none", fg = colors.text },
      },
      visual = {
        a = { bg = colors.iris, fg = colors.surface, gui = "bold" },
        b = { bg = "none", fg = colors.text },
        c = { bg = "none", fg = colors.text },
      },
      replace = {
        a = { bg = colors.love, fg = colors.surface, gui = "bold" },
        b = { bg = "none", fg = colors.text },
        c = { bg = "none", fg = colors.text },
      },
      command = {
        a = { bg = colors.gold, fg = colors.surface, gui = "bold" },
        b = { bg = "none", fg = colors.text },
        c = { bg = "none", fg = colors.text },
      },
      inactive = {
        a = { bg = colors.highlight, fg = colors.muted, gui = "bold" },
        b = { bg = "none", fg = colors.muted },
        c = { bg = "none", fg = colors.muted },
      },
    }

    lualine.setup({
      options = {
        theme = rosepine_theme,
        globalstatus = true,
        icons_enabled = true,
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff" },
        lualine_c = { "filename" },
        lualine_x = {
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
            color = { fg = colors.gold },
          },
          "encoding",
          "fileformat",
          "filetype",
        },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
    })
  end,
}
