-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },
  -- import/override with your plugins folder
  { import = "astrocommunity.colorscheme.catppuccin" },
  { import = "astrocommunity.completion.copilot-lua-cmp" },
  { import = "astrocommunity.ai.copilotchat-nvim" },
  { import = "astrocommunity.editing-support.quick-scope" },
  { import = "astrocommunity.lsp.lsp-signature-nvim" },
  { import = "astrocommunity.markdown-and-latex.render-markdown-nvim" },
  { import = "astrocommunity.pack.bash" },
  { import = "astrocommunity.pack.cpp" },
  { import = "astrocommunity.pack.docker" },
  { import = "astrocommunity.pack.go" },
  { import = "astrocommunity.pack.python" },
  { import = "astrocommunity.pack.rust" },
  { import = "astrocommunity.recipes.vscode" },
  { import = "astrocommunity.syntax.vim-easy-align" },

  {
    "m4xshen/smartcolumn.nvim",
    opts = {
      colorcolumn = "80",
      custom_colorcolumn = {
        lua = "120",
        python = "132",
      },
      disabled_filetypes = { "help" },
    },
  },
}
