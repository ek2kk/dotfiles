return {
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("kanagawa").setup({
        transparent = true,
        theme = "dragon",
        background = { dark = "dragon" },
        colors = {
          theme = {
            all = { ui = { bg_gutter = "none", float = { bg = "none", bg_border = "none" } } },
          },
        },
      })
      vim.cmd.colorscheme("kanagawa-dragon")
    end,
  },
}
