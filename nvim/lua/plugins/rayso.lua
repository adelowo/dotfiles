return {
  "TobinPalmer/rayso.nvim",
  cmd = { "Rayso" },
  config = function()
    require("rayso").setup({
      options = {
        background = true, -- If the screenshot should have a background.
        dark_mode = true, -- If the screenshot should be in dark mode.
        theme = "vercel", -- Theme
      },
    })
  end,
}
