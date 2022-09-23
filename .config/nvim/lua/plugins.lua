local packer = nil
local conf = require('config')

local function init()

  if packer == nil then
    packer = require('packer')
    packer.init({disable_commands = true})
  end

  local use = packer.use
  -- local use_rocks = packer.use_rocks
  packer.reset()

  -- Speed up loading Lua modules in Neovim to improve startup time
  use "lewis6991/impatient.nvim"

  -- Packer can manage itself as an optional plugin
  use {'wbthomason/packer.nvim', opt = true}

  use {"neovim/nvim-lspconfig",
    event = "BufReadPre *",
    config = function ()
	  require('lsp.lspconfig')
	  local signs = { Error = " ", Warn = " ", Hint = "ﴞ ", Info = " " }
	  for type, icon in pairs(signs) do
		local hl = "DiagnosticSign" .. type
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
	  end
    end
  }

--  use { "williamboman/mason.nvim",
--	cmd = {"Mason", "MasonInstall", "MasonUninstall", "MasonUninstallAll", "MasonLog"},
--	config = function ()
--	  require("mason").setup()
--	end
--  }

  use {'nvim-lua/popup.nvim', opt = true}
  use {'nvim-lua/plenary.nvim', opt = true}
  use {"glepnir/lspsaga.nvim",
	cmd = "Lspsaga",
    -- event = "BufReadPost *",
    config = conf.lspsaga
  }

  use {"hrsh7th/nvim-cmp",
    config = conf.nvim_cmp,
    requires = {
	  {'onsails/lspkind-nvim', opt=true},
	  'hrsh7th/cmp-nvim-lsp',
	  {'hrsh7th/cmp-buffer', event = 'InsertEnter *'},
	  {'hrsh7th/cmp-path', event = 'InsertEnter *'},
	  {'hrsh7th/cmp-calc', event = 'InsertEnter *'},
	  -- {
		-- 'tzachar/cmp-tabnine', event = 'InsertEnter *',
		-- run='./install.sh', config = conf.cmp_tabnine,
	  -- },
	  {'kristijanhusak/vim-dadbod-completion', ft = {'sql', 'mysql', 'plsql'}},
	  {'kdheepak/cmp-latex-symbols', ft = {'markdown', 'tex', 'text', 'plaintex'}},
	  -- {'hrsh7th/cmp-vsnip', event = 'InsertEnter *'},
	  {'hrsh7th/cmp-nvim-lsp-signature-help', event = 'InsertEnter *'},
	  {'saadparwaiz1/cmp_luasnip', event = 'InsertEnter *'},
	}
  }
  -- use {'hrsh7th/vim-vsnip',
  --   event = 'InsertEnter *',
  --   setup = conf.vim_vsnip
  -- }
  -- use {'hrsh7th/vim-vsnip-integ',
  --   event = 'InsertEnter *',
  --   after = 'vim-vsnip'
  -- }

  use {'L3MON4D3/LuaSnip',
    event = 'InsertEnter *',
	config = conf.luasnip,
    requires = {'rafamadriz/friendly-snippets'},
  }

  use { "ray-x/lsp_signature.nvim",
    event = 'BufReadPre *',
	config = function ()
	  require "lsp_signature".setup()
	end
  }

  -- UI
  -- use {"goolord/alpha-nvim",
  --   config = conf.alpha_nvim,
  -- }

  use {"glepnir/dashboard-nvim",
	config = conf.dashboard_nvim,
  }

  use {"glepnir/zephyr-nvim",
	lock = true,
	commit = '194a5ae5efed5559b095c182b1bc3d906ec70437',
    config= function()
      vim.cmd[[colorscheme zephyr]]
      vim.cmd[[highlight Normal ctermbg=NONE guibg=NONE]]
      vim.cmd[[highlight SignColumn ctermbg=NONE guibg=NONE]]
      vim.cmd[[highlight Cursorline cterm=bold ctermbg=black guibg=#48515E]]
      vim.cmd[[highlight MatchParen cterm=bold ctermfg=black ctermbg=grey guifg=black guibg=grey]]
      -- vim.cmd[[autocmd FileType markdown source $HOME/.config/nvim/config/markdown_theme.vim]]
      -- vim.cmd('highlight StatusLine ctermbg=NONE guibg=NONE')
      -- vim.cmd('highlight TabLineSel ctermbg=NONE guibg=NONE')
    end,
  }
  use {
    "projekt0n/github-nvim-theme",
  }
  use {
	"folke/tokyonight.nvim",
  }
  --use{"marko-cerovac/material.nvim",
	--config = function ()
	  ---- Example config in lua
	  --vim.g.material_style = 'oceanic'
	  --vim.g.material_italic_comments = true
	  --vim.g.material_italic_keywords = true
	  --vim.g.material_italic_functions = true
	  --vim.g.material_italic_variables = false
	  --vim.g.material_contrast = true
	  --vim.g.material_borders = true
	  --vim.g.material_disable_background = true
	  ----vim.g.material_custom_colors = { black = "#000000", bg = "#0F111A" }
	  ---- Load the colorscheme
	  --require('material').set()
	--end,
  --}

  use{'nvim-treesitter/nvim-treesitter',
    event = 'BufRead *',
    config = conf.nvim_treesitter
  }

  use {'romgrk/nvim-treesitter-context',
    event = 'BufRead *',
    after = 'nvim-treesitter',
	config = function ()
      vim.cmd[[highlight NormalFloat ctermbg=NONE guibg=NONE]]
	end,
  }

  use {'nvim-treesitter/nvim-treesitter-textobjects',
	opt = true,
  }
  -- use {'glepnir/galaxyline.nvim',
  --   -- config = [[require('statusline.moonline')]],
  --   config = [[require('statusline.clearline')]],
  --   requires = {'kyazdani42/nvim-web-devicons'}
  -- }

  use {'akinsho/nvim-bufferline.lua',
    config = conf.nvim_bufferline,
    after = 'zephyr-nvim',
	lock = true,
	commit = '3d77289b20a4ff1689da5ae891a485041e7fe607',
    requires = {'kyazdani42/nvim-web-devicons'}
  }

  use {'66RING/bookmarks-nvim',
    cmd = 'BookmarksToggle'
  }


  -- enhance
  use {"norcalli/nvim-colorizer.lua",
    ft = { 'html','css','sass','vim','typescript','typescriptreact'},
    cmd = "ColorizerToggle",
    config = conf.nvim_colorizer
  }
  use {'itchyny/vim-cursorword',
    event={'BufReadPre *', 'BufNewFile *'}
  }
  use {
    "folke/todo-comments.nvim",
    event = "BufReadPost *",
	config = conf.todo_comments
  }
  use {
	"levouh/tint.nvim",
    event = 'BufReadPost *',
	config = function()
	  require("tint").setup()
	end
  }


  use {'folke/trouble.nvim',
	config = function()
	  require("trouble").setup {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
		action_keys = {
		  previous = "i", -- preview item
		  next = "k" -- next item
		}
	  }
	end
  }
  -- use 'ldelossa/litee.nvim'
  -- use 'ldelossa/litee-calltree.nvim'
  use {'stevearc/dressing.nvim',
    event={'BufReadPre *', 'BufNewFile *'},
  }





  -- markdown
  use {'iamcco/markdown-preview.nvim',
    ft = {'markdown', 'pandoc.markdown', 'rmd'},
	setup = function ()
	  vim.g.mkdp_auto_close = 0
	  vim.g.mkdp_browser = os.getenv("BROWSER")
	end,
    run = 'sh -c "cd app && yarn install"'
  }

  use {'dhruvasagar/vim-table-mode',
    ft = 'markdown'
  }
  use {'dkarter/bullets.vim',
    ft = 'markdown',
    setup = function ()
      vim.g.bullets_enabled_file_types = {'markdown', 'text', 'gitcommit', 'scratch' }
    end
  }

  -- use {'vimwiki/vimwiki',
  --   ft = {"markdown", "wiki"},
  --   confit = function ()
	 --  vim.g.vimwiki_list = {
		-- {
		--   path = '~/Documents/Notes/',
		--   syntax = 'markdown',
		--   ext = '.md'
		-- }
	 --  }
  --   end
  -- }
  use {'tpope/vim-commentary',
    event = "BufRead *",
    setup = function ()
      vim.cmd [[autocmd FileType apache setlocal commentstring=#\ %s]]
      vim.cmd [[autocmd FileType vhdl setlocal commentstring=--\ %s]]
      vim.cmd [[autocmd FileType c,cpp setlocal commentstring=//\ %s]]
      vim.cmd [[autocmd FileType vue,jsx setlocal commentstring=<!--\ %s\ -->]]
    end
  }

  -- git
  use {'airblade/vim-gitgutter',
    event = "BufRead *",
    setup = function ()
      vim.g.gitgutter_signs = 0
      vim.g.gitgutter_map_keys = 0
      vim.g.gitgutter_override_sign_column_highlight = 0
      vim.g.gitgutter_preview_win_floating = 1

      vim.api.nvim_set_keymap('n', '<LEADER>gf', [[:GitGutterFold<CR>]], {noremap=true})
      vim.api.nvim_set_keymap('n', '<LEADER>gh', [[:GitGutterPreviewHunk<CR>]], {noremap=true})
      vim.api.nvim_set_keymap('n', '<LEADER>g-', [[:GitGutterPrevHunk<CR>]], {noremap=true})
      vim.api.nvim_set_keymap('n', '<LEADER>g=', [[:GitGutterNextHunk<CR>]], {noremap=true})
    end
  }
  -- use {'junegunn/gv.vim',
	-- cmd = "GV",
	-- requires = {"66RING/vim-fugitive"},
  -- }

  -- editor
  -- ghost text for browser
  use {'raghur/vim-ghost',
	cmd = 'GhostStart',
	run = ':GhostInstall',
  }

  use {'nvim-treesitter/playground',
	cmd = "TSPlaygroundToggle",
	config = function ()
	  require "nvim-treesitter.configs".setup {
		playground = {
		  enable = true,
		  disable = {},
		  updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
		  persist_queries = false, -- Whether the query persists across vim sessions
		  keybindings = {
			toggle_query_editor = 'o',
			toggle_hl_groups = 'h',
			toggle_injected_languages = 't',
			toggle_anonymous_nodes = 'a',
			toggle_language_display = 'H',
			focus_language = 'f',
			unfocus_language = 'F',
			update = 'R',
			goto_node = '<cr>',
			show_help = '?',
		  },
		}
	  }
	end
  }

  -- use {"Shatur/neovim-session-manager",
	-- -- cmd = {'SessionManager', 'SessionManager!'},
	-- -- config = conf.neovim_session_manager,
	-- setup = conf.neovim_session_manager
  -- }
  -- use {'windwp/nvim-spectre'}

  use {'junegunn/vim-easy-align' ,
    keys = '<Plug>(EasyAlign)',
    setup = function()
      vim.api.nvim_set_keymap('x', 'ga', [[<Plug>(EasyAlign)]], {})
      vim.api.nvim_set_keymap('n', 'ga', [[<Plug>(EasyAlign)]], {})
    end
  }

  -- enhance `.` command
  use {"tpope/vim-repeat"}
  use {'tpope/vim-surround',
    event = "BufRead *"
  } -- type ysiw' i sur in word '' or type cs'` to change 'word' to `word` or 'ds' del sur or 'yss'' for sur line h h-> 'h h'
  -- TODO cool https://github.com/phaazon/hop.nvim
  use {'easymotion/vim-easymotion',
    keys = '<Plug>(easymotion-sn)',
    setup = function()
      vim.g.EasyMotion_do_mapping = 'off'
      vim.api.nvim_set_keymap('n', 'ss', [[<Plug>(easymotion-sn)]], {})
    end
  }

  use {
	'tversteeg/registers.nvim',
  }
  use {
    'diepm/vim-rest-console',
	ft = {'rest'}
  }
  -- use {
	-- "NTBBloodbath/rest.nvim",
	-- config = function()
	  -- if not packer_plugins['plenary.nvim'].loaded then
		-- vim.cmd [[packadd plenary.nvim]]
	  -- end
	  -- require("rest-nvim").setup({
		-- -- Open request results in a horizontal split
		-- result_split_horizontal = false,
		-- -- Skip SSL verification, useful for unknown certificates
		-- skip_ssl_verification = false,
		-- -- Highlight request on run
		-- highlight = {
		  -- enabled = true,
		  -- timeout = 150,
		-- },
		-- result = {
		  -- -- toggle showing URL, HTTP info, headers at top the of result window
		  -- show_url = true,
		  -- show_http_info = true,
		  -- show_headers = true,
		-- },
		-- -- Jump to request line on run
		-- jump_to_request = false,
		-- env_file = '.env',
		-- custom_dynamic_variables = {},
		-- yank_dry_run = true,
		-- ensure_installed = { "http", "json" }
	  -- })
	-- end
  -- }

  -- use {
  --   'lewis6991/spellsitter.nvim',
  --   config = function()
  --     require('spellsitter').setup {
  --   	hl = 'SpellBad',
  --   	captures = {'comment'},  -- set to {} to spellcheck everything
  --     }
  --   end
  -- }


  -- fuzzy find
  -- -- telescope
 use {'nvim-telescope/telescope.nvim',
   cmd = {'Telescope', 'TelescopeFB'},
   config = conf.telescope,
   requires = {
	 {'nvim-telescope/telescope-fzy-native.nvim', opt = true},
	 {'nvim-telescope/telescope-file-browser.nvim', opt = true},
	 -- {'ahmedkhalf/project.nvim', opt = true, config=function()
		-- require("project_nvim").setup {}end },
   }
 }

  -- use {
  --   'kyazdani42/nvim-tree.lua',
	-- cmd = {"NvimTreeToggle", "NvimTreeFindFileToggle"},
  --   requires = {
  --     'kyazdani42/nvim-web-devicons', -- optional, for file icon
  --   },
	-- config = conf.nvim_tree
  -- }

  use {'mg979/vim-visual-multi',
    event = "BufRead *"
  }

  use {'voldikss/vim-translator',
    keys = '<Plug>TranslateW',
    setup = function ()
      vim.g.translator_default_engines={'bing', 'haici', 'youdao'}
      vim.api.nvim_set_keymap('n', 'ts', [[<Plug>TranslateW]], {silent=true})
      vim.api.nvim_set_keymap('v', 'ts', [[<Plug>TranslateWV]], {silent=true})
    end
  }

  -- use {'liuchengxu/vista.vim',
  --   cmd = 'Vista',
  --   setup = function ()
  --     -- vim.g.vista_icon_indent = {"╰─▸ ", "├─▸ "}
  --     vim.g.vista_default_executive = 'ctags'
  --     vim.g.vista_echo_cursor_strategy = 'echo'
  --     vim.g.vista_vimwiki_executive = 'markdown'
  --     vim.g.vista_disable_statusline = 1
  --     vim.g['vista#renderer#enable_icon'] = 1
  --     vim.g.vista_executive_for = {
  --         vimwiki =  'markdown',
  --         pandoc = 'markdown',
  --         markdown = 'toc',
  --         typescript = 'nvim_lsp',
  --         typescriptreact =  'nvim_lsp',
  --       }

  --     vim.api.nvim_set_keymap('n', 'T', [[:<C-u>Vista!!<CR>]], {noremap=true})
  --   end
  -- }

  use {'simrat39/symbols-outline.nvim',
	cmt = 'SymbolsOutline',
	config = conf.symbols_outline,
  }

  -- use {'Yggdroot/indentLine',
  --   event = 'BufReadPre *',
  --   setup = conf.indentLine
  -- }
  use {'lukas-reineke/indent-blankline.nvim',
    event = 'BufReadPre *',
    config = conf.indent_blankline_nvim
  }

  -- use {'Raimondi/delimitMate',
  --   event = 'InsertEnter *',
  -- }

  -- sreach
  use {'bronson/vim-visual-star-search',
    event = "BufRead *"
  }

  -- database
  use {'kristijanhusak/vim-dadbod-ui',
    cmd = {'DBUIToggle', 'DBUIAddConnection', 'DBUI', 'DBUIFindBuffer', 'DBUIRenameBuffer'} ,
    config = conf.vim_dadbod_ui,
    requires = {'tpope/vim-dadbod',opt = true}
  }

  use {'mattn/emmet-vim',
    event = 'InsertEnter *',
    -- ft = {'html','css','vue', 'wxml', 'js', 'jsx'},
    setup = conf.emmet
  }
  -- div>li>a  div+li+a*3  div>li>a^p  div>(li>a)^p
  -- V: div>li*  * means for each line
  -- div[hello="1"]{TEXT} or some css selector grammar
  -- ul>li#item$*5  different number at least one digit
  -- ul>li#item$@3*5  start counting from 3, -3 as  reverse
  -- emmet ket + d, D, n, N, m, k, j, /, a

  -- use {'AndrewRadev/tagalong.vim',
  --   ft = {"html", "vue", 'wxml'},
  --   setup = function ()
  --     vim.g.tagalong_additional_filetypes = {'vue', 'wxml'}
  --   end
  -- }

  use {'szw/vim-maximizer',
    cmd = "MaximizerToggle",
    setup = function()
      local opts = {silent=true, noremap=true}
      vim.api.nvim_set_keymap('n', '<C-z>', ":MaximizerToggle<CR>", opts)
      vim.api.nvim_set_keymap('i', '<C-z>', "<ESC>:MaximizerToggle<CR>", opts)
      vim.api.nvim_set_keymap('v', '<C-z>', "<C-o>:MaximizerToggle<CR>", opts)
    end
  }

end

local plugins = setmetatable({}, {
  __index = function(_, key)
    init()
    return packer[key]
  end
})

return plugins

