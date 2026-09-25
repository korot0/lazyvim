return {
  {
    "folke/which-key.nvim",
    opts = function(_, opts)
      -- change preset first
      opts.preset = "modern"
      -- ensure win table exists
      opts.win = opts.win or {}
      -- center horizontally
      opts.win.col = 0.50
      -- optional: set vertical position (e.g., near bottom)
      opts.win.row = 0.85
      return opts
    end,
  },
}
