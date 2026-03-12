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
vim.cmd("syntax off")

vim.o.termguicolors = false

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
  callback = function()
    vim.opt_local.expandtab = true
    vim.opt_local.shiftwidth = 2
    vim.opt_local.tabstop = 2
    vim.opt_local.softtabstop = 2
  end,
})

vim.api.nvim_create_user_command("Github", function(opts)
  local args = opts.fargs

  if #args < 2 then
    vim.notify("Usage: :Github <org> <term1> [term2] ...", vim.log.levels.ERROR)
    return
  end

  local org = args[1]
  table.remove(args, 1)

  require("user.gh-search").search(org, unpack(args))
end, {
  nargs = "+",
  complete = nil,
})
