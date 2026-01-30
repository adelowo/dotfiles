return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  lazy = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = true,
  keys = {
    { "<leader>hm", "<cmd>lua require('harpoon.mark').add_file()<cr>", desc = "Mark file with harpoon" },
    { "<leader>hr", "<cmd>lua require('harpoon.mark').rm_file()<cr>", desc = "Remove file with harpoon" },
    { "<leader>hn", "<cmd>lua require('harpoon.ui').nav_next()<cr>", desc = "Go to next harpoon mark" },
    { "<leader>hp", "<cmd>lua require('harpoon.ui').nav_prev()<cr>", desc = "Go to previous harpoon mark" },
    { "<leader>ha", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", desc = "Show harpoon marks" },
    { "<leader>h1", "<cmd> lua require('harpoon.ui').nav_file(1)<cr>", desc = "Harpoon first file" },
    { "<leader>h2", "<cmd> lua require('harpoon.ui').nav_file(2)<cr>", desc = "Harpoon second file" },
    { "<leader>h3", "<cmd> lua require('harpoon.ui').nav_file(3)<cr>", desc = "Harpoon third file" },
  },
}
