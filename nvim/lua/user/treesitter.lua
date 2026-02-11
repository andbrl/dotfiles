local M = {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	lazy = false,
}

function M.config()
	local treesitter = require("nvim-treesitter")
	treesitter.install({ "go", "javascript", "c_sharp" })
	treesitter.setup({
		indent = { enable = true },
	})
end

return M
