-- Nvim Config

-- Theme
vim.cmd("colorscheme nlxz")

-- History
vim.opt.undodir = os.getenv("HOME") .. "/.config/nvim/undodir"
vim.opt.undofile = true
vim.opt.undolevels = 1000
vim.opt.undoreload = 10000

-- Clipboard
vim.api.nvim_set_keymap('n', 'y', '"+y', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'y', '"+y', { noremap = true, silent = true })

-- Packer Install
local packer_bootstrap = false
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = true
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
end

-- Plugins
require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'norcalli/nvim-colorizer.lua'
end)

require'colorizer'.setup({
    '*';
})
