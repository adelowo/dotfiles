return {
  "ray-x/go.nvim",
  dependencies = {
    "ray-x/guihua.lua",
    "neovim/nvim-lspconfig",
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    require("go").setup({
      lsp_cfg = {
        on_attach = function(client, bufnr)
          -- unmap Go.nvim's <leader>e as i have it set to snacks.nvim already
          pcall(vim.keymap.del, "n", "<leader>e", { buffer = bufnr })
        end,
        settings = {
          gopls = {
            buildFlags = { "-tags=cli,test,gencmd" },
          },
        },
      },
    })

    local format_sync_grp = vim.api.nvim_create_augroup("GoImport", {})
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*.go",
      callback = function()
        require("go.format").goimport()
      end,
      group = format_sync_grp,
    })
  end,
  event = { "CmdlineEnter" },
  ft = { "go", "gomod" },
  build = ':lua require("go.install").update_all_sync()',
  keys = {
    { "<leader>gaj", "<cmd>GoAddTag<cr>", desc = "Add json tags" },
    { "<leader>gam", "<cmd>GoAddTag mapstructure<cr>", desc = "Add mapstructure tags" },
    { "<leader>gae", "<cmd>GoAddTag env<cr>", desc = "Add env tags" },
    { "<leader>gay", "<cmd>GoAddTag yaml<cr>", desc = "Add YAML tags" },
    { "<leader>gasvr", "<cmd>GoAddTag validate:required<cr>", desc = "Add Swagger validate required tags" },
    { "<leader>gasvo", "<cmd>GoAddTag validate:optional<cr>", desc = "Add Swagger validate optional tags" },

    { "<leader>gim", "<cmd>GoImplements<cr>", desc = "Find implementions of this method" },
  },
}
