return {
  -- Nonaktifkan explorer dari snacks.nvim
  {
    "folke/snacks.nvim",
    opts = {
      explorer = { enabled = false },
      picker = {
        sources = {
          files = { show_hidden = true, hidden = true },
        },
      },
    },
  },

  -- ==============================
  -- 🟢 Neo-tree (aktif sekarang)
  -- ==============================
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("neo-tree").setup({
        filesystem = {
          filtered_items = {
            visible = true,
            hide_dotfiles = false,
            hide_gitignored = false,
          },
        },
        default_component_configs = {
          icon = {
            folder_closed = "",
            folder_open = "",
            folder_empty = "",
            default = "",
          },
          git_status = {
            symbols = {
              added = "",
              modified = "",
              deleted = "",
              renamed = "",
              untracked = "★",
              ignored = "◌",
              unstaged = "",
              staged = "",
              conflict = "",
            },
          },
        },
        window = {
          position = "left",
          width = 30,
        },
      })

      -- Keymap buka Neo-tree
      vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>", { desc = "Toggle Neo-tree" })
    end,
  },

  -- ==========================================
  -- 🔵 Nvim-tree (nonaktif, bisa aktifin nanti)
  -- ==========================================
  -- {
  --   "nvim-tree/nvim-tree.lua",
  --   dependencies = {
  --     "nvim-tree/nvim-web-devicons",
  --   },
  --   config = function()
  --     require("nvim-tree").setup({
  --       view = {
  --         width = 30,
  --         side = "left",
  --       },
  --       renderer = {
  --         icons = {
  --           glyphs = {
  --             folder = {
  --               arrow_closed = "",
  --               arrow_open = "",
  --             },
  --           },
  --         },
  --       },
  --       filters = {
  --         dotfiles = false,
  --       },
  --       git = {
  --         enable = true,
  --         ignore = false,
  --       },
  --     })

  --     -- Keymap buka Nvim-tree
  --     vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle Nvim-tree" })
  --   end,
  -- },
}
