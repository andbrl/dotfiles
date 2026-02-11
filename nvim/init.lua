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

