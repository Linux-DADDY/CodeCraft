local lvim_lsp = require("lvim.lsp")
local ts = require("typescript")

-- vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, border_opts)
-- configure tsserver server manually.
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "tsserver" })

local common_on_attach = lvim_lsp.common_on_attach
local common_capabilities = lvim_lsp.common_capabilities()

lvim.lsp.on_attach_callback = function(client, bufnr)
	if lvim.colorscheme == "gruvbox" then
		-- change coloring of errors so I can actually read them with gruvbox
		vim.cmd(":hi DiagnosticError guifg=#de5b64 guibg=#1C1C1C")
		vim.cmd(":hi DiagnosticWarn guifg=DarkOrange ctermfg=DarkYellow")
		vim.cmd(":hi DiagnosticInfo guifg=Cyan ctermfg=Cyan")
		vim.cmd(":hi DiagnosticHint guifg=White ctermfg=White")
	end
end

-- Typescript config using typescript.nvim
ts.setup({
	server = {
		root_dir = require("lspconfig.util").root_pattern(".git"),
		capabilities = common_capabilities,
		on_attach = common_on_attach,
	},
})

-- -- Keeping this here for reference
-- require("lvim.lsp.manager").setup("tsserver", {
--   root_dir = require('lspconfig.util').root_pattern('.git'),
--   on_attach = common_on_attach,
--   filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript" },
--   cmd = {
--     "typescript-language-server",
--     "--stdio",
--   },
-- })

-- local nvim_lsp = require("lspconfig")
-- nvim_lsp.denols.setup({
-- 	on_attach = on_attach,
-- 	root_dir = nvim_lsp.util.root_pattern("deno.json", "deno.jsonc"),
-- })

-- nvim_lsp.tsserver.setup({
-- 	on_attach = on_attach,
-- 	root_dir = nvim_lsp.util.root_pattern("package.json"),
-- 	single_file_support = false,
-- })

lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
	return server ~= "denols"
end, lvim.lsp.automatic_configuration.skipped_servers)

local formatters = require("lvim.lsp.null-ls.formatters")

formatters.setup({
	{
		name = "stylua",
		filetypes = {
			"lua",
		},
	},
})

formatters.setup({
	{
		name = "nixpkgs_fmt",
		filetypes = {
			"nix",
		},
	},
})

formatters.setup({
	{
		command = "prettierd",
		filetypes = {
			"css",
			"scss",
			"less",
			"html",
			"yaml",
			"markdown",
			"markdown_inline",
			"markdown.mdx",
			"graphql",
			"handlebars",
			"json",
		},
	},
})

local linters = require("lvim.lsp.null-ls.linters")
linters.setup({
	{
		command = "eslint_d",
		filetypes = { "javascript", "typescript", "typescriptreact", "json" },
	},
})

lvim.lsp.diagnostics.float.max_width = 120
lvim.lsp.diagnostics.float.focusable = true

vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "emmet-ls" })

local lsp_manager = require("lvim.lsp.manager")

lsp_manager.setup("emmet_ls", {
	-- filetypes = { "astro", "html", "javascriptreact", "typescriptreact", "css", "sass", "scss", "less" },
	filetypes = {
		"astro",
		"html",
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
		"css",
		"sass",
		"scss",
		"less",
	},
	on_init = require("lvim.lsp").common_on_init,
	capabilities = require("lvim.lsp").common_capabilities(),
})

require("mason-lspconfig").setup({
	ensure_installed = {
		"lua_ls",
		-- "stylua",
		"rust_analyzer",
		"pyright",
		"tsserver",
		"denols",
		"emmet_ls",
		"cssls",
		"html",
		"jsonls",
		"nil_ls",
		-- "nixpkgs-fmt",
		"tailwindcss",
		"vimls",
	},
})
