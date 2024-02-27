vim.api.nvim_create_autocmd("FileType", {
  pattern = { "zsh" },
  callback = function()
    -- let treesitter use bash highlight for zsh files as well
    require("nvim-treesitter.highlight").attach(0, "bash")
  end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { ".config/lvim/config.lua" },
  command = "PackerCompile",
})

lvim.autocommands = {
  {
    "BufEnter",
    {
      pattern = { "*.lua", "*.js", "*.ts", "*.tsx", "*.jsx" },
      command = "set formatoptions-=o",
    },
  },
}
