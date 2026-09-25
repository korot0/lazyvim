return {
  {
    "zenbones-theme/zenbones.nvim",
    dependencies = {
      "rktjmp/lush.nvim",
    },
    lazy = false,
    priority = 1000,

    init = function()
      vim.g.nordbones = {
        transparent_background = true,
      }
    end,
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "nordbones",
    },
  },
}
