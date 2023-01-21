require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    side = "right",
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = false,
  },
})

vim.api.nvim_set_keymap('n', ' t', "<cmd>:NvimTreeToggle<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', ' T', "<cmd>:NvimTreeFindFile<CR>", { noremap = true, silent = true })
