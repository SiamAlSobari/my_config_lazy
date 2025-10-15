return {
  {
    "neovim/nvim-lspconfig",
    dependencies = { "jose-elias-alvarez/typescript.nvim" },
    config = function()
      local lspconfig = require("lspconfig")

      -- Pyright
      lspconfig.pyright.setup({})

      -- HTML
      lspconfig.html.setup({
        filetypes = { "html", "htmldjango" },
      })

      -- TailwindCSS
      lspconfig.tailwindcss.setup({
        filetypes = {
          "html",
          "javascript",
          "typescript",
          "javascriptreact",
          "typescriptreact",
          "vue",
          "svelte",
          "astro",
        },
      })

      -- Rust
      lspconfig.rust_analyzer.setup({
        settings = {
          ["rust-analyzer"] = {
            cargo = { allFeatures = true },
            checkOnSave = { command = "clippy" },
          },
        },
      })

      -- TypeScript / JavaScript
      require("typescript").setup({
        server = {
          on_attach = function(_, bufnr)
            local map = function(mode, lhs, rhs, desc)
              vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
            end
            map("n", "<leader>co", "TypescriptOrganizeImports", "Organize Imports")
            map("n", "<leader>cR", "TypescriptRenameFile", "Rename File")
          end,
          settings = {
            typescript = { inlayHints = { includeInlayParameterNameHints = "none" } },
            javascript = { inlayHints = { includeInlayParameterNameHints = "none" } },
          },
        },
      })
    end,
  },
}
