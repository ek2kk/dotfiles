local keymap = vim.keymap

keymap.set("n", "<space><space>x", "<cmd>source %<CR>", { desc = "E[X]ecute the whole file (in .lua files)" })
keymap.set("n", "<space>x", ":.lua<CR>", { desc = "E[X]ecute current line (in .lua files)" })
keymap.set("v", "<space>x", ":lua<CR>", { desc = "E[X]ecute current selection (in .lua files)" })

keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

keymap.set("n", "<leader>d", function()
  Snacks.picker.diagnostics_buffer()
end, { desc = "Open [D]iagnostics" })

keymap.set("i", "jj", "<ESC>")

keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
