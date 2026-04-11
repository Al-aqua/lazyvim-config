return {
  {
    "nvim-flutter/flutter-tools.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim",
    },
    ft = { "dart" },
    config = function()
      require("flutter-tools").setup({})
    end,
  },
}
