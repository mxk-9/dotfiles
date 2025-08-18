vl = vim.lsp

vl.enable('clangd')
vl.enable('gopls')
vl.enable('zls')
vl.enable('omnisharp')
vl.enable('lua_ls')
vl.enable('rust_analyzer')

vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	underline = true,
	update_in_insert = true,
})
