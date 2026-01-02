vim.lsp.enable("lua_ls")
vim.lsp.enable("clangd")
vim.lsp.enable("pyright")
vim.lsp.enable("rust_analyzer")
vim.lsp.enable("gopls")

vim.keymap.del("v", "in")
vim.keymap.del("o", "in")

vim.api.nvim_create_autocmd("LspAttach", {
    -- group = vim.api.nvim_create_augroup("SetupLSP", {}),
    callback = function(event)
      local client = assert(vim.lsp.get_client_by_id(event.data.client_id))

      vim.diagnostic.config({
        virtual_text = false,
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = '',
            [vim.diagnostic.severity.WARN] = '',
            [vim.diagnostic.severity.HINT] = '',
            [vim.diagnostic.severity.INFO] = '',
          },
        },
      })

      -- NOTE: enable by default setting
      vim.lsp.inlay_hint.enable()

      if client and client:supports_method 'textDocument/foldingRange' then
          local win = vim.api.nvim_get_current_win()
          vim.wo[win][0].foldexpr = 'v:lua.vim.lsp.foldexpr()'
      end

      vim.api.nvim_create_user_command('LspInfo', ':checkhealth vim.lsp', { desc = 'Alias to `:checkhealth vim.lsp`' })
      vim.api.nvim_create_user_command('LspLog', function()
        vim.cmd(string.format('tabnew %s', vim.lsp.log.get_filename()))
      end, {
        desc = 'Opens the Nvim LSP client log.',
      })
      vim.api.nvim_create_user_command('Format', function() vim.lsp.buf.format({async = true}) end, { desc = 'Code format.' })
      vim.api.nvim_create_user_command('HintOn', function() vim.lsp.inlay_hint.enable(true) end, {})
      vim.api.nvim_create_user_command('HintOff', function() vim.lsp.inlay_hint.enable(false) end, {})

      vim.keymap.set("n", "gd",         vim.lsp.buf.definition)
      -- vim.keymap.set("n", "gD",         function()
      --     local params = vim.lsp.util.make_position_params(0, "utf-8")
      --     vim.lsp.buf_request(0, "textDocument/definition", params, function(_, result, _, _)
      --         if not result or vim.tbl_isempty(result) then
      --             vim.notify("No definition found", vim.log.levels.INFO)
      --         else
      --             require("snacks").picker.lsp_definitions()
      --         end
      --     end)
      -- end, { buffer = event.buf, desc = "LSP: Goto Definition" })


      vim.keymap.set("n", "<LEADER>d",  vim.lsp.buf.hover)
      vim.keymap.set("n", "<LEADER>h",  vim.lsp.buf.hover)
      vim.keymap.set("n", "<LEADER>rn", vim.lsp.buf.rename)
      vim.keymap.set("n", "<LEADER>a",  vim.lsp.buf.code_action)
      -- vim.keymap.set("v", "<LEADER>a",  vim.lsp.buf.range_code_action)

      vim.keymap.set("n", "gs",         vim.lsp.buf.signature_help)
      vim.keymap.set("n", "grr",        "<cmd>Telescope lsp_references<CR>")
      vim.keymap.set("n", "<LEADER>-",  vim.diagnostic.goto_prev)
      vim.keymap.set("n", "<LEADER>=",  vim.diagnostic.goto_next)
      vim.keymap.set("n", "<LEADER>+",  vim.diagnostic.setloclist)
  end,
})

