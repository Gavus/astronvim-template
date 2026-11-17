-- This will run last in the setup process.
-- This is just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

local dap = require "dap"

dap.configurations.python = dap.configurations.python or {}
table.insert(dap.configurations.python, {
  name = "pytest:args",
  type = "python",
  request = "launch",
  module = "pytest",
  args = function()
    local input = vim.fn.input "Pytest arguments: "
    return vim.split(input, "%s+", { trimempty = true })
  end,
  console = "integratedTerminal",
  justMyCode = false,
})

table.insert(dap.configurations.python, {
  name = "pytest:file:args",
  type = "python",
  request = "launch",
  module = "pytest",
  args = function()
    local args = vim.split(vim.fn.input "pytest arguments: ", "%s+", { trimempty = true })
    table.insert(args, 1, vim.api.nvim_buf_get_name(0))
    return args
  end,
  console = "integratedTerminal",
  justMyCode = false,
})
