-- vim.cmd [[packadd nvim-lspconfig]]
local lspconfig = require 'lspconfig'
local lsp_folder = "/home/ring/var/APPs/lsp"
local util = require 'lspconfig/util'

-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- use for nvim-cmp
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true


local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
  -- Mappings.
  local opts = { noremap=true, silent=true }
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gd', [[<cmd>lua vim.lsp.buf.definition()<CR>]], opts)
  buf_set_keymap('n', '<LEADER>h', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', '<LEADER>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<LEADER>a', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('v', '<LEADER>a', '<cmd>lua vim.lsp.buf.range_code_action()<CR>', opts)
  buf_set_keymap('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<LEADER>-', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', '<LEADER>=', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<LEADER>+', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

  vim.cmd [[command! Format lua vim.lsp.buf.formatting()]]
end


local servers = {
  'dockerls','bashls',
  'vuels', 'yamlls', 'vimls',
  'cssls'
}

for _,server in ipairs(servers) do
  lspconfig[server].setup {
    on_attach = on_attach
  }
end

lspconfig.jdtls.setup{
  cmd_env = {
	JDTLS_HOME = "/usr/share/java/jdtls",
  },
  cmd = {"jdtls"},
  on_attach = on_attach,
  root_dir = vim.loop.cwd,
 --  cmd = {
	-- "java",
	-- "-Declipse.application=org.eclipse.jdt.ls.core.id1",
	-- "-Dosgi.bundles.defaultStartLevel=4",
	-- "-Declipse.product=org.eclipse.jdt.ls.core.product",
	-- "-Dlog.level=ALL",
	-- "-noverify",
	-- "-Xmx1G",
	-- "-jar", "/usr/share/java/jdtls/plugins/org.eclipse.equinox.launcher_1.6.300.v20210813-1054.jar",
	-- "-configuration", "/usr/share/java/jdtls/config_linux",
	-- "-data", vim.fn.getcwd().."/workspace",
	-- "--add-modules=ALL-SYSTEM",
	-- "--add-opens java.base/java.util=ALL-UNNAMED",
	-- "--add-opens java.base/java.lang=ALL-UNNAMED"
 --  },
}


lspconfig.pyright.setup{
  on_attach = on_attach,
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        diagnosticSeverityOverrides = {
          reportMissingImports = 'none',
          reportUndefinedVariable = 'none',
          reportGeneralTypeIssues = 'none',
          reportMissingModuleSource = 'none',
        }
      },
      venvPath = os.getenv("VIRTUAL_ENV"),
    },
  }
}

-- lspconfig.pyls.setup {
--   enable = true,
--   plugins = {
--     pyls_mypy = {
--       enabled = true,
--       live_mode = false
--     }
--   },
--   on_attach = on_attach
-- }


lspconfig.tsserver.setup({
  cmd = {"typescript-language-server", "--stdio"},
  filetypes = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescriptreact",
    "typescript.tsx"
  },
  on_attach = on_attach
})


lspconfig.ccls.setup {
  on_attach = on_attach,
  root_dir = function (path)
  	return util.root_pattern('compile_commands.json', '.ccls', 'compile_flags.txt', '.git')(path) or vim.loop.cwd()
  end,
  init_options = {
	diagnostics = {
	  onOpen = -1,
	  onChange = -1,
	  onSave = -1,
	},
	cache = {
	  directory = os.getenv('HOME').."/.cache/.ccls-cache"
	},
  },
}

-- lspconfig.clangd.setup({
--   cmd = {
--     "clangd",
--     "--background-index",
--     "--enable-config",
--   },
--   on_attach = on_attach,
--   -- Required for lsp-status
--   -- init_options = {
--   --   clangdFileStatus = true
--   -- },
--   -- handlers = nvim_status.extensions.clangd.setup(),
--   -- capabilities = nvim_status.capabilities,
-- })


lspconfig.rls.setup {
  on_attach = on_attach,
  settings = {
    rust = {
      unstable_features = true,
      build_on_save = false,
      all_features = true,
    },
  },
}

lspconfig.gopls.setup {
  on_attach = on_attach,
  cmd = {"gopls","--remote=auto"},
  capabilities ={
    textDocument = {
      completion = {
        completionItem = {
          snippetSupport = true
        }
      }
    }
  },
  init_options = {
    usePlaceholders=true,
    completeUnimported=true,
  }
}


lspconfig.sumneko_lua.setup {
  on_attach = on_attach,
  cmd = {
    lsp_folder.."/lua-language-server/bin/lua-language-server",
    "-E",
    lsp_folder.."/lua-language-server/bin/main.lua"
  },
  root_dir = vim.loop.cwd,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = vim.split(package.path, ';'),
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = {
          [vim.fn.expand('$VIMRUNTIME/lua')] = true,
          [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
        },
      },
    },
  },
}



