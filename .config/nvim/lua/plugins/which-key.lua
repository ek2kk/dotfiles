return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {},
  config = function(_, opts)
    require("which-key").setup(opts)

    -- which-key reads keys after a prefix with getcharstr(), which skips 'langmap'
    local state = require("which-key.state")
    local getchar = state.getchar
    local to_en = require("core.layout").to_en()
    state.getchar = function()
      local ok, char = getchar()
      return ok, ok and to_en[char] or char
    end
  end,
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
}
