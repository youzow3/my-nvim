-- manual LSP setup

vim.lsp.config["clangd"] = {
	cmd = {'clangd'},
	-- C: c
	-- C++: cc, cpp
	-- CUDA: cu
	filetypes = {"c", "cc", "cpp", "cu"},
	root_markers = {".git", {"meson.build", "CMakeLists.txt"}}
}

vim.lsp.config["python-lsp-server"] = {
	cmd = {"pylsp"},
	filetypes = {"python"},
	root_markers = {".git", ".venv"}
}

vim.lsp.config["marksman"] = {
	cmd = {"marksman", "server"},
	filetypes = {"markdown"},
}

vim.lsp.enable("clangd")
vim.lsp.enable("python-lsp-server")
vim.lsp.enable("marksman")

return {
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/vim-vsnip",
			"hrsh7th/cmp-vsnip",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/nvim-cmp"
		},
		config = function()
			local cmp = require("cmp")
			cmp.setup({
				expand = function(args)
					vim.fn["vsnip#anonymous"](args.body)
				end,
				mapping = cmp.mapping.preset.insert({
					['<C-b>'] = cmp.mapping.scroll_docs(-4),
					['<C-f>'] = cmp.mapping.scroll_docs(4),
					['<C-v>'] = cmp.mapping.complete(),
					['<C-e>'] = cmp.mapping.abort(),
					['<CR>'] = cmp.mapping.confirm({ select = true })
				}),
				sources = cmp.config.sources({
					{ name = 'nvim_lsp' },
					{ name = 'buffer' }
				})
			})
		end
	},
	{
		"hrsh7th/vim-vsnip",
		"hrsh7th/cmp-vsnip",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/nvim-cmp"
	}
}

