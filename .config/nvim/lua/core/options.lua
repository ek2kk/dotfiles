local opt = vim.opt

opt.termguicolors = true

opt.number = true
opt.relativenumber = true

opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

opt.wrap = true

opt.ignorecase = true
opt.smartcase = true

opt.cursorline = true

opt.splitright = true
opt.splitbelow = true

opt.clipboard = "unnamedplus"

opt.scrolloff = 10

opt.undofile = true

opt.inccommand = "split"

opt.confirm = true

opt.swapfile = false

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
