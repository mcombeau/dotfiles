return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local mason_tool_installer = require("mason-tool-installer")

    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    mason_lspconfig.setup({
      -- list of servers for mason to install
      ensure_installed = {
        "ansiblels",
        "bashls",
        "bufls",
        "clangd",
        "cssls",
        "docker_compose_language_service",
        "dockerls",
        "gopls",
        "html",
        "intelephense",
        "jsonls",
        "lua_ls",
        "perlnavigator",
        "pyright",
        "tailwindcss",
        "terraformls",
        "vtsls",
      },
    })

    mason_tool_installer.setup({
      ensure_installed = {
        -- formatters
        "ruff",               -- python
        "gofumpt",            -- go
        "goimports",          -- go
        "markdown-toc",       -- markdown
        "markdownlint-cli2",  -- markdown
        "php-cs-fixer",       -- php
        "prettier",
        "shfmt",              -- bash
        "stylua",             -- lua
        -- linters
        "ansible-lint",       -- ansible
        "eslint_d",           -- js
        "hadolint",           -- docker
        "phpcs",              -- php
        "pylint",             -- python
        "tflint",             -- terraform
      },
    })
  end,
}
