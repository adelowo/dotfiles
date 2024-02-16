return {
  "epwalsh/obsidian.nvim",
  version = "*",
  lazy = true,
  ft = "markdown",
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  event = {
    -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
    "BufReadPre ~/Library/Mobile/Documents/iCloud-md-obsidian/Documents/god/**.md",
    "BufNewFile BufReadPre ~/Library/Mobile/Documents/iCloud-md-obsidian/Documents/god/**.md",
  },
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",
  },
  opts = {
    workspaces = {
      {
        name = "god",
        path = "~/Library/Mobile/Documents/iCloud-md-obsidian/Documents/god",
      },
    },

    -- see below for full list of options 👇
  },
}
