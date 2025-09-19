-- ~/.config/nvim/lua/plugins/colorizer.lua
return {
  {
    "NvChad/nvim-colorizer.lua",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("colorizer").setup({
        filetypes = {
          "html",
          "css",
          "javascript",
          "typescript",
          "javascriptreact",
          "typescriptreact",
        },
        user_default_options = {
          tailwind = true, -- <== penting biar warna Tailwind keluar
        },
      })
    end,
  },
}
