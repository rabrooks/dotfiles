return {
    -- "folke/tokyonight.nvim",
    -- lazy = false,
    -- priority = 1000,
    -- opts = {},
    --
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    config = function()
        vim.cmd.colorscheme 'catppuccin'
    end,
}
