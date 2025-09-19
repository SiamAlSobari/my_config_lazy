return {
  "folke/snacks.nvim",
  opts = {
    explorer = {
      show_hidden = true,
      filters = {
        dotfiles = false,
        gitignore = false,
      },
      icons = {
        git = {
          unstaged = "",
          staged = "",
          unmerged = "",
          renamed = "",
          untracked = "★",
          deleted = "",
          ignored = "◌",
        },
      },
    },
    picker = {
      sources = {
        explorer = { ignored = true },
        files = { show_hidden = true, hidden = true },
      },
    },
  },
}
