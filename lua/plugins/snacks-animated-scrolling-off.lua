return {
  "folke/snacks.nvim",
  opts = {
    scroll = {
      enabled = true,
      animate = {
        duration = {
          step = 10,
          total = 100,
        },
        easing = "linear",
      },
      animate_repeat = {
        delay = 100,
        duration = {
          step = 5,
          total = 50,
        },
        easing = "linear",
      },
    },
  },
}
