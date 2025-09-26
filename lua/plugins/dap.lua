return {
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "theHamsta/nvim-dap-virtual-text",
            "rcarriga/nvim-dap-ui",
            "nvim-neotest/nvim-nio",
        },
        -- stylua: ignore
        keys = {
            { "<F5>", function() require("dap").continue() end, desc = "Run/Continue" },
            { "<F8>", function() require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, desc = "Breakpoint Condition" },
            { "<F9>", function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint" },
            { "<F10>", function() require("dap").step_over() end, desc = "Step Over" },
            { "<F12>", function() require("dap").step_out() end, desc = "Step Out" },
            { "<F11", function() require("dap").step_into() end, desc = "Step Into" },
            { "<leader>dC", function() require("dap").run_to_cursor() end, desc = "Run to Cursor" },
            { "<leader>dj", function() require("dap").down() end, desc = "Down" },
            { "<leader>dk", function() require("dap").up() end, desc = "Up" },
            { "<leader>ds", function() require("dap").session() end, desc = "Session" },
            { "<leader>dt", function() require("dap").terminate() end, desc = "Terminate" },
        },
        config = function()
            local dap = require("dap")
            local utils = require("dap.utils")

            vim.api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual" })

            dap.adapters = {
                ["pwa-node"] = {
                    type = "server",
                    host = "::1",
                    port = "${port}",
                    executable = {
                        command = "js-debug-adapter",
                        args = {
                            "${port}",
                        },
                    },
                },
            }

            dap.configurations.typescript = {
                {
                    name = "Launch file",
                    type = "pwa-node",
                    request = "launch",
                    program = "${file}",
                    cwd = "${workspaceFolder}",
                    skipFiles = { "node_modules/**" },
                },
                {
                    name = "Attach to Port 9229",
                    type = "pwa-node",
                    request = "attach",
                    port = 9229,
                    cwd = "${workspaceFolder}",
                    skipFiles = { "node_modules/**" },
                },
            }
        end,
    },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = { "nvim-neotest/nvim-nio" },
        -- stylua: ignore
        keys = {
          { "<leader>du", function() require("dapui").toggle({ }) end, desc = "Dap UI" },
          { "<leader>de", function() require("dapui").eval() end, desc = "Eval", mode = {"n", "v"} },
        },
        opts = {},
        config = function(_, opts)
            local dap = require("dap")
            local dapui = require("dapui")
            dapui.setup(opts)
            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open({})
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close({})
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close({})
            end
        end,
    },
}
