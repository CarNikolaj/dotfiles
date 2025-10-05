return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "renerocksai/telekasten.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("telekasten").setup({
        home = vim.fn.expand("~/zettelkasten"),
  --      dailies = vim.fn.expand("~/zettelkasten/daily"),
        templates = vim.fn.expand("~/zettelkasten/templates"),
        template_new_note = "~/zettelkasten/templates/general.md",
  --      template_new_daily = "daily.md",
        extension = ".md",
        follow_creates_nonexisting = true,
        auto_set_filetype = false,
      })
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
    ensure_installed = {
      "vim", "lua", "vimdoc",
      "html", "css"
      },
    },
  },
}
