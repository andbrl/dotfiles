local M = { }

--[[
    whichOrg: specify the org;
    terms: params of strings to search with
--]]
function M.search(whichOrg, ...)
    local terms = { ... }
    local query = table.concat(terms, "+")
    local url = "https://github.com/search?q=%3A"
        .. whichOrg
        .. "+"
        .. query
        .. "&type=code"

    vim.fn.jobstart({"open", url}, { detach = true })
end

return M

