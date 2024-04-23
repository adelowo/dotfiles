return {
  { "ellisonleao/gruvbox.nvim" },
  { "dracula/vim" },
  { "shaunsingh/nord.nvim" },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
      })
    end,
  },
  {
    "loctvl842/monokai-pro.nvim",
    config = function()
      require("monokai-pro").setup()
    end,
  },
  {
    "rebelot/kanagawa.nvim",
    config = function()
      local my_colors = {
        waveBlue1 = "#363646",
        sumiInk1 = "#16161D",
        roninYellow = "#F5DD8E",
      }

      require("kanagawa").setup({
        dimInactive = true,
        colors = {
          palette = my_colors,
          theme = {
            all = {
              ui = {
                bg_gutter = "none",
              },
            },
          },
        },
        functionStyle = { bold = true },
        typeStyle = { bold = true },
        overrides = function(colors)
          local theme = colors.theme
          return {
            TelescopeTitle = { fg = theme.ui.special, bold = true },
            TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
            TelescopePreviewNormal = { bg = theme.ui.bg_dim },

            Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 },
            PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
            PmenuSbar = { bg = theme.ui.bg_m1 },
            PmenuThumb = { bg = theme.ui.bg_p2 },
          }
        end,
      })

      -- vim.api.nvim_set_hl
      vim.api.nvim_set_hl(0, "@markdownUrl", { underline = true, italic = true })
      vim.cmd([[colorscheme kanagawa-wave]])
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "kanagawa",
    },
  },
}
