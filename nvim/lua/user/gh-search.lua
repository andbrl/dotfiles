local M = { }

local function s(base_url, query)
    local url = base_url
        .. query
        .. "&type=code"
    vim.fn.jobstart({"open", url}, { detach = true })
end

function M.search(...)
    s("https://github.com/search?q=", table.concat({...}, "+"))
end

function M.search_with_org(whichOrg, ...)
    s("https://github.com/search?q=org%3A"..whichOrg.."+", table.concat({...}, "+"))
end

return M

