return {
  "folke/snacks.nvim",
  opts = {
    explorer = {
      replace_netrw = true,
    },
    picker = {
      sources = {
        explorer = {
          layout = {
            layout = {
              width = 30,
              position = "left", -- opsional
            },
          },
          show_hidden = true,
          hidden = true,
        },
      },
    },
  },
}
