return {
  -- add gruvbox
  { "ellisonleao/gruvbox.nvim" },

  { "dracula/vim" },
  { "shaunsingh/nord.nvim" },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "habamax",
    },
  },
}
