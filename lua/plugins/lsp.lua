return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        tsserver = { enabled = false },
        ts_ls = { enabled = false },
        -- If you use vtsls (Vue TS LS), you can disable that too:
        vtsls = { enabled = false },
      }
    }
  }
}

