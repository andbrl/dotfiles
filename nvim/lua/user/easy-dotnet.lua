local M = {
	"GustavEikaas/easy-dotnet.nvim",
    dependencies = { "nvim-lua/plenary.nvim", 'nvim-telescope/telescope.nvim' },
}

function M.config()
    require("easy-dotnet").setup()

    vim.api.nvim_create_autocmd("FileType", {
      pattern = "cs",
      callback = function()
        vim.keymap.set("n", "<leader>tc", function()
          require("easy-dotnet").test_cursor()
        end, { buffer = true, desc = "Run test at cursor" })
      end,
    })
  end

return M
