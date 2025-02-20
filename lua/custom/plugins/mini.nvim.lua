return {
  'echasnovski/mini.nvim',
  config = function()
    -- Your custom configuration for mini.nvim
    -- require('mini.comment').setup({
    --   options = {
    --     custom_commentstring = function()
    --       return '// %s'
    --     end,
    --   },
    -- })

    -- Add other mini.nvim modules and their configurations here
    require('mini.pairs').setup()
  end,
}
