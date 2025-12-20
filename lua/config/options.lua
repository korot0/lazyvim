-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.number = false
vim.opt.relativenumber = true
-- Enable line wrapping
vim.o.wrap = true -- wrap long lines
vim.o.linebreak = true -- wrap at word boundaries
vim.o.showbreak = "→ " -- optional: show an arrow for wrapped lines

-- Disable cursor blinking globally
vim.opt.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait0-blinkon0-blinkoff0"

vim.g.root_spec = { "cwd" }

vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "*",
  callback = function()
    vim.opt_local.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait0-blinkon0-blinkoff0"
  end,
})
