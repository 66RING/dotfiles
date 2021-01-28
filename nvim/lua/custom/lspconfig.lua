local lspconfig = require 'lspconfig'
local lsp_folder = "/home/ring/var/lsp"

lspconfig.ccls.setup{}

lspconfig.bashls.setup{}

lspconfig.vuels.setup{}

lspconfig.yamlls.setup{}

lspconfig.tsserver.setup{}

lspconfig.vimls.setup{}

lspconfig.cssls.setup{}

lspconfig.pyright.setup{}

lspconfig.gopls.setup {
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
  cmd = {
    lsp_folder.."/lua-language-server/bin/Linux/lua-language-server",
    "-E",
    lsp_folder.."/lua-language-server/main.lua"
  };
  settings = {
    Lua = {
      diagnostics = {
        enable = true,
        globals = {"vim"}
      },
      runtime = {version = "LuaJIT"},
      workspace = {
        library = vim.list_extend({[vim.fn.expand("$VIMRUNTIME/lua")] = true},{}),
      },
    },
  }
}

