local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then 
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

vim.filetype = on
vim.filetype.add({
    extension = {
        apex = 'apex',
        cls = 'apex',
        soql = 'soql',
        sosl = 'sosl',
        trigger = 'apex',

    },
})

require("lazy").setup({
    spec = "tobi.plugins",
    change_detection = { notify = false}
})

