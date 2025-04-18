return {
  "pmizio/typescript-tools.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "neovim/nvim-lspconfig",
    "saghen/blink.cmp",
  },

  config = function(_, opts)
    opts.capabilities = capabilities

    opts.settings = vim.tbl_extend("force", opts.settings or {}, {
      publish_diagnostic_on = "change",
    })

    require("typescript-tools").setup(opts)
  end,

  opts = {},
}

