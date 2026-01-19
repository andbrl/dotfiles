local M = {
    "rcarriga/nvim-dap-ui",
    dependencies = {
        "mfussenegger/nvim-dap",
    },
}

function M.config()
    local dap = require("dap")
    local dapui = require("dapui")

    dapui.setup()

    local dapui_open = false

    dap.listeners.after.event_initialized["dapui_config"] = function()
        if not dapui_open then
            dapui.open()
            dapui_open = true
        end
    end

    dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
        dapui_open = false
    end

    dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
        dapui_open = false
    end
end

return M

