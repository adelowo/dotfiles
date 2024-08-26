--- all custom plugins i build
return {
  {
    "adelowo/dockercomposelogs.nvim",
    config = function()
      require("dockercomposelogs").setup({})
    end,
    event = "VeryLazy",
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
  },
}
