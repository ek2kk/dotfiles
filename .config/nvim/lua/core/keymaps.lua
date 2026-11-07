local keymap = vim.keymap

keymap.set("n", "<space><space>x", "<cmd>source %<CR>", { desc = "E[X]ecute the whole file (in .lua files)" })
keymap.set("n", "<space>x", ":.lua<CR>", { desc = "E[X]ecute current line (in .lua files)" })
keymap.set("v", "<space>x", ":lua<CR>", { desc = "E[X]ecute current selection (in .lua files)" })

keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

keymap.set("n", "<leader>d", function()
  Snacks.picker.diagnostics_buffer()
end, { desc = "Open [D]iagnostics" })

keymap.set("n", "<leader>yf", function()
  local path = vim.fn.expand("%:.")
  if path == "" then
    vim.notify("Buffer has no file name", vim.log.levels.WARN)
    return
  end
  local location = path .. ":" .. vim.fn.line(".")
  vim.fn.setreg("+", location)
  vim.notify("Yanked: " .. location)
end, { desc = "Yank relative path with line number" })

keymap.set("x", "<leader>cc", function()
  local path = vim.fn.expand("%:.")
  if path == "" then
    vim.notify("Buffer has no file name", vim.log.levels.WARN)
    return
  end
  local first, last = vim.fn.line("v"), vim.fn.line(".")
  if first > last then
    first, last = last, first
  end
  local lines = vim.api.nvim_buf_get_lines(0, first - 1, last, false)
  table.insert(lines, 1, ('```%s filename="%s" line=%d'):format(vim.bo.filetype, path, first))
  table.insert(lines, "```")
  vim.fn.setreg("+", table.concat(lines, "\n"))
  vim.api.nvim_input("<Esc>")
  vim.notify("Copied " .. (last - first + 1) .. " lines as codeblock")
end, { desc = "Copy selection as Markdown codeblock" })

keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
