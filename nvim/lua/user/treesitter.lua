local M = {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
	lazy = false,
}

function M.config()
    require "nvim-treesitter".install{ 'go', 'javascript' }
end

return M
