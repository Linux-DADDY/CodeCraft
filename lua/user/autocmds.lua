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
      pattern = { "*.json", "*.jsonc", "*.js", "*.ts", "*lua" }, -- Filetype patterns
      command = "setlocal formatoptions-=o",                     -- Remove 'o' from formatoptions
    },
  },
}

-- -- NOTE: Set wrap for specific filetypes
-- lvim.autocommands = {
--   {
--     "BufEnter",                                          -- see `:h autocmd-events`
--     {                                                    -- this table is passed verbatim as `opts` to `nvim_create_autocmd`
--       pattern = { "*.json", "*.jsonc", "*.js", "*.ts" }, -- see `:h autocmd-events`
--       command = "setlocal wrap",
--     }
--   },
-- }

	vim.api.nvim_create_autocmd("BufRead", {
		pattern = "*.norg",
		command = "norm zR",
	})

