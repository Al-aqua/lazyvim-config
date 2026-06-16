return {
  -- Dart treesitter parser + hack: disable textobjects for Dart (very inefficient parser)
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = vim.list_extend(opts.ensure_installed or {}, { "dart" })
      local select = vim.tbl_get(opts, "textobjects", "select")
      if select then
        select.disable = select.disable or {}
        if not vim.tbl_contains(select.disable, "dart") then
          table.insert(select.disable, "dart")
        end
      end
    end,
  },

  -- Dart formatting via dart_format
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        dart = { "dart_format" },
      },
    },
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
      debugger = { enabled = false },
    },
  },

  -- Telescope flutter extension
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
