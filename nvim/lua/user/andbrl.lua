local M = {
	dir = "~/dev/andbrl.nvim",
	name = "andbrl",
	lazy = false,
	priority = 1000,
	config = function()
		-- default to andbrl for now
		vim.cmd.colorscheme("andbrl")

		local toggled = false
		vim.api.nvim_create_user_command("ToggleColo", function()
			if not toggled then
				-- clear all cached modules
				for k in pairs(package.loaded) do
					if k:match("^andbrl") then
						package.loaded[k] = nil
					end
				end
				vim.cmd.colorscheme("andbrl")
			else
				vim.cmd.colorscheme("torte")
			end
			toggled = not toggled
		end, {})

		vim.keymap.set("n", "<F1>", ":ToggleColo<CR>", { desc = "Test coloscheme" })
	end,
}

return M
