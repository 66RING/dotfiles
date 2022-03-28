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

  -- Packer can manage itself as an optional plugin
  use {'wbthomason/packer.nvim', opt = true}

  use {"neovim/nvim-lspconfig",
    event = "BufReadPre *",
    config = [[require('lsp.lspconfig')]]
  }

  -- use {"glepnir/lspsaga.nvim",
  --   event = "BufRead *",
  --   config = conf.lspsaga
  -- }

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
	  {'hrsh7th/cmp-vsnip', event = 'InsertEnter *'},
	  {'hrsh7th/cmp-nvim-lsp-signature-help', event = 'InsertEnter *'}
	}
  }
  use {'hrsh7th/vim-vsnip',
    event = 'InsertEnter *',
    setup = conf.vim_vsnip
  }
  use {'hrsh7th/vim-vsnip-integ',
    event = 'InsertEnter *',
    after = 'vim-vsnip'
  }

  -- use { "ray-x/lsp_signature.nvim",
  --   event = 'InsertEnter *',
	-- config = function ()
	  -- require "lsp_signature".setup()
	-- end
  -- }

  -- UI
  use {"glepnir/dashboard-nvim",
    config = conf.dashboard
  }

  use {"glepnir/zephyr-nvim",
    config= function()
      vim.cmd[[colorscheme zephyr]]
      vim.cmd[[highlight Normal ctermbg=NONE guibg=NONE]]
      vim.cmd[[highlight SignColumn ctermbg=NONE guibg=NONE]]
      vim.cmd[[highlight Cursorline cterm=bold ctermbg=black guibg=#48515E]]
      vim.cmd[[highlight MatchParen cterm=bold ctermfg=black ctermbg=grey guifg=black guibg=grey]]
      vim.cmd[[autocmd FileType markdown source $HOME/.config/nvim/config/markdown_theme.vim]]
      -- vim.cmd('highlight StatusLine ctermbg=NONE guibg=NONE')
      -- vim.cmd('highlight TabLineSel ctermbg=NONE guibg=NONE')
    end,
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
  -- use {'nvim-treesitter/nvim-treesitter-textobjects',
  --   after = 'nvim-treesitter'
  -- }
  -- use {'glepnir/galaxyline.nvim',
  --   -- config = [[require('statusline.moonline')]],
  --   config = [[require('statusline.clearline')]],
  --   requires = {'kyazdani42/nvim-web-devicons'}
  -- }

  use {'akinsho/nvim-bufferline.lua',
    config = conf.nvim_bufferline,
    after = 'zephyr-nvim',
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
  -- use {'romgrk/nvim-treesitter-context',
  --   event = 'BufRead *',
	-- config = function ()
  --     vim.cmd[[highlight NormalFloat ctermbg=NONE guibg=NONE]]
	-- end
  -- }





  -- markdown
  use {'iamcco/markdown-preview.nvim',
    ft = {'markdown', 'pandoc.markdown', 'rmd'},
	setup = function ()
	  vim.g.mkdp_auto_close = 0
	  vim.g.mkdp_browser = os.getenv("BROWSER")
	end,
    run = 'sh -c "cd app && yarn install"' }
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

  -- editor
  use {'junegunn/vim-easy-align' ,
    keys = '<Plug>(EasyAlign)',
    setup = function()
      vim.api.nvim_set_keymap('x', 'ga', [[<Plug>(EasyAlign)]], {})
      vim.api.nvim_set_keymap('n', 'ga', [[<Plug>(EasyAlign)]], {})
    end
  }
  use {'tpope/vim-surround',
    event = "BufRead *"
  } -- type ysiw' i sur in word '' or type cs'` to change 'word' to `word` or 'ds' del sur or 'yss'' for sur line h h-> 'h h'
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
	 {'nvim-lua/popup.nvim', opt = true},
	 {'nvim-lua/plenary.nvim', opt = true},
	 {'nvim-telescope/telescope-fzy-native.nvim', opt = true},
	 {'nvim-telescope/telescope-file-browser.nvim', opt = true},
   }
 }

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

  use {'liuchengxu/vista.vim',
    cmd = 'Vista',
    setup = function ()
      -- vim.g.vista_icon_indent = {"╰─▸ ", "├─▸ "}
      vim.g.vista_default_executive = 'ctags'
      vim.g.vista_echo_cursor_strategy = 'echo'
      vim.g.vista_vimwiki_executive = 'markdown'
      vim.g.vista_disable_statusline = 1
      vim.g['vista#renderer#enable_icon'] = 1
      vim.g.vista_executive_for = {
          vimwiki =  'markdown',
          pandoc = 'markdown',
          markdown = 'toc',
          typescript = 'nvim_lsp',
          typescriptreact =  'nvim_lsp',
        }

      vim.api.nvim_set_keymap('n', 'T', [[:<C-u>Vista!!<CR>]], {noremap=true})
    end
  }

  use {'Yggdroot/indentLine',
    event = 'BufReadPre *',
    setup = conf.indentLine
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

  use {'AndrewRadev/tagalong.vim',
    ft = {"html", "vue", 'wxml'},
    setup = function ()
      vim.g.tagalong_additional_filetypes = {'vue', 'wxml'}
    end
  }

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

