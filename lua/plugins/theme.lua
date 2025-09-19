return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "night", -- ada: "storm", "moon", "night", "day"
      transparent = false,
    },
    config = function(_, opts)
      require("tokyonight").setup(opts)
      vim.cmd("colorscheme tokyonight")
    end,
  },
}

-- return {
--
-- {
--     "catppuccin/nvim",
--     name = "catppuccin",
--     lazy = false,
--     priority = 1000,
--     opts = {
--       flavour = "mocha", -- latte, frappe, macchiato, mocha
--       transparent_background = false,
--       term_colors = true,
--       integrations = {
--         cmp = true,
--         gitsigns = true,
--         nvimtree = true,
--         telescope = true,
--         -- plugin lain bisa ditambah di sini
--       },
--     },
--     config = function(_, opts)
--       require("catppuccin").setup(opts)
--       vim.cmd("colorscheme catppuccin")
--     end,
--   },
-- }
