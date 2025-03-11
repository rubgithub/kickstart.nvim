-- -- Lista de todos os servidores LSP que queremos configurar
-- local servers_list = {
--   'ruff',
-- }
--
-- -- Carrega as configurações de todos os servidores
-- local servers = {}
--
-- for _, server_name in ipairs(servers_list) do
--   local ok, config = pcall(require, 'custom.lsp.servers.' .. server_name)
--   if ok then
--     -- print(config)
--     -- win.Sleep(1000)
--     servers[server_name] = config
--   else
--     -- Configuração vazia como fallback se o arquivo não existir
--     servers[server_name] = {}
--   end
-- end
--
-- return servers

local servers = {
  lua_ls = {
    -- cmd = {...},
    -- filetypes { ...},
    -- capabilities = {},
    settings = {
      Lua = {
        runtime = { version = 'LuaJIT' },
        workspace = {
          checkThirdParty = false,
          -- Tells lua_ls where to find all the Lua files that you have loaded
          -- for your neovim configuration.
          library = {
            '${3rd}/luv/library',
            unpack(vim.api.nvim_get_runtime_file('', true)),
          },
          -- If lua_ls is really slow on your computer, you can try this instead:
          -- library = { vim.env.VIMRUNTIME },
        },
        completion = {
          callSnippet = 'Replace',
        },
        telemetry = { enable = false },
        diagnostics = { disable = { 'missing-fields' } },
      },
    },
  },
  pylsp = {
    settings = {
      pylsp = {
        plugins = {
          pyflakes = { enabled = false },
          pycodestyle = { enabled = false },
          autopep8 = { enabled = false },
          yapf = { enabled = false },
          mccabe = { enabled = false },
          pylsp_mypy = { enabled = false },
          pylsp_black = { enabled = false },
          pylsp_isort = { enabled = false },
        },
      },
    },
  },
  -- basedpyright = {
  --   -- Config options: https://github.com/DetachHead/basedpyright/blob/main/docs/settings.md
  --   settings = {
  --     basedpyright = {
  --       disableOrganizeImports = true, -- Using Ruff's import organizer
  --       disableLanguageServices = false,
  --       analysis = {
  --         ignore = { '*' },                 -- Ignore all files for analysis to exclusively use Ruff for linting
  --         typeCheckingMode = 'off',
  --         diagnosticMode = 'openFilesOnly', -- Only analyze open files
  --         useLibraryCodeForTypes = true,
  --         autoImportCompletions = true,     -- whether pyright offers auto-import completions
  --       },
  --     },
  --   },
  -- },
  ruff = {
    -- Notes on code actions: https://github.com/astral-sh/ruff-lsp/issues/119#issuecomment-1595628355
    -- Get isort like behavior: https://github.com/astral-sh/ruff/issues/8926#issuecomment-1834048218
    commands = {
      RuffAutofix = {
        function()
          vim.lsp.buf.execute_command {
            command = 'ruff.applyAutofix',
            arguments = {
              { uri = vim.uri_from_bufnr(0) },
            },
          }
        end,
        description = 'Ruff: Fix all auto-fixable problems',
      },
      RuffOrganizeImports = {
        function()
          vim.lsp.buf.execute_command {
            command = 'ruff.applyOrganizeImports',
            arguments = {
              { uri = vim.uri_from_bufnr(0) },
            },
          }
        end,
        description = 'Ruff: Format imports',
      },
    },
  },
  -- jsonls = {},
  -- sqlls = {},
  -- terraformls = {},
  -- yamlls = {},
  -- bashls = {},
  -- dockerls = {},
  -- docker_compose_language_service = {},
  -- tailwindcss = {},
  -- graphql = {},
  -- html = { filetypes = { 'html', 'twig', 'hbs' } },
  -- cssls = {},
  -- ltex = {},
  -- texlab = {},
}
return servers
