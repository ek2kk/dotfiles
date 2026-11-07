return {
  "esmuellert/codediff.nvim",
  cmd = "CodeDiff",
  keys = {
    { "<leader>gd", "<cmd>CodeDiff<CR>", desc = "Review Git diff" },
    { "<leader>gf", "<cmd>CodeDiff history %<CR>", desc = "File history" },
  },
}
