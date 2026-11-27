---@type LazySpec
return {
  "zbirenbaum/copilot.lua",
  -- Load eagerly so the Copilot LSP is available without opening a file (sidekick, checkhealth)
  event = "VeryLazy",
}
