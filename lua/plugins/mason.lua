-- Customize Mason

---@type LazySpec
return {
  -- use mason-tool-installer for automatically installing Mason packages
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    -- overrides `require("mason-tool-installer").setup(...)`
    opts = {
      -- Make sure to use the names found in `:Mason`
      ensure_installed = {
        -- install language servers
        "bash-language-server",
        "clangd",
        "lemminx",
        "lua-language-server",
        "marksman",

        -- install linters
        "codespell",
        "flake8",
        "gitlint",
        "markdownlint",
        "misspell",
        "selene",
        "shellcheck",
        "shellharden",

        -- install formatters
        "autopep8",
        "beautysh",
        "prettier",
        "stylua",

        -- install debuggers
        "cpptools",
        "debugpy",

        -- install any other package
        "tree-sitter-cli",
      },
    },
  },
}
