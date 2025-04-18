return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('lualine').setup {
      options = {
        icons_enabled = true,
        theme = 'tokyonight',
        disabled_filetypes = { 'neo-tree' },
      },
    }
  end
}
