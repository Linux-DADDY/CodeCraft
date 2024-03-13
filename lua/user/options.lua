-- if vim.g.neovide then
--   -- vim.opt.guifont = "MonoLisa:h24"

--   vim.g.neovide_transparency = 1
--   vim.g.transparency = 0.8
--   vim.g.neovide_scroll_animation_length = 0.3
--   vim.g.neovide_refresh_rate = 60
--   vim.g.neovide_confirm_quit = true
--   vim.g.neovide_input_macos_alt_is_meta = false
-- end

vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.relativenumber = true

lvim.log.level = "warn"
lvim.format_on_save = true

lvim.builtin.treesitter.ensure_installed = {
	"bash",
	-- "c",
	"html",
	"css",
	"javascript",
	"json",
	"lua",
	"python",
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

-- lvim.lsp.diagnostics.virtual_text_padding = 50
-- lvim.lsp.diagnostics.underline = true

-- -- TS Rainbow
-- lvim.builtin.treesitter.rainbow.enable = true

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

-- NOTE: Bufferline
-- lvim.keys.normal_mode["<S-Left>"] = "<cmd>BufferLineCyclePrev<cr>"
-- lvim.keys.normal_mode["<S-Right>"] = "<cmd>BufferLineCycleNext<cr>"
lvim.keys.normal_mode["<S-l>"] = "<cmd>BufferLineCyclePrev<cr>"
lvim.keys.normal_mode["<S-h>"] = "<cmd>BufferLineCycleNext<cr>"

-- NOTE: Oil nvim
vim.keymap.set("n", "-", "<CMD>Oil --float<CR>", { desc = "Open parent directory" })
