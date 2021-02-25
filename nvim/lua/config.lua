local config = {}

function config.nvim_colorizer()
  vim.cmd [[packadd nvim-colorizer.lua]]
  require 'colorizer'.setup {
    css = { rgb_fn = true; };
    scss = { rgb_fn = true; };
    sass = { rgb_fn = true; };
    stylus = { rgb_fn = true; };
    vim = { names = false; };
    tmux = { names = false; };
    'javascript';
    'javascriptreact';
    'typescript';
    'typescriptreact';
    html = {
      mode = 'foreground';
    }
  }
end

function config.defx()
  vim.fn['defx#custom#option']('_', {
      floating_preview= 1,
      winwidth= 30,
      split= 'vertical',
      direction= 'topleft',
      columns= 'mark:indent:git:icons:filename:type:size:time',
      show_ignored_files= 0,
      root_marker= '[in]: '
  })

  vim.fn['defx#custom#column']('git', {
     indicators= {
       Modified  = '•',
       Staged    = '✚',
       Untracked = 'ᵁ',
       Renamed   = '≫',
       Unmerged  = '≠',
       Ignored   = 'ⁱ',
       Deleted   = '✖',
       Unknown   = '⁇'
     }
   })

  vim.fn['defx#custom#column']('mark', {
       readonly_icon= '',
       selected_icon= ''
  })
end

function config.emmet()
  vim.g.user_emmet_mode = "ivn"
  vim.g.user_emmet_leader_key = ","
end

function config.indentLine()
  vim.g.indentLine_enabled = 1
  vim.g.indentLine_char='¦'
  vim.g.indentLine_fileTypeExclude = {'defx', 'json', 'denite','startify','dbui','vista_kind','vista','coc-explorer','dashboard','chadtree', 'markdown'}
  vim.g.indentLine_concealcursor = 'inc'
  vim.g.indentLine_showFirstIndentLevel =1
end

function config.vim_vsnip()
  vim.g.vsnip_snippet_dir = os.getenv('HOME') .. "/.config/nvim/config/vsnips"

  local map_key = vim.fn.nvim_set_keymap
  local opts = {expr=true}
  map_key('i', '<C-e>', [[vsnip#expandable()  ? '<Plug>(vsnip-expand)' : '<C-e>']], opts)
  map_key('s', '<C-e>', [[vsnip#expandable()  ? '<Plug>(vsnip-expand)' : '<C-e>']], opts)

  map_key('s', '<C-l>', [[vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)' : '<C-l>']], opts)
  map_key('s', '<C-j>', [[vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)' : '<C-j>']], opts)
end

function config.lspsaga()
  local saga = require 'lspsaga'
  saga.init_lsp_saga{
    finder_action_keys = {
      open = '<enter>', vsplit = 'v',split = 's',quit = 'q'
    },
  }

  local map_key = vim.fn.nvim_set_keymap
  local opts = {silent=true, noremap=true}
  map_key('n', '<LEADER>rn', [[<cmd>lua require('lspsaga.rename').rename()<CR>]], opts)
  map_key('n', 'gd', [[<cmd>lua require'lspsaga.provider'.preview_definition()<CR>]], opts)
  map_key('n', 'gh', [[<cmd>lua require'lspsaga.provider'.lsp_finder()<CR>]], opts)
  map_key('n', '<LEADER>h', [[<cmd>lua require('lspsaga.hover').render_hover_doc()<CR>]], opts)
  map_key('n', '<LEADER>a', [[<cmd>lua require('lspsaga.codeaction').code_action()<CR>]], opts)
  map_key('v', '<LEADER>a', [[<cmd>'<,'>lua require('lspsaga.codeaction').range_code_action()<CR>]], opts)
  map_key('n', '<LEADER>-', [[<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>]], opts)
  map_key('n', '<LEADER>=', [[<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>]], opts)
  vim.cmd [[command! Format lua vim.lsp.buf.formatting()]]
end

function config.nvim_compe()
  vim.cmd [[packadd nvim-compe]]
  require'compe'.setup {
    enabled = true;
    autocomplete = true;
    debug = false;
    min_length = 1;
    preselect = 'disable';
    allow_prefix_unmatch = false;
    source = {
      path = true;
      buffer = true;
      calc = true;
      vsnip = true;
      nvim_lsp = true;
      nvim_lua = true;
      spell = true;
      tags = true;
    };
  }
  vim.api.nvim_command("autocmd FileType clap_input, markdown lua require'compe'.setup { enabled = false}")

end


return config
