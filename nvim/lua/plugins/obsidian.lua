return {
  "epwalsh/obsidian.nvim",
  version = "*",
  lazy = true,
  ft = "markdown",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    templates = {
      folder = "Templates",
    },
    workspaces = {
      {
        name = "god",
        path = "/Users/lanreadelowo/Library/Mobile Documents/iCloud~md~obsidian/Documents/god",
      },
    },
  },
}
