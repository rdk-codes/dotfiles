return {
  "goolord/alpha-nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")
    dashboard.section.header.val = {
      [[                                                                       ]],
      [[                                                                     ]],
      [[       ████ ██████           █████      ██                     ]],
      [[      ███████████             █████                             ]],
      [[      █████████ ███████████████████ ███   ███████████   ]],
      [[     █████████  ███    █████████████ █████ ██████████████   ]],
      [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
      [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
      [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
      [[                                                                       ]],
    }

    -- Buttons
    dashboard.section.buttons.val = {
      dashboard.button("n", "  New file", ":ene <BAR> startinsert<CR>"),
      dashboard.button("r", "  Recent files", ":Telescope oldfiles<CR>"),
      dashboard.button("l", "  Lazy", ":Lazy<CR>"),
      dashboard.button("m", "  Mason", ":Mason<CR>"),
      dashboard.button("q", "  Quit", ":qa<CR>"),
    }

    -- Footer: ensure it displays
    dashboard.section.footer.val = {
      "⚡ Neovim loaded",
    }

    -- dashboard.opts.layout = {
    --   { type = "padding", val = 1 },
    --   dashboard.section.header,
    --   { type = "padding", val = 2 },
    --   dashboard.section.buttons,
    --   { type = "padding", val = 1 },
    --   dashboard.section.footer,
    -- }

    alpha.setup(dashboard.opts)
  end,
}
