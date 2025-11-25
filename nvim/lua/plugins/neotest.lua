return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      {
        "fredrikaverpil/neotest-golang",
        -- version = "*",
        build = function()
          vim.system({ "go", "install", "gotest.tools/gotestsum@latest" }):wait()
        end,
      },
    },
    opts = {
      adapters = {
        -- "neotest-plenary",
        -- "neotest-go",
        -- "neotest-python",
        -- "neotest-rust",
        -- "neotest-zig",
        -- "neotest-gtest",
      },
    },
    config = function()
      local config = {
        runner = "gotestsum",
      }
      require("neotest").setup({
        adapters = {
          require("neotest-golang")(config),
        },
      })
    end,
  },
}
