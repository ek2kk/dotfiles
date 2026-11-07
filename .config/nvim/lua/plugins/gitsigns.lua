return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {},
  keys = {
    { "<leader>gb", "<cmd>Gitsigns blame_line<CR>", desc = "Blame current line" },
    { "<leader>gB", "<cmd>Gitsigns blame<CR>", desc = "Blame buffer" },
    { "<leader>gh", "<cmd>Gitsigns stage_hunk<CR>", desc = "Toggle stage hunk" },
  },
}
