return {
  "Saecki/crates.nvim",
  event = { "BufRead Cargo.toml" },
  opts = {
    src = {
      cmp = { enabled = true },
    },
  },
}
