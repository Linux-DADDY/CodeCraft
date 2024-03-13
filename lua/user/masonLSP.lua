require("mason-lspconfig").setup({
	ensure_installed = {
		"lua_ls",
		"rust_analyzer",
		"pyright",
		"tsserver",
		"denols",
		"emmet_ls",
		"cssls",
		"html",
		"jsonls",
		"nil_ls",
		"tailwindcss",
		"vimls",
	},
})
