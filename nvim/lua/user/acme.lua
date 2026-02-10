local M = {
  'misaelvillaverde/acme.nvim',
  dependencies = 'rktjmp/lush.nvim',
  priority = 1000,
}

function M.config()
    vim.cmd.colorscheme 'acme'
    vim.cmd 'set background=light'
end

return M
