-- Nvim Theme

local palette = {
    color0 = "#202020",
    color1 = "#ff1f48",
    color2 = "#2aa9A1",
    color3 = "#ff9f45",
    color4 = "#4548ff",
    color5 = "#8045ff",
    color6 = "#458fff",
    color7 = "#c4c6cd",
    color8 = "#404040",
    color9 = "#ff0000",
    color10 = "#00ff00",
    color11 = "#ffff00",
    color12 = "#0000ff",
    color13 = "#ff00ff",
    color14 = "#00ffff",
    color15 = "#ffffff",
}

vim.cmd('highlight clear')
vim.cmd('syntax reset')

vim.o.background = 'dark'
vim.g.colors_name = 'nlxz'
vim.opt.termguicolors = true
vim.opt.cursorline = true

vim.api.nvim_set_hl(0, 'Normal', { fg = palette.color7, bg = palette.color0 })
vim.api.nvim_set_hl(0, 'Cursor', { fg = palette.color0, bg = palette.color7 })
vim.api.nvim_set_hl(0, 'CursorLine', { bg = palette.color0 })
vim.api.nvim_set_hl(0, 'Visual', { bg = palette.color0 })
vim.api.nvim_set_hl(0, 'LineNr', { fg = palette.color8 })
vim.api.nvim_set_hl(0, 'Comment', { fg = palette.color8, italic = true })

vim.api.nvim_set_hl(0, 'Constant', { fg = palette.color3, bold = true })
vim.api.nvim_set_hl(0, 'String', { fg = palette.color2 })
vim.api.nvim_set_hl(0, 'Function', { fg = palette.color4, bold = true })
vim.api.nvim_set_hl(0, 'Identifier', { fg = palette.color3 })
vim.api.nvim_set_hl(0, 'Statement', { fg = palette.color2 })
vim.api.nvim_set_hl(0, 'PreProc', { fg = palette.color5 })
vim.api.nvim_set_hl(0, 'Type', { fg = palette.color2, bold = true })
vim.api.nvim_set_hl(0, 'Special', { fg = palette.color1 })

vim.api.nvim_set_hl(0, 'ColorColumn', { bg = palette.color0 })
vim.api.nvim_set_hl(0, 'Error', { fg = palette.color1, bg = 'NONE', bold = true })
vim.api.nvim_set_hl(0, 'Todo', { fg = palette.color3, bold = true })
vim.api.nvim_set_hl(0, 'Search', { fg = palette.color0, bg = palette.color3, bold = true })

vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        vim.api.nvim_set_hl(0, 'Normal', { bg = 'NONE' })
    end
})
