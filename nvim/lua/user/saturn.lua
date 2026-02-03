local emoji = "🪐"
local pos = 0
local width = vim.api.nvim_win_get_width(0)

function _G.SaturnGoesBrrr()
    if vim.api.nvim_get_current_win() ~= vim.g.statusline_winid then
        return vim.fn.expand(vim.o.statusline)
    end

    local line = vim.fn.expand(vim.o.statusline)
    line = line .. string.rep(" ", width - vim.fn.strlen(line)-2)

    local chars = vim.fn.split(line, "\\zs")
    chars[pos + 1] = emoji

    return table.concat(chars)
end

vim.o.statusline = "%!v:lua.SaturnGoesBrrr()"

local timer = vim.loop.new_timer()
timer:start(
    0,
    1000,
    vim.schedule_wrap(function()
        -- needed here to avoid jitter
        pos = (pos + 1) % math.max(width, 1)
        vim.cmd("redrawstatus")
    end)
)


