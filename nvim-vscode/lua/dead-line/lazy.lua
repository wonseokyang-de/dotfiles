-- set lazy to available
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- inintialize lazy.nvim
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

-- import plugins from ./user/plugins/*
require("lazy").setup({
  {import = "dead-line.plugins"},
}, {
  checker = {
    enabled = true,
    notify = false,
  },
  change_detection = {
    notify = false,
  },
})
