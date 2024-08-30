return {
  {
    "wuelnerdotexe/vim-astro",
    ft = "astro",
    init = function()
      vim.g.astro_typescript = "enable"
      vim.g.astro_stylus = "disable"
    end,
  },
}
