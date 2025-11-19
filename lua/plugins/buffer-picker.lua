return {
  {
    "akinsho/bufferline.nvim",
    keys = {
      -- Leader + b + b → pick a buffer visually
      {
        "<leader>bb",
        "<cmd>BufferLinePick<CR>",
        desc = "Pick Buffer (BufferLine)",
      },
    },
  },
}
