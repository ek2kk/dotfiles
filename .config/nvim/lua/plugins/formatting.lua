return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        lua = { "stylua" },
        sh = { "shfmt" },
        python = {
          "ruff_organize_imports",
          "ruff_format",
        }, -- add "ruff_fix" to add autofixes
      },
      format_on_save = function(bufnr)
        if vim.b[bufnr].disable_autoformat then
          return
        end
        return {
          lsp_fallback = true,
          async = false,
          timeout_ms = 3000,
        }
      end,
    })

    vim.api.nvim_create_user_command("ToggleFormatter", function()
      vim.b.disable_autoformat = not vim.b.disable_autoformat
      vim.notify("Format on save " .. (vim.b.disable_autoformat and "disabled" or "enabled") .. " for this buffer")
    end, { desc = "Toggle format on save for current buffer" })

    vim.keymap.set({ "n", "v" }, "<leader>mp", function()
      conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      })
    end, { desc = "Format file or range (in visual mode)" })
  end,
}
