return {
  "saghen/blink.cmp",
  event = "VimEnter",
  version = "1.*",
  dependencies = {
    "folke/lazydev.nvim",
  },

  config = function()
    vim.o.completeopt = "menu,menuone,noinsert,noselect"

    require("blink.cmp").setup({
      keymap = {
        preset = "default",
      },

      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = "mono",
      },

      completion = {
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 250,
          treesitter_highlighting = true,
          window = {
            border = "rounded",
            winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
          },
        },
        menu = {
          border = "rounded",
        },
      },

      sources = {
        default = { "lsp", "path", "snippets", "lazydev", "buffer" },
        providers = {

          -- NOTE: path
          path = {
            name = "path",
            module = "blink.cmp.sources.path",
            score_offset = 25,
            fallbacks = { "snippets", "buffer" },
            opts = {
              trailing_slash = false,
              label_trailing_slash = true,
              get_cwd = function(context)
                return vim.fn.expand(("#%d:p:h"):format(context.bufnr))
              end,
              show_hidden_files_by_default = true,
            },
          },

          -- NOTE: lsp
          lsp = {
            name = "lsp",
            enabled = true,
            module = "blink.cmp.sources.lsp",
            score_offset = 90,
          },

          -- NOTE: Lazydev
          lazydev = {
            name = "lazydev",
            module = "lazydev.integrations.blink",
            enabled = true,
            score_offset = 90,
          },

          -- NOTE: Snippets
          snippets = {
            name = "snippets",
            module = "blink.cmp.sources.snippets",
            enabled = true,
            max_items = 15,
            min_keyword_length = 2,
            score_offset = 85,
          },

          -- NOTE: Buffer
          buffer = {
            name = "buffer",
            module = "blink.cmp.sources.buffer",
            enabled = true,
            max_items = 5,
            min_keyword_length = 4,
            score_offset = 15,
          },
        },
      },

      snippets = { preset = "luasnip" },

      fuzzy = { implementation = "lua" },

      signature = {
        enabled = true,
        window = { border = "rounded" },
      },
    })
  end,
}
