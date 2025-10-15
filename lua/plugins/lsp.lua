-- ~/.config/nvim/lua/plugins/lsp.lua
return {
  {
    "neovim/nvim-lspconfig",
    dependencies = { "jose-elias-alvarez/typescript.nvim" },
    config = function()
      local lspconfig = require("lspconfig")

      -- Python
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
            typescript = {
              inlayHints = { includeInlayParameterNameHints = "none" },
            },
            javascript = {
              inlayHints = { includeInlayParameterNameHints = "none" },
            },
          },
        },
      })

      -- 🌙 Lua
      lspconfig.lua_ls.setup({
        settings = {
          Lua = {
            runtime = { version = "LuaJIT" },
            diagnostics = { globals = { "vim" } },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
              checkThirdParty = false,
            },
            telemetry = { enable = false },
          },
        },
      })

      -- 💎 Prisma
      lspconfig.prismals.setup({})
    end,
  },
}
