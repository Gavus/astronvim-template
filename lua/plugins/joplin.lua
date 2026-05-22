---@type LazySpec
return {
  "happyeric77/joplin.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim",
  },
  config = function()
    require("joplin").setup {
      token_env = "JOPLIN_TOKEN",
      startup = {
        show_warnings = false,
      },
    }
  end,
}
