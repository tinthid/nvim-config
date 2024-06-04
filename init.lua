local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local opts = {}

require("vim-options")
require("lazy").setup("plugins")

local configs = require("nvim-treesitter.configs")

configs.setup({
    ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "go", "heex", "javascript", "html", "rust" },
    sync_install = false,
    highlight = { enable = true },
    indent = { enable = true },
})
