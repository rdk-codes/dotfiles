vim.cmd([[
  highlight YankHighlightNormal guibg=#F6C277
  highlight YankHighlightClipboard guibg=#97ccff
]])

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight yanks with different colors based on register",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    local reg = vim.v.event.regname
    if reg == "+" then
      vim.highlight.on_yank({ higroup = "YankHighlightClipboard", timeout = 150 })
    else
      vim.highlight.on_yank({ higroup = "YankHighlightNormal", timeout = 150 })
    end
  end,
})
