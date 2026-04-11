return {
  "adalessa/laravel.nvim",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-neotest/nvim-nio",
  },
  ft = { "php", "blade" },
  event = {
    "BufEnter composer.json",
  },
  init = function()
    local ok, wk = pcall(require, "which-key")
    if ok then
      wk.add({
        { "<leader>fl", group = "Laravel" },
      })
    end
  end,
  keys = {
    {
      "<leader>fll",
      function()
        Laravel.pickers.laravel()
      end,
      desc = "Open Laravel Picker",
    },
    {
      "<c-g>",
      function()
        Laravel.commands.run("view:finder")
      end,
      desc = "Open View Finder",
    },
    {
      "<leader>fla",
      function()
        Laravel.pickers.artisan()
      end,
      desc = "Open Artisan Picker",
    },
    {
      "<leader>flt",
      function()
        Laravel.commands.run("actions")
      end,
      desc = "Open Actions Picker",
    },
    {
      "<leader>flr",
      function()
        Laravel.pickers.routes()
      end,
      desc = "Open Routes Picker",
    },
    {
      "<leader>flh",
      function()
        Laravel.run("artisan docs")
      end,
      desc = "Open Documentation",
    },
    {
      "<leader>flm",
      function()
        Laravel.pickers.make()
      end,
      desc = "Open Make Picker",
    },
    {
      "<leader>flc",
      function()
        Laravel.pickers.commands()
      end,
      desc = "Open Commands Picker",
    },
    {
      "<leader>flo",
      function()
        Laravel.pickers.resources()
      end,
      desc = "Open Resources Picker",
    },
    {
      "<leader>flp",
      function()
        Laravel.commands.run("command_center")
      end,
      desc = "Open Command Center",
    },
    {
      "<leader>flu",
      function()
        Laravel.commands.run("hub")
      end,
      desc = "Laravel Artisan hub",
    },
    {
      "gf",
      function()
        local ok, res = pcall(function()
          if Laravel.app("gf").cursorOnResource() then
            return "<cmd>lua Laravel.commands.run('gf')<cr>"
          end
        end)
        if not ok or not res then
          return "gf"
        end
        return res
      end,
      expr = true,
      noremap = true,
    },
  },
  opts = {
    features = {
      pickers = {
        provider = "snacks", -- "snacks | telescope | fzf-lua | ui-select"
      },
    },
  },
}
