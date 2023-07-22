return {
  { "nvim-neotest/neotest-plenary" },
  {
    "nvim-neotest/neotest",
    opts = { adapters = { "neotest-plenary", "neotest-go", "neotest-python", "neotest-rust" } },
  },
}
