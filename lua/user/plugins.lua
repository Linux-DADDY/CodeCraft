lvim.plugins = {

	-- -- TODO: Octo (Github support)
	-- {
	-- 	"pwntester/octo.nvim",
	-- 	dependencies = {
	-- 		"nvim-lua/plenary.nvim",
	-- 		"nvim-telescope/telescope.nvim",
	-- 		"nvim-tree/nvim-web-devicons",
	-- 	},
	-- 	-- config = function()
	-- 	--   require("octo").setup()
	-- 	-- end,
	-- },

	-- NOTE: FZF Lua
	{
		"ibhagwan/fzf-lua",
		-- optional for icon support
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			-- calling `setup` is optional for customization
			require("fzf-lua").setup({})
		end,
	},

	-- -- NOTE: LspSaga
	-- {
	-- 	"nvimdev/lspsaga.nvim",
	-- 	config = function()
	-- 		require("lspsaga").setup({})
	-- 	end,
	-- 	dependencies = {
	-- 		"nvim-treesitter/nvim-treesitter",
	-- 		"nvim-tree/nvim-web-devicons",
	-- 	},
	-- },

	-- NOTE: ZEN mode
	{
		"folke/zen-mode.nvim",
		opts = {
			window = {
				width = 0.85, -- width will be 85% of the editor width
			},
			plugins = {
				options = {
					enabled = true,
					ruler = false, -- disables the ruler text in the cmd line area
					showcmd = false, -- disables the command in the last line of the screen
					laststatus = 0, -- turn off the statusline in zen mode
				},
				twilight = { enabled = true }, -- enable to start Twilight when zen mode opens
				gitsigns = { enabled = false }, -- disables git signs
				tmux = { enabled = false }, -- disables the tmux statusline
				kitty = {
					enabled = true,
					font = "+4", -- font size increment
				},
			},
		},
	},

	-- NOTE: Twilight
	{
		"folke/twilight.nvim",
		opts = {
			dimming = {
				alpha = 0.25, -- amount of dimming
				-- we try to get the foreground from the highlight groups or fallback color
				color = { "Normal", "#ffffff" },
				term_bg = "#000000", -- if guibg=NONE, this will be used to calculate text color
				inactive = false, -- when true, other windows will be fully dimmed (unless they contain the same buffer)
			},
			context = 10, -- amount of lines we will try to show around the current line
			treesitter = true, -- use treesitter when available for the filetype
			-- treesitter is used to automatically expand the visible text,
			-- but you can further control the types of nodes that should always be fully expanded
			expand = { -- for treesitter, we we always try to expand to the top-most ancestor with these types
				"function",
				"method",
				"table",
				"if_statement",
			},
			exclude = {}, -- exclude these filetypes
		},
	},

	-- NOTE: Scope nvim
	{
		"gennaro-tedesco/nvim-possession",
		lazy = false,
		dependencies = {
			{
				"tiagovla/scope.nvim",
				lazy = false,
				config = true,
			},
		},
		config = function()
			require("nvim-possession").setup({
				autoload = true,
				autoswitch = {
					enable = true,
				},
				save_hook = function()
					vim.cmd([[ScopeSaveState]]) -- Scope.nvim saving
				end,
				post_hook = function()
					vim.cmd([[ScopeLoadState]]) -- Scope.nvim loading
				end,
			})
		end,
	},

	-- -- NOTE: Rename
	-- { "filipdutescu/renamer.nvim" },

	-- NOTE: DENO
	{ "sigmasd/deno-nvim" },

	-- NOTE: MultiCursor
	-- { "mg979/vim-visual-multi" },

	-- {
	--   "smoka7/multicursors.nvim",
	--   event = "VeryLazy",
	--   dependencies = {
	--     'smoka7/hydra.nvim',
	--   },
	--   opts = {},
	--   cmd = { 'MCstart', 'MCvisual', 'MCclear', 'MCpattern', 'MCvisualPattern', 'MCunderCursor' },
	--   keys = {
	--     {
	--       mode = { 'v', 'n' },
	--       '<Leader>m',
	--       '<cmd>MCstart<cr>',
	--       desc = 'Create a selection for selected text or word under the cursor',
	--     },
	--   },
	-- },

	-- NOTE: Window picker
	{
		"s1n7ax/nvim-window-picker",
		name = "window-picker",
		event = "VeryLazy",
		version = "2.*",
		config = function()
			require("window-picker").setup()
		end,
	},

	-- NOTE: Timer
	{
		"epwalsh/pomo.nvim",
		version = "*", -- Recommended, use latest release instead of latest commit
		lazy = true,
		cmd = { "TimerStart", "TimerRepeat" },
		dependencies = {
			"rcarriga/nvim-notify",
		},
		opts = {
			-- See below for full list of options 👇
		},
	},

	-- NOTE: Glow
	{
		"ellisonleao/glow.nvim",
		config = true,
		cmd = "Glow",
	},

	--  -- TODO: Obsidian Notes.
	-- {
	-- 	"epwalsh/obsidian.nvim",
	-- 	version = "*", -- recommended, use latest release instead of latest commit
	-- 	lazy = true,
	-- 	ft = "markdown",
	-- 	-- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
	-- 	-- event = {
	-- 	--   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
	-- 	--   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
	-- 	--   "BufReadPre path/to/my-vault/**.md",
	-- 	--   "BufNewFile path/to/my-vault/**.md",
	-- 	-- },
	-- 	dependencies = {
	-- 		"nvim-lua/plenary.nvim",
	-- 	},
	-- 	opts = {
	-- 		workspaces = {
	-- 			{
	-- 				name = "personal",
	-- 				path = "~/vaults/personal",
	-- 			},
	-- 			{
	-- 				name = "work",
	-- 				path = "~/vaults/work",
	-- 			},
	-- 		},
	-- 	},
	-- },

	-- NOTE: Snippets
	{ "stevearc/vim-vscode-snippets" },

	-- NOTE: nvim-spectre
	{
		"windwp/nvim-spectre",
		event = "BufRead",
		lazy = "VeryLazy",
	},

	-- NOTE: noice nvim
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
	},

	-- NOTE: Fidget
	-- {
	--   "j-hui/fidget.nvim",
	--   tag = "v1.0.0",
	--   opts = {
	--     -- options
	--   },
	-- },

	-- NOTE: Notify
	-- { "rcarriga/nvim-notify" },

	-- NOTE: Codeium
	{
		"Exafunction/codeium.vim",
		config = function()
			vim.g.codeium_disable_bindings = 1
			vim.g.codeium_filetypes = { TelescopePrompt = true }
			vim.keymap.set("i", "<C-j>", function()
				return vim.fn["codeium#Accept"]()
			end, { expr = true })
			vim.keymap.set("i", "<C-f>", function()
				return vim.fn["codeium#CycleCompletions"](1)
			end, { expr = true })
			vim.keymap.set("i", "<C-b>", function()
				return vim.fn["codeium#CycleCompletions"](-1)
			end, { expr = true })
			vim.keymap.set("i", "<C-]>", function()
				return vim.fn["codeium#Clear"]()
			end, { expr = true })
		end,
	},

	-- TODO: Codeium NVIM Support
	-- {
	--   "Exafunction/codeium.nvim",
	--   dependencies = {
	--     "nvim-lua/plenary.nvim",
	--     "hrsh7th/nvim-cmp",
	--   },
	--   config = function()
	--     require("codeium").setup({
	--     })
	--     vim.g.codeium_disable_bindings = 1
	--     -- Change '<C-g>' here to any keycode you like.
	--     vim.keymap.set('i', '<C-j>', function() return vim.fn['codeium#Accept']() end, { expr = true, silent = true })
	--     vim.keymap.set('i', '<c-f>', function() return vim.fn['codeium#CycleCompletions'](1) end,
	--       { expr = true, silent = true })
	--     vim.keymap.set('i', '<c-b>', function() return vim.fn['codeium#CycleCompletions'](-1) end,
	--       { expr = true, silent = true })
	--     vim.keymap.set('i', '<c-]>', function() return vim.fn['codeium#Clear']() end, { expr = true, silent = true })
	--   end
	-- },

	-- NOTE: LIVE SERVER
	{
		"turbio/bracey.vim",
		cmd = { "Bracey", "BracyStop", "BraceyReload", "BraceyEval" },
		build = "npm install --prefix server",
	},

	-- NOTE: Neo Scroll
	{
		"karb94/neoscroll.nvim",
		event = "WinScrolled",
		config = function()
			require("neoscroll").setup({
				-- All these keys will be mapped to their corresponding default scrolling animation
				mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-f>", "<C-y>", "<C-e>", "zt", "zz", "zb" },
				hide_cursor = true, -- Hide cursor while scrolling
				stop_eof = true, -- Stop at <EOF> when scrolling downwards
				use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
				respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
				cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
				easing_function = nil, -- Default easing function
				pre_hook = nil, -- Function to run before the scrolling animation starts
				post_hook = nil, -- Function to run after the scrolling animation ends
			})
		end,
	},

	-- NOTE: Neo Tree
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		cmd = "Neotree",
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
		config = function()
			require("user.neotree").config()
		end,
	},

	-- NOTE: OIL
	{
		"stevearc/oil.nvim",
		opts = {},
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},

	-- NOTE: NUI
	{ "MunifTanjim/nui.nvim" },

	-- NOTE: TODO comments
	{
		"folke/todo-comments.nvim",
		event = "BufRead",
		config = function()
			require("todo-comments").setup()
		end,
	},

	-- NOTE: eyeliner
	{
		"jinh0/eyeliner.nvim",
		config = function()
			require("eyeliner").setup({
				highlight_on_key = true,
			})
		end,
		event = "BufRead",
	},

	-- NOTE: Dressing
	{
		"stevearc/dressing.nvim",
		config = function()
			require("dressing").setup({
				input = { enabled = false },
			})
		end,
	},

	-- NOTE: JS/TS servers
	-- { 'jose-elias-alvarez/typescript.nvim' },
	-- {
	--   "pmizio/typescript-tools.nvim",
	--   dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
	--   opts = {},
	-- },

	{
		-- NOTE: This plugin is not maintained anymore, you might wanna use https://github.com/pmizio/typescript-tools.nvim
		"jose-elias-alvarez/typescript.nvim",
		ft = {
			"javascript",
			"javascriptreact",
			"javascript.jsx",
			"typescript",
			"typescriptreact",
			"typescript.tsx",
		},
		lazy = true,
		-- config = function()
		-- require("user.tss").config()
		-- end,
	},

	-- NOTE: THEMES
	{ "lunarvim/lunar.nvim" },
	{ "lunarvim/colorschemes" },
	{ "morhetz/gruvbox" },
	{ "sainnhe/gruvbox-material" },
	{ "sainnhe/sonokai" },
	{ "sainnhe/edge" },
	{ "lunarvim/horizon.nvim" },
	{ "tomasr/molokai" },
	{ "ayu-theme/ayu-vim" },
	{ "folke/tokyonight.nvim" },
	{ "olimorris/onedarkpro.nvim" },
	{ "catppuccin/nvim" },
	-- { "bluz71/vim-nightfly-colors" },
	{ "EdenEast/nightfox.nvim" },
	{ "neanias/everforest-nvim" },
	{ "rebelot/kanagawa.nvim" },
	{ "nyoom-engineering/oxocarbon.nvim" },

	-- NOTE: Trouble nvim
	{
		"folke/trouble.nvim",
		cmd = "TroubleToggle",
	},

	-- NOTE: Persistence
	{
		"folke/persistence.nvim",
		event = "BufReadPre",
		config = function()
			require("persistence").setup({
				dir = vim.fn.expand(vim.fn.stdpath("state") .. "/sessions/"),
				options = { "buffers", "curdir", "tabpages", "winsize" },
			})
		end,
	},

	-- NOTE: Surround
	{ "tpope/vim-surround" },

	-- NOTE: Sanegx
	{
		"felipec/vim-sanegx",
		event = "BufRead",
	},

	-- NOTE: TS autotag
	{
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	},

	-- NOTE: Repeat
	{ "tpope/vim-repeat" },

	-- NOTE: Harpoon
	{ "ThePrimeagen/harpoon" },

	-- NOTE: Frecency
	{
		"nvim-telescope/telescope-frecency.nvim",
		dependencies = { "nvim-telescope/telescope.nvim", "kkharji/sqlite.lua" },
	},

	-- NOTE: Telescope tabs
	{
		"LukasPietzschmann/telescope-tabs",
		dependencies = { "nvim-telescope/telescope.nvim" },
	},

	-- NOTE: Trev
	{
		"AckslD/nvim-trevJ.lua",
	},

	-- NOTE: MINIMAP
	{
		"wfxr/minimap.vim",
		build = "cargo install --locked code-minimap",
		init = function()
			vim.g.minimap_width = 10
			vim.g.minimap_highlight_range = true
			-- vim.g.minimap_auto_start = true
			-- vim.g.minimap_auto_start_win_enter = true
			vim.g.minimap_highlight_search = true
		end,
	},

	-- NOTE: Colorizer
	{
		"roobert/tailwindcss-colorizer-cmp.nvim",
		lazy = true,
	},

	{
		"NvChad/nvim-colorizer.lua",
		event = "BufReadPre",
		lazy = true,
		config = function()
			require("colorizer").setup({
				filetypes = {
					"astro",
					"typescript",
					"typescriptreact",
					"javascript",
					"javascriptreact",
					"css",
					"html",
					"astro",
					"lua",
				},
			})
		end,
	},

	-- NOTE: Numb
	{
		"nacro90/numb.nvim",
		event = "BufRead",
		config = function()
			require("numb").setup({
				show_numbers = true, -- Enable 'number' for the window while peeking
				show_cursorline = true, -- Enable 'cursorline' for the window while peeking
			})
		end,
	},

	-- -- BUG: TS Rainbow
	-- {
	-- 	"mrjones2014/nvim-ts-rainbow",
	-- },

	-- NOTE: Neo Tree
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			"3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
		},
	},

	-- NOTE: Annotation
	{
		"danymat/neogen",
		lazy = true,
		config = function()
			require("neogen").setup({
				enabled = true,
			})
		end,
		dependencies = "nvim-treesitter/nvim-treesitter",
	},

	-- NOTE: FLASH
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		opts = {},
		keys = {
			{
				"s",
				mode = { "n", "x", "o" },
				function()
					require("flash").jump()
				end,
				desc = "Flash",
			},
			{
				"S",
				mode = { "n", "x", "o" },
				function()
					require("flash").treesitter()
				end,
				desc = "Flash Treesitter",
			},
			-- { "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
			-- { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
			-- { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
		},
	},

	-- -- NOTE: HOP
	-- {
	-- 	"phaazon/hop.nvim",
	-- 	branch = "v2",
	-- 	config = function()
	-- 		require("hop").setup()
	-- 	end,
	-- },

	-- -- NOTE: Leap
	-- {
	--   "ggandor/leap.nvim",
	--   name = "leap",
	--   config = function()
	--     require("leap").add_default_mappings()
	--   end,
	-- },

	-- -- BUG: Auto Save -- Can be an Issue
	-- {
	--   "Pocco81/auto-save.nvim",
	--   config = function()
	--     require("auto-save").setup()
	--   end,
	-- },

	-- NOTE: Wakatime
	{
		"wakatime/vim-wakatime",
	},

	-- -- NOTE: Context
	-- {
	--   "romgrk/nvim-treesitter-context",
	--   config = function()
	--     require("treesitter-context").setup {
	--       enable = true,   -- Enable this plugin (Can be enabled/disabled later via commands)
	--       throttle = true, -- Throttles plugin updates (may improve performance)
	--       max_lines = 0,   -- How many lines the window should span. Values <= 0 mean no limit.
	--       patterns = {     -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
	--         -- For all filetypes
	--         -- Note that setting an entry here replaces all other patterns for this entry.
	--         -- By setting the 'default' entry below, you can control which nodes you want to
	--         -- appear in the context window.
	--         default = {
	--           'class',
	--           'function',
	--           'method',
	--         },
	--       },
	--     }
	--   end
	-- },

	-- -- NOTE: Goto-preview
	-- {
	--   "rmagatti/goto-preview",
	--   config = function()
	--     require('goto-preview').setup {
	--       width = 120,              -- Width of the floating window
	--       height = 25,              -- Height of the floating window
	--       default_mappings = false, -- Bind default mappings
	--       debug = false,            -- Print debug information
	--       opacity = nil,            -- 0-100 opacity level of the floating window where 100 is fully transparent.
	--       post_open_hook = nil      -- A function taking two arguments, a buffer and a window to be ran as a hook.
	--       -- You can use "default_mappings = true" setup option
	--       -- Or explicitly set keybindings
	--       -- vim.cmd("nnoremap gpd <cmd>lua require('goto-preview').goto_preview_definition()<CR>")
	--       -- vim.cmd("nnoremap gpi <cmd>lua require('goto-preview').goto_preview_implementation()<CR>")
	--       -- vim.cmd("nnoremap gP <cmd>lua require('goto-preview').close_all_win()<CR>")
	--     }
	--   end
	-- },

	-- -- NOTE: Lsp rooter
	-- {
	--   "ahmedkhalf/lsp-rooter.nvim",
	--   event = "BufRead",
	--   config = function()
	--     require("lsp-rooter").setup()
	--   end,
	-- },

	-- -- NOTE: Aerial
	-- {
	--   'stevearc/aerial.nvim',
	--   opts = {},
	--   -- Optional dependencies
	--   dependencies = {
	--     "nvim-treesitter/nvim-treesitter",
	--     "nvim-tree/nvim-web-devicons"
	--   },
	-- },
}

lvim.builtin.telescope.on_config_done = function(telescope)
	pcall(telescope.load_extension, "frecency")
end
