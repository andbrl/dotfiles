-- a configuration file for keybindings

-- base
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)
vim.keymap.set("n", "<leader>l", vim.cmd.nohlsearch)

-- telescope 
local telescope = require "telescope.builtin"
vim.keymap.set("n", "<C-p>", telescope.find_files, {})
vim.keymap.set("n", "<C-b>", telescope.buffers, {})
vim.keymap.set("n", "<C-g>", telescope.git_files, {})
vim.keymap.set("n", "<C-s>", telescope.live_grep, {})
vim.keymap.set("n", "<leader>r", telescope.lsp_references, {})

-- lsp
vim.keymap.set("n", "gi", vim.lsp.buf.implementation)
vim.keymap.set("n", "<C-Space>", vim.lsp.buf.code_action)

--easy-dotnet
-- todo: move this to setup inside the plugin configuration itself
local dotnet = require "easy-dotnet"
vim.keymap.set("n", "<leader>db", dotnet.build_solution_quickfix)
