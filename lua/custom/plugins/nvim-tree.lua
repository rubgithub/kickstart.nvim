return {
  -- require('nvim-tree').setup(),
  'nvim-tree/nvim-tree.lua',
  config = function()
    local nvimtree = require 'nvim-tree'
    nvimtree.setup {
      sort = {
        sorter = 'case_sensitive',
      },
    }
  end,
}
