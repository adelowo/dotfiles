return {
  -- add gruvbox
  { "ellisonleao/gruvbox.nvim" },

  { "dracula/vim" },
  { "shaunsingh/nord.nvim" },
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
