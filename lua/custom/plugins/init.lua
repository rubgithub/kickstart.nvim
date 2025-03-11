-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

-- require("lspconfig").setup({
--   some_lsp_server = {
--     enabled = false, -- Disable a specific LSP server
--   },
-- })

require 'custom.core.options'
require 'custom.core.keymaps'

return {
  require 'kickstart.plugins.debug',
  -- require 'core.options',
}
