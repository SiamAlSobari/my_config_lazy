--lsp config /plugin/lsp.lua

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

      -- 🌙 Lua (buat Neovim config & plugin development)
      lspconfig.lua_ls.setup({
        settings = {
          Lua = {
            runtime = {
              version = "LuaJIT", -- versi runtime Neovim
            },
            diagnostics = {
              globals = { "vim" }, -- biar 'vim' gak dianggap undefined
            },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true), -- biar kenal semua API nvim
              checkThirdParty = false, -- hindari prompt popup "need config"
            },
            telemetry = { enable = false },
          },
        },
      })
    end,
  },
}
