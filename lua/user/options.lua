lvim.autocommands = {
  {
    "BufEnter",
    {
      pattern = { "*.json", "*.jsonc", "*.js", "*.ts" }, -- Filetype patterns
      command = "setlocal formatoptions-=o",             -- Remove 'o' from formatoptions
    },
  },
}


vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.relativenumber = true

lvim.log.level = "warn"
lvim.format_on_save = true

lvim.builtin.treesitter.ensure_installed = {
  "bash",
  -- "c",
  "javascript",
  "json",
  "lua",
  -- "python",
  "typescript",
  "tsx",
  "css",
  -- "rust",
  "java",
  "yaml",
}

lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = true
lvim.builtin.nvimtree.setup.filters.custom = {}

lvim.builtin.treesitter.ignore_install = {}
lvim.builtin.treesitter.highlight.enabled = true

lvim.builtin.nvimtree.active = false -- NOTE: using neo-tree

lvim.builtin.which_key.mappings["e"] = { "<cmd>Neotree toggle<CR>", "Explorer" }
lvim.builtin.tree_provider = "neo-tree"

lvim.builtin.project.detection_methods = { "lsp", "pattern" }
lvim.builtin.project.patterns = {
  ".git",
  "package-lock.json",
  "yarn.lock",
  "package.json",
  "requirements.txt",
}

vim.o.linebreak = true
vim.o.wrap = true
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

-- TS Rainbow
lvim.builtin.treesitter.rainbow.enable = true

lvim.builtin.telescope.defaults.path_display = {
  shorten = 4,
}

-- Eyeliner
vim.api.nvim_set_hl(0, "EyelinerPrimary", { fg = "#ff00ff", bold = true, underline = false })
vim.api.nvim_set_hl(0, "EyelinerSecondary", { fg = "#00ffff", underline = false })

lvim.builtin.telescope.defaults = {
  path_display = nil,
  layout_strategy = "horizontal",
  layout_config = {
    horizontal = {
      prompt_position = "top",
      preview_width = 0.60,
    },
    vertical = {
      mirror = false,
    },
    width = 0.87,
    height = 0.80,
    preview_cutoff = 120,
  },
}

-- lvim.builtin.telescope.pickers = {

--   path_display = nil,

--   find_files = {
--     -- theme = "dropdown",
--     layout_strategy = "horizontal",
--     layout_config = {
--       width = 0.85,
--       height = 0.90,
--       prompt_position = "top",
--       prompt_height = 0,
--     },

--     previewer = true,
--     hidden = true,

--     grep_previewer = {
--       layout_config = {
--         width = 0.97,
--         -- height = 0.95,
--       },
-- },
-- },
-- }
