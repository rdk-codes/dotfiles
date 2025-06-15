return {
  "echasnovski/mini.nvim",
  config = function()
    require("mini.ai").setup({ n_lines = 500 })
    require("mini.surround").setup()
    require("mini.comment").setup()
    require("mini.move").setup()
    require("mini.indentscope").setup({
      symbol = "▏",
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "help", "alpha", "dashboard", "oil", "lazy", "Mason" },
        callback = function()
          vim.b.miniindentscope_disable = true
        end,
      }),
    })
    require("mini.notify").setup()
    vim.notify = require("mini.notify").make_notify()
  end,
}
