return {
  "catgoose/nvim-colorizer.lua",
  event = "BufReadPre",
  opts = {
    filetypes = { "*" },
    options = {
      parsers = {
        names = { enable = true },
        tailwind = { enable = true },
      },
    },
  },
}
