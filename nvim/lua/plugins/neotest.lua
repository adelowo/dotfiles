return {
  { "nvim-neotest/neotest-plenary" },
  {
    "nvim-neotest/neotest-go",
  },
  {
    "rouge8/neotest-rust",
  },
  {
    "lawrence-laz/neotest-zig"
  },
  {
    "nvim-neotest/neotest",
    opts = { adapters = { "neotest-plenary", "neotest-go", "neotest-python", "neotest-rust", "neotest-zig"} },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-zig")({
            dap = {
              adapter = "lldb",
            }
          }),
        }
      })
    end
  },
}
