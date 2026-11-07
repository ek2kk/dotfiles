local keymap = vim.keymap

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    local opts = { buffer = ev.buf, silent = true }

    opts.desc = "Show LSP references"
    keymap.set("n", "gR", function()
      Snacks.picker.lsp_references()
    end, opts)

    opts.desc = "Go to declaration"
    keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

    opts.desc = "Show LSP definition"
    keymap.set("n", "gd", vim.lsp.buf.definition, opts)

    opts.desc = "Show LSP implementations"
    keymap.set("n", "gi", function()
      Snacks.picker.lsp_implementations()
    end, opts)

    opts.desc = "Show LSP type definitions"
    keymap.set("n", "gt", function()
      Snacks.picker.lsp_type_definitions()
    end, opts)

    keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

    opts.desc = "Smart rename"
    keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

    opts.desc = "Show buffer diagnostics"
    keymap.set("n", "<leader>D", function()
      Snacks.picker.diagnostics_buffer()
    end, opts)

    opts.desc = "Show line diagnostics"
    keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

    opts.desc = "Go to previous diagnostic"
    keymap.set("n", "[d", function()
      vim.diagnostic.jump({ count = -1, float = true })
    end, opts)

    opts.desc = "Go to next diagnostic"
    keymap.set("n", "]d", function()
      vim.diagnostic.jump({ count = 1, float = true })
    end, opts)

    opts.desc = "Show documentation for what is under cursor"
    keymap.set("n", "K", vim.lsp.buf.hover, opts)

    -- Set here, not globally: Words needs LSP, and the Python ftplugin has its own buffer-local ]] and [[
    opts.desc = "Next reference"
    keymap.set("n", "]]", function()
      Snacks.words.jump(vim.v.count1)
    end, opts)

    opts.desc = "Previous reference"
    keymap.set("n", "[[", function()
      Snacks.words.jump(-vim.v.count1)
    end, opts)

    opts.desc = "Restart LSP"
    keymap.set("n", "<leader>rs", "<cmd>LspRestart<CR>", opts)
  end,
})

local severity = vim.diagnostic.severity

vim.diagnostic.config({
  severity_sort = true,
  virtual_text = { spacing = 4, source = "if_many", prefix = "●" },
  signs = {
    text = {
      [severity.ERROR] = " ",
      [severity.WARN] = " ",
      [severity.HINT] = "󰠠 ",
      [severity.INFO] = " ",
    },
  },
})
