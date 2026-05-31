return {
  -- HACK: Disables the select treesitter textobjects because the Dart treesitter parser is very inefficient.
  -- Hopefully this gets fixed and this block can be removed in the future.
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      local select = vim.tbl_get(opts, "textobjects", "select")
      if select then
        select.disable = select.disable or {}
        if not vim.tbl_contains(select.disable, "dart") then
          table.insert(select.disable, "dart")
        end
      end
    end,
  },

  -- Disable dartls from lspconfig - flutter-tools manages it
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.servers.dartls = nil
    end,
  },

  -- Flutter tools
  {
    "nvim-flutter/flutter-tools.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim",
    },
    ft = { "dart" },
    opts = {
      debugger = { enabled = true },
    },
  },

  -- Load telescope flutter extension
  {
    "nvim-telescope/telescope.nvim",
    optional = true,
    keys = {
      { "<leader>sF", "<cmd>Telescope flutter commands<cr>", desc = "Flutter Commands" },
    },
    opts = function(_, opts)
      pcall(require("telescope").load_extension, "flutter")
      return opts
    end,
  },
}
