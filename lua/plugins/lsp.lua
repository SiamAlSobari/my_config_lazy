return {
  -- pyright
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = {},

        -- HTML
        html = {
          filetypes = { "html", "htmldjango" },
        },

        -- TailwindCSS
        tailwindcss = {
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
        },

        -- Rust (rust-analyzer)
        rust_analyzer = {
          settings = {
            ["rust-analyzer"] = {
              cargo = { allFeatures = true },
              checkOnSave = {
                command = "clippy",
              },
              inlayHints = {
                lifetimeElisionHints = {
                  enable = true,
                  useParameterNames = true,
                },
                reborrowHints = { enable = true },
              },
            },
          },
        },
      },
    },
  },

  -- tsserver + typescript.nvim
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "jose-elias-alvarez/typescript.nvim",
      init = function()
        require("lazyvim.util").lsp.on_attach(function(_, buffer)
          vim.keymap.set("n", "<leader>co", "TypescriptOrganizeImports", { buffer = buffer, desc = "Organize Imports" })
          vim.keymap.set("n", "<leader>cR", "TypescriptRenameFile", { buffer = buffer, desc = "Rename File" })
        end)
      end,
    },
    opts = {
      servers = {
        tsserver = {
          settings = {
            typescript = {
              inlayHints = {
                parameterNames = { enabled = "none" },
                parameterTypes = { enabled = false },
                variableTypes = { enabled = false },
                propertyDeclarationTypes = { enabled = false },
                functionLikeReturnTypes = { enabled = false },
              },
            },
            javascript = {
              inlayHints = {
                parameterNames = { enabled = "none" },
                parameterTypes = { enabled = false },
                variableTypes = { enabled = false },
                propertyDeclarationTypes = { enabled = false },
                functionLikeReturnTypes = { enabled = false },
              },
            },
          },
        },
      },
      setup = {
        tsserver = function(_, opts)
          -- ⬇️ Matikan snippet support supaya ga auto isi (code)
          local capabilities = vim.lsp.protocol.make_client_capabilities()
          capabilities.textDocument.completion.completionItem.snippetSupport = false
          opts.capabilities = vim.tbl_deep_extend("force", opts.capabilities or {}, capabilities)

          require("typescript").setup({ server = opts })
          return true
        end,
      },
    },
  },

  -- typescript extra spec
  { import = "lazyvim.plugins.extras.lang.typescript" },
}
