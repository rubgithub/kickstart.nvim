-- vim.keymap.set('n', '<leader>w', ':w<CR>', { noremap = true, desc = 'Save File' })

vim.keymap.set('n', '<S-Tab>', ':tabnext<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-S-Tab>', ':tabprevious<CR>', { noremap = true, silent = true })

--#region nvim-tree
-- vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>', {
  noremap = true,
  silent = true,
  desc = 'Toggle NvimTree',
})
--#endregion
