require "opts"
require "launch"

spec("user.treesitter")
spec("user.telescope")
spec("user.lsp-zero")
spec("user.easy-dotnet")
spec("user.dap")
spec("user.nio")
spec("user.dap-ui")
spec("user.oil")
spec("user.acme")

require "plugin.lazy"
require "user.cmp"
require "keymaps"
require "user.saturn"

vim.api.nvim_create_autocmd("CursorHold", {
    callback = function()
        vim.diagnostic.open_float(nil, {
            focus = false,
            scope = "cursor",
        })
    end,
})

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client then
      client.server_capabilities.semanticTokensProvider = nil
    end
  end,
})

-- turn off syntax highlighting from treesitter
vim.treesitter.stop()
