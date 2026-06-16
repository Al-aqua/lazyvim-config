return {
  { "ellisonleao/gruvbox.nvim" },
  { "nyoom-engineering/oxocarbon.nvim" },
  { "EdenEast/nightfox.nvim" },
  { "vague-theme/vague.nvim" },
  { "sainnhe/everforest" },
  { "rebelot/kanagawa.nvim" },
  {
    "xiyaowong/transparent.nvim",
    lazy = false,
    opts = {
      groups = {
        "Normal",
      },
      extra_groups = {
        "NormalFloat",
        "NvimTreeNormal",
      },
    },
  },

  -- Configure LazyVim to load the Theme you want
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "carbonfox",
    },
  },
}
