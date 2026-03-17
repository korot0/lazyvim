-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.number = false
vim.opt.relativenumber = true

-- Enable line wrapping
vim.o.wrap = true -- wrap long lines
vim.o.linebreak = true -- wrap at word boundaries
vim.o.showbreak = "→ " -- optional: show an arrow for wrapped lines

-- Spell checker
vim.opt.spell = true
vim.opt.spelllang = "en_us"

vim.g.root_spec = { "cwd" }

vim.opt.guicursor =
  "n-v-c:block-blinkwait700-blinkon500-blinkoff500,i-ci-ve:ver25-blinkwait700-blinkon500-blinkoff500,r-cr:hor20,o:hor50"
