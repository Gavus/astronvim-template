---@type LazySpec
return {
  {
    "folke/snacks.nvim",
    config = function(_, opts)
      local snacks = require "snacks"
      local snacks_input = require("snacks.input").input
      snacks.setup(opts)
      vim.ui.input = snacks_input
      vim.ui.select = snacks.picker.select

      vim.schedule(function() vim.ui.input = snacks_input end)

      vim.api.nvim_create_autocmd("User", {
        pattern = "VeryLazy",
        callback = function() vim.ui.input = snacks_input end,
      })
    end,
    opts = {
      dashboard = { enabled = false },
      bigfile = { enabled = true },
      image = { enabled = false },
    },
  },
}
