return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = { "hrsh7th/cmp-emoji" },
    opts = function(_, opts)
      local cmp = require("cmp")

      opts.experimental = { ghost_text = false }

      -- tambahin source emoji
      table.insert(opts.sources, { name = "emoji" })

      -- filter biar tsserver ga auto insert snippet argumen (code)
      opts.formatting = {
        format = function(entry, vim_item)
          if entry.source.name == "nvim_lsp" and entry.completion_item.insertTextFormat == 2 then
            -- cuma ambil label, buang snippet argumen
            vim_item.insertText = entry.completion_item.label
          end
          return vim_item
        end,
      }

      -- atur mapping <CR> biar gak auto expand args
      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<CR>"] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        }),
      })
    end,
  },
}
