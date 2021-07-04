local config = {}

--
-- enhance
--
function config.nvim_colorizer()
  -- vim.cmd [[packadd nvim-colorizer.lua]]
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

function config.nvim_treesitter()
  vim.api.nvim_command('set foldmethod=expr')
  vim.api.nvim_command('set foldexpr=nvim_treesitter#foldexpr()')
  require'nvim-treesitter.configs'.setup {
    highlight = {
      enable = true,
    },
    -- ensure_installed = 'all'
  }
end

function config.indentLine()
  vim.g.indentLine_enabled = 1
  vim.g.indentLine_char='¦'
  vim.g.indentLine_fileTypeExclude = {'defx', 'json', 'denite','startify','dbui','vista_kind','vista','coc-explorer','dashboard','chadtree', 'markdown'}
  vim.g.indentLine_concealcursor = 'inc'
  vim.g.indentLine_showFirstIndentLevel =1
end

function config.nvim_bufferline()
  require('bufferline').setup{
    options = {
      modified_icon = '',
      buffer_close_icon = '',
      show_buffer_close_icons = false,
      close_icon = "",
      mappings = true,
      always_show_bufferline = false,
      separator_style = {"", ""},
      numbers = "ordinal",
      number_style = "",
      -- view = "multiwindow",
    },
    highlights = {
      buffer_selected = {
          guifg = '#61AFEF',
          -- guifg = '#8be9fd',
          -- gui = "bold,italic"
          gui = "bold"
      },
    }
  }
  local map_key = vim.api.nvim_set_keymap
  local opts = {silent=true, noremap=true}
  map_key('n', '<LEADER>]', [[:BufferLineCycleNext<CR>]], opts)
  map_key('n', '<LEADER>[', [[:BufferLineCyclePrev<CR>]], opts)
  map_key('n', '<BS>', [[:lua if vim.v.count~=0 then require"bufferline".go_to_buffer(vim.v.count) else vim.cmd("buffer #")end<CR>]], {silent=true})
  map_key('n', 'r<BS>', [[:lua if vim.tbl_count(vim.fn.getbufinfo({buflisted=true}))>1 then vim.cmd("bd") end <CR>]], opts)
end


--
-- editor
--


function config.telescope()
  if not packer_plugins['plenary.nvim'].loaded then
    vim.cmd [[packadd plenary.nvim]]
    vim.cmd [[packadd popup.nvim]]
    vim.cmd [[packadd telescope-fzy-native.nvim]]
  end
  require('telescope').setup {
    defaults = {
	  layout_config = {
		prompt_position = 'top',
	  },
	  prompt_prefix = ' 🚀 ',
	  selection_caret = "🛸 ",
	  sorting_strategy = 'ascending',
      minimum_grep_characters = 2,
	  file_ignore_patterns = {".git.*"},
      file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
      grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
      qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,
      mappings = {
        i = {
          ["<esc>"] = require('telescope.actions').close,
          ["<C-j>"] = require('telescope.actions').move_to_top + require('telescope.actions').select_default + require('telescope.actions').center
        }
      }
    },
    extensions = {
        fzy_native = {
          override_generic_sorter = false,
          override_file_sorter = true,
        },
    }
  }
  require('telescope').load_extension('fzy_native')
end

function config.fzf_vim()
  vim.g.fzf_preview_window = {'right:60%', 'ctrl-/'}
  vim.g.fzf_layout = { window={ width=0.9, height=0.9 } }
  vim.cmd[[command! -bang -nargs=* Rgpwd call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, fzf#vim#with_preview({'dir': expand('%:p:h')}), <bang>0)]]
end

function config.dashboard()
  vim.g.dashboard_custom_header = {
    '',
    '',
	'⠀ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⠀⠀⣾⣷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ',
	'⠀ ⠀⠀⠀⠀⠀⠀⠀⠀⣀⡄⠤⢾⢀⣿⣿⣿⣿⡀⡗⠄⣄⡠⠀⠀⠀⠀⠀⠀⠀⠀⠀ ',
	'⠀ ⠀⠀⠀⠀⠀⡠⡇⠄⠀⣧⠀⣰⣿⣟⣟⣛⣿⣿⣆⠀⣼⠀⠁⠲⣆⠀⠀⠀⠀⠀⠀ ',
	'⠀ ⠀⠀⠀⡶⡁⠀⠈⣦⠒⠙⣾⣿⡿⢿⡏⢻⡟⢿⣿⣷⠋⠒⣼⠁⠀⢁⡦⡀⠀⠀⠀ ',
	'⠀⠀⠐⡴⣁⠁⢀⠿⣦⣀⢳⣿⣿⡿⡟⢻⡟⣿⡟⢿⣿⣷⣿⡞⣀⣴⠿⡀⠈⣀⢦⠂⠀ ',
	'⢀⠀⣄⡐⠈⣹⠷⣤⡈⣹⣿⢿⣎⢖⡹⢆⢹⡏⡸⢏⡠⣱⡿⣿⣎⢁⣤⠾⣏⠁⠂⣠⠀⡀',
	'⠀⠠⢁⠓⢶⢧⣤⡌⣹⣿⣟⢷⣵⣷⣾⣿⣿⣿⣿⣷⣾⣮⡾⣻⣿⣏⢡⣤⡼⡶⠚⡈⠆⠀',
	'⠥⡤⣤⣤⣼⣄⣐⣼⣿⣿⣿⣿⣿⢿⡿⢻⣿⣿⡟⣿⡿⣿⣿⣿⣿⣿⣧⣀⣠⣧⣤⣤⣥⠤',
	'⠀⡱⠀⠀⡇⢈⣽⣿⣿⣿⣟⠁⠀⠸⣧⠹⣿⣿⠏⣼⠇⠀⠈⣹⣿⣿⣿⣯⡁⢸⠀⠀⢎⠀',
	'⠒⢓⠛⠛⢻⣿⣿⠿⣗⠙⢿⣷⣤⢀⠙⠿⣤⣦⠾⠋⡀⣤⣾⣿⠋⣺⢿⣿⣿⡟⠛⠛⠚⠒',
	'⠀⠠⡈⢠⣾⣿⣿⡴⠚⡌⡉⡮⡻⠯⢿⣯⣦⣴⣽⡿⡽⢟⠵⠄⢥⠓⢦⣿⣿⣿⡄⢁⠀⠀',
	'⠈⠀⢡⣿⣿⣯⢉⣧⡶⠋⢶⡝⠉⠮⣱⣎⣸⣇⢱⡎⠵⢉⢨⡴⠙⢶⣼⡋⢽⣿⣿⡜⠀⠁',
	'⠀⣰⣿⣿⣾⣿⣿⣿⣿⡿⣿⣿⣿⣷⣿⣿⣿⣿⣯⣿⣾⣿⣿⣿⢶⣿⣿⣿⣿⣷⣿⣯⣄⠀',
	'⠀⠉⠉⠉⠙⣬⠉⠉⠉⡭⣉⢉⣭⠉⣭⡍⢩⡍⢩⣭⠉⣭⡉⣉⢭⠉⠉⠉⣥⠉⠈⠁⠉⠀',
	'⠀⠀⠀⠁⠀⠈⢤⠚⢀⠀⣽⠓⠠⣿⢤⣸⣇⡤⣿⠔⠚⣯⠀⡀⠓⡤⠁⠀⠈⠀⠀⠀⠀⠀',
	'⠀⠀⠀⠀⠀⠀⠁⠈⠑⡬⡅⠀⠠⠇⠀⢸⡇⠀⠸⠄⠀⣈⢧⠊⠉⠈⠀⠀⠀⠀⠀⠀⠀⠀',
	'⠀⠀⠀⠀⠀⠀⠀⠀⠀⠁⠀⠈⠙⠁⠉⠚⠓⠉⠀⠋⠀⠀⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
    '',
  }

  vim.cmd [[autocmd FileType dashboard set laststatus=0 | autocmd BufLeave <buffer> set laststatus=2]]
  vim.cmd [[autocmd FileType dashboard set showtabline=0 | autocmd BufLeave <buffer> set showtabline=2]]
  vim.cmd [[autocmd FileType dashboard nnoremap <silent><buffer> e :exec "set laststatus=2 \| enew"<CR>]]

  vim.g.dashboard_custom_section={
    empty_buffer= {
        description = {' Empty Buffer'},
        command= 'set laststatus=2 | enew' },
    find_history= {
        description= {'ﭯ History     '},
        command= 'Telescope oldfiles' },
    find_file= {
        description= {' File Browser'},
        command= 'Telescope file_browser hidden=true' },
  }
end


--
-- lang
--
function config.emmet()
  vim.g.user_emmet_mode = "ivn"
  vim.g.user_emmet_leader_key = ","
  vim.g.user_emmet_install_global = false
  if not packer_plugins['emmet-vim'].loaded then
    vim.cmd [[packadd emmet-vim]]
    vim.cmd [[autocmd FileType html,css,vue,wxml,js,jsx EmmetInstall]]
  end
end

function config.vim_vsnip()
  vim.g.vsnip_snippet_dir = os.getenv('HOME') .. "/.config/nvim/config/vsnips"

  local map_key = vim.api.nvim_set_keymap
  local opts = {expr=true}
  map_key('i', '<C-e>', [[vsnip#available()  ? '<Plug>(vsnip-expand-or-jump)' : '<C-e>']], opts)
  map_key('s', '<C-e>', [[vsnip#available()  ? '<Plug>(vsnip-expand-or-jump)' : '<C-e>']], opts)

  map_key('s', '<C-l>', [[vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)' : '<C-l>']], opts)
  map_key('s', '<C-j>', [[vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)' : '<C-j>']], opts)
end

function config.lspsaga()
  local saga = require 'lspsaga'
  saga.init_lsp_saga{
    finder_action_keys = {
      open = '<enter>', vsplit = 'v',split = 's',quit = 'q',
    },
  }

  local map_key = vim.api.nvim_set_keymap
  local opts = {silent=true, noremap=true}
  -- saga.buildin
  map_key('n', '<C-u>', [[<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>]], opts)
  map_key('n', '<C-d>', [[<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>]], opts)

  -- saga.personal
  map_key('n', '<LEADER>rn', [[<cmd>lua require('lspsaga.rename').rename()<CR>]], opts)
  map_key('n', 'gd', [[<cmd>lua require("utils.functions").smart_split('lua vim.lsp.buf.definition()')<CR>]], opts)
  map_key('n', 'gD', [[<cmd>lua require'lspsaga.provider'.preview_definition()<CR>]], opts)
  map_key('n', 'gh', [[<cmd>lua require'lspsaga.provider'.lsp_finder()<CR>]], opts)
  map_key('n', '<LEADER>h', [[<cmd>lua require('lspsaga.hover').render_hover_doc()<CR>]], opts)
  map_key('n', '<LEADER>a', [[<cmd>lua require('lspsaga.codeaction').code_action()<CR>]], opts)
  map_key('v', '<LEADER>a', [[<cmd>'<,'>lua require('lspsaga.codeaction').range_code_action()<CR>]], opts)
  map_key('n', '<LEADER>-', [[<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>]], opts)
  map_key('n', '<LEADER>=', [[<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>]], opts)
  vim.cmd [[command! Format lua vim.lsp.buf.formatting()]]
end

function config.nvim_compe()
  require'compe'.setup {
    enabled = true;
    autocomplete = true;
    debug = false;
    min_length = 1;
    preselect = 'disable';
    allow_prefix_unmatch = true;
    source = {
      path = true;
      buffer = true;
      calc = true;
      vsnip = true;
      nvim_lsp = true;
      nvim_lua = true;
      spell = false;
      tags = true;
    };
  }
  vim.api.nvim_command("autocmd FileType clap_input,markdown call compe#setup({ 'autocomplete': v:false }, 0)")
  local opts = {noremap=true, silent=true, expr=true}
  vim.api.nvim_set_keymap('i','<TAB>','v:lua.tab_complete()',opts)
  vim.api.nvim_set_keymap('i','<S-TAB>','v:lua.s_tab_complete()',opts)
  vim.api.nvim_set_keymap('i','<CR>',"compe#confirm('<CR>')",opts)
end

-- tool
function config.vim_dadbod_ui()
  local function load_dbs()
    local dbs_url = os.getenv("HOME").."/.db_url"
    local dbs = {}
    if vim.fn.filereadable(dbs_url) == 1 then
        local url_content = vim.fn.readfile(dbs_url)
        for _, item in pairs(url_content) do
          local line_content = vim.fn.split(item,",")
          dbs[line_content[1]] = line_content[2]
        end
        print(dbs.name)
        print(dbs.url)
        return dbs
    end
  end

  vim.g.db_ui_win_position = 'left'
  vim.g.db_ui_use_nerd_fonts = 1
  vim.g.db_ui_winwidth = 35
  vim.g.db_ui_save_location = os.getenv("HOME")..'/.cache/db_ui_save_location'
  vim.g.dbs = load_dbs()
end

return config
