local emoji = "🪐"
local pos = 0

local function get_curr_buf_width()
    return vim.api.nvim_win_get_width(0)
end

function _G.saturn_goes_brrr()
    -- todo: figure out how to keep this scoped not to the active buffer only
	if vim.api.nvim_get_current_win() ~= vim.g.statusline_winid then
		return vim.fn.expand(vim.o.statusline)
	end

    local buf_width = get_curr_buf_width()
    local line = vim.fn.expand("%f")
    -- leave some room for the col/line chars
    line = line .. string.rep(" ", buf_width - #line - 25)
    line = line .. vim.fn.col(".")
    line = line .. ","
    line = line .. vim.fn.line(".")
    line = line .. string.rep(" ", buf_width - #line - 1)

	local chars = vim.fn.split(line, "\\zs")
	chars[pos] = emoji

	return table.concat(chars)
end

vim.o.statusline = "%!v:lua.saturn_goes_brrr()"

local timer = vim.loop.new_timer()
timer:start(
	0,
	100,
	vim.schedule_wrap(function()
		-- needed here to avoid jitter
		pos = (pos + 1) % math.max(get_curr_buf_width(), 1)
		vim.cmd("redrawstatus")
	end)
)
