local cmp = require("cmp")

cmp.setup({
	completion = {
		autocomplete = { cmp.TriggerEvent.TextChanged },
		keyword_length = 2,
	},
	mapping = cmp.mapping.preset.insert({
		["<C-Space>"] = cmp.mapping.complete(),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
	}),
	sources = {
		{ name = "nvim_lsp" },
		{ name = "buffer" },
	},
})
