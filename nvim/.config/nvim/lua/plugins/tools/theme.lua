return {
  "rose-pine/neovim",
  priority = 1000,
  name = "rose-pine",
  config = function()
    require("rose-pine").setup({
      styles = {
        transparency = true,
      },
    })
    vim.cmd.colorscheme("rose-pine")
  end,
}
