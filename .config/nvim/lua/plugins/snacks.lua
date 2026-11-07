local vault = vim.env.OBSIDIAN_VAULT
  or (vim.env.HOME .. "/Library/Mobile Documents/iCloud~md~obsidian/Documents/ek-vault")
vault = vim.uv.fs_realpath(vault) or vim.fs.normalize(vault)

local function archive_note()
  local file = vim.fs.normalize(vim.api.nvim_buf_get_name(0))
  local archive = vault .. "/99-archive"

  if file:sub(1, #vault + 1) ~= vault .. "/" or file:sub(-3) ~= ".md" then
    vim.notify("Current buffer is not a vault note", vim.log.levels.ERROR)
    return
  end
  if file:sub(1, #archive + 1) == archive .. "/" then
    vim.notify("Note is already archived")
    return
  end

  local target = archive .. "/" .. vim.fs.basename(file)
  if vim.uv.fs_stat(target) then
    vim.notify("Archive already contains " .. vim.fs.basename(file), vim.log.levels.ERROR)
    return
  end

  vim.cmd.update()
  local ok, err = vim.uv.fs_rename(file, target)
  if not ok then
    vim.notify("Could not archive note: " .. err, vim.log.levels.ERROR)
    return
  end

  vim.api.nvim_buf_set_name(0, target)
  vim.notify("Archived to 99-archive")
end

return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    bigfile = { enabled = true },
    dashboard = { enabled = true },
    explorer = { enabled = true },
    indent = { enabled = true },
    input = { enabled = true },
    picker = { enabled = true },
    notifier = { enabled = true },
  },
  keys = {
    { "<leader>gg", function() Snacks.lazygit() end, desc = "LazyGit" },
    { "<leader>e", function() Snacks.explorer() end, desc = "File explorer" },
    { "<D-e>", function() Snacks.explorer() end, desc = "File explorer" },
    { "<leader>ff", function() Snacks.picker.files() end, desc = "Find files" },
    { "<leader>fr", function() Snacks.picker.recent() end, desc = "Recent files" },
    { "<leader>fs", function() Snacks.picker.grep() end, desc = "Grep" },
    { "<leader>fc", function() Snacks.picker.grep_word() end, desc = "Grep word" },
    { "<leader>fk", function() Snacks.picker.keymaps() end, desc = "Keymaps" },
    { "<leader>nf", function() Snacks.picker.files({ cwd = vault }) end, desc = "Find vault note" },
    { "<leader>ng", function() Snacks.picker.grep({ cwd = vault }) end, desc = "Grep vault" },
    { "<leader>ne", function() Snacks.explorer({ cwd = vault }) end, desc = "Explore vault" },
    { "<leader>na", archive_note, desc = "Archive vault note" },
    {
      "<leader>ni",
      function()
        local note = vault .. "/00-inbox/" .. os.date("%Y-%m-%d-%H%M") .. ".md"
        vim.cmd.edit(vim.fn.fnameescape(note))
      end,
      desc = "New inbox note",
    },
  },
}
