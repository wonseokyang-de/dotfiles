-- import .vimrc
vim.cmd("source ~/.vimrc")

-- Map leader key to space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

if vim.g.vscode then
  USER_PROFILE = "vscode"
else
  USER_PROFILE = "dead-line"
end

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
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

require(USER_PROFILE .. ".lazy")
require(USER_PROFILE .. ".mappings")
