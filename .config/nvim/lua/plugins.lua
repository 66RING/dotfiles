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

  use {'nvim-lua/popup.nvim', opt = true}
  use {'nvim-lua/plenary.nvim', opt = true}
  use {"glepnir/lspsaga.nvim",
    event = "BufRead *",
	requires = { {"nvim-tree/nvim-web-devicons"} },
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
      -- TODO:
	  -- {'hrsh7th/cmp-nvim-lsp-signature-help', event = 'InsertEnter *'},
	  {'saadparwaiz1/cmp_luasnip', event = 'InsertEnter *'},
	  -- { "zbirenbaum/copilot-cmp", after = { "copilot.lua" }, config = function() require("copilot_cmp").setup() end }
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

  -- TODO:
  -- use { "ray-x/lsp_signature.nvim",
  --   event = 'BufReadPre *',
	-- config = function ()
	  -- require "lsp_signature".setup()
	-- end
  -- }

  -- UI
  use {"goolord/alpha-nvim",
    event = 'VimEnter',
    config = conf.alpha_nvim,
	requires = {'nvim-tree/nvim-web-devicons'},
  }

  -- use {"glepnir/dashboard-nvim",
  --   event = 'VimEnter',
	-- config = conf.dashboard_nvim,
	-- requires = {'nvim-tree/nvim-web-devicons'},
  -- }

  -- colorscheme
  use {"66RING/zephyr-nvim",
    config= function()
      vim.cmd[[colorscheme zephyr]]
      -- bg = NONE to set background transparent
      vim.cmd[[highlight Normal ctermbg=NONE guibg=NONE]]
      vim.cmd[[highlight SignColumn ctermbg=NONE guibg=NONE]]
      vim.cmd[[highlight Cursorline cterm=bold ctermbg=black guibg=#48515E]]
      vim.cmd('highlight StatusLine ctermbg=NONE guibg=NONE')
      vim.cmd('highlight TabLineSel ctermbg=NONE guibg=NONE')

      vim.cmd('highlight DapUIPlayPauseNC ctermbg=NONE guibg=NONE')
      vim.cmd('highlight DapUIRestartNC ctermbg=NONE guibg=NONE')
      vim.cmd('highlight DapUIStopNC ctermbg=NONE guibg=NONE')
      vim.cmd('highlight DapUIUnavailableNC ctermbg=NONE guibg=NONE')
      vim.cmd('highlight DapUIStepOverNC ctermbg=NONE guibg=NONE')
      vim.cmd('highlight DapUIStepIntoNC ctermbg=NONE guibg=NONE')
      vim.cmd('highlight DapUIStepBackNC ctermbg=NONE guibg=NONE')
      vim.cmd('highlight DapUIStepOutNC ctermbg=NONE guibg=NONE')

      vim.cmd('highlight WinBar ctermbg=NONE guibg=NONE')
      vim.cmd('highlight WinBarNC ctermbg=NONE guibg=NONE')
      vim.cmd('highlight CursorLineFold ctermbg=NONE guibg=NONE')
      vim.cmd('highlight FoldColumn ctermbg=NONE guibg=NONE')

    end,
    requires = { 'nvim-treesitter/nvim-treesitter', opt = true },
  }
  use {
    "projekt0n/github-nvim-theme",
  }
  use {
	"folke/tokyonight.nvim",
  }

  use{'nvim-treesitter/nvim-treesitter',
    event = 'BufRead *',
    config = conf.nvim_treesitter,
  }

  -- we don't need this any more. we have lspsage already
  -- use {'romgrk/nvim-treesitter-context',
  -- 	cmd = {"Mason", "MasonInstall", "MasonUninstall", "MasonUninstallAll", "MasonLog"},
  --   event = 'BufRead *',
  --   after = 'nvim-treesitter',
	-- config = function ()
  --     vim.cmd[[highlight NormalFloat ctermbg=NONE guibg=NONE]]
	-- end,
  -- }

  use {'nvim-treesitter/nvim-treesitter-textobjects',
	opt = true,
  }
  -- use {'glepnir/galaxyline.nvim',
  --   -- config = [[require('statusline.moonline')]],
  --   config = [[require('statusline.clearline')]],
  --   requires = {'kyazdani42/nvim-web-devicons'}
  -- }

  use {'66RING/bufferline.nvim',
    config = conf.nvim_bufferline,
    after = 'zephyr-nvim',
	-- lock = true,
	commit = '3d77289b20a4ff1689da5ae891a485041e7fe607',
    requires = {
	  'kyazdani42/nvim-web-devicons',
	  -- Delete Neovim buffers without losing window layout
	  {'famiu/bufdelete.nvim', opt = true, cmd = {'Bwipeout', 'Bdelete'}}
	}
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

  -- -- WIP, image preview, kitty only
  -- use {'edluffy/hologram.nvim',
  --   config = function()
	  -- require('hologram').setup{
		-- auto_display = true -- WIP automatic markdown image display, may be prone to breaking
	  -- }
  --   end
  -- }

  -- use {'3rd/image.nvim',
  --   ft = 'markdown',
  --   requires = {
  --      { "vhyrro/luarocks.nvim", opt = true},
  --   },
  --   config = function()
  --     require("image").setup({
  --       backend = "ueberzug",
  --     })
  --   end
  -- }


  -- Image paste
  use {
    'ekickx/clipboard-image.nvim',
    cmd = 'PasteImg',
    lock = true,
    config = function ()
      require'clipboard-image'.setup {
      -- Default configuration for all filetype
      default = {
        img_dir = "./assets/img",
        img_dir_txt = "./assets/img",
        img_name = function ()
          local name = ""
          while true do
            vim.fn.inputsave()
            name = vim.fn.input('Name: ')
            vim.fn.inputrestore()
            local full_path = "./assets/img/"..name..".png"

            -- check exist
            local fs = require("user.utils.fs")
            if fs.file_exists(full_path) then
              -- overwrite
              if vim.fn.confirm("Overwrite?", "&Yes\n&No", 2) == 1 then
                break
              end
            else
              break
            end
          end

          return name
        end,
        affix = "<\n  %s\n>" -- Multi lines affix
      },
      -- You can create configuration for ceartain filetype by creating another field (markdown, in this case)
      -- If you're uncertain what to name your field to, you can run `lua print(vim.bo.filetype)`
      -- Missing options from `markdown` field will be replaced by options from `default` field
      -- markdown = {}
    }
    end
  }

  -- code block completion
  use {
	cmd = 'FeMaco',
	'AckslD/nvim-FeMaco.lua',
	config = 'require("femaco").setup()',
  }

  -- see formula in vim
  use {'jbyuki/nabla.nvim',
    setup = function()
	  vim.cmd[[autocmd FileType markdown nnoremap gd :lua require("nabla").popup()<CR>]]
    end,
    ft = 'markdown',
  }

  use {'tpope/vim-commentary',
    event = "BufRead *",
    setup = function ()
      vim.cmd [[autocmd FileType apache setlocal commentstring=#\ %s]]
      vim.cmd [[autocmd FileType vhdl setlocal commentstring=--\ %s]]
      vim.cmd [[autocmd FileType c,cpp,cuda setlocal commentstring=//\ %s]]
      vim.cmd [[autocmd FileType vue,jsx setlocal commentstring=<!--\ %s\ -->]]
    end
  }

  use {
	'lewis6991/gitsigns.nvim',
	-- tag = 'release' -- To use the latest release (do not use this if you run Neovim nightly or dev builds!)
	cmt = 'Gitsigns',
	config = function()
	  require('gitsigns').setup {
		signcolumn = false,
	  }
      vim.api.nvim_set_keymap('n', '<LEADER>gf', [[:Gitsigns setqflist<CR>]], {noremap=true})
      vim.api.nvim_set_keymap('n', '<LEADER>gh', [[:Gitsigns preview_hunk<CR>]], {noremap=true})
      vim.api.nvim_set_keymap('n', '<LEADER>g-', [[:Gitsigns prev_hunk<CR>]], {noremap=true})
      vim.api.nvim_set_keymap('n', '<LEADER>g=', [[:Gitsigns next_hunk<CR>]], {noremap=true})
	end
  }

  -- editor
  -- ghost text for browser
  use {'raghur/vim-ghost',
	cmd = 'GhostStart',
	run = ':GhostInstall',
  }

  -- virt text type hint
  -- lsp partial support

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

  -- git commit diff view
  use { 'sindrets/diffview.nvim',
	cmd = "DiffviewOpen",
	requires = 'nvim-lua/plenary.nvim'
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

  -- nvim async-io lib
  use {'nvim-neotest/nvim-nio'}

  -- 
  -- debug
  --
  use {'mfussenegger/nvim-dap',
	config = function()
	  require("user.dap")
	end,
    requires = {
	  {'rcarriga/nvim-dap-ui'},
	}
  }
  use {'williamboman/mason.nvim',
  	cmd = {"Mason", "MasonInstall", "MasonUninstall", "MasonUninstallAll", "MasonLog"},
	config = function()
	  require("mason").setup()
	end
  }
  -- use {'nvim-telescope/telescope-dap.nvim'}
  use {'theHamsta/nvim-dap-virtual-text',
	config = function()
	  require("nvim-dap-virtual-text").setup()
	end
  }

  -- use {
	-- "zbirenbaum/copilot.lua",
	-- cmd = "Copilot",
	-- event = "InsertEnter",
	-- config = function()
	  -- require("copilot").setup({})
	-- end,
  -- }

  use {
	"github/copilot.vim",
	cmd = "Copilot",
	event = "InsertEnter",
	config = function()
      -- vim.g.copilot_proxy = 'localhost:7890'

      vim.keymap.set('i', '<C-J>', 'copilot#Accept("<CR>")', {
        expr = true,
        replace_keycodes = false
      })
      vim.g.copilot_no_tab_map = true

	end,
  }

  use {
    "olimorris/codecompanion.nvim",
	cmd = {"CodeCompanionChat", "CodeCompanionActions", "CodeCompanionCmd", "CodeCompanion"},
	event = "InsertEnter",
	config = conf.codecompanion,
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    }
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
	config = function()
		require("registers").setup()
	end,
  }

  use {
    'diepm/vim-rest-console',
	ft = {'rest'}
  }


  -- fuzzy find
  -- -- telescope
 use {'nvim-telescope/telescope.nvim',
   cmd = {'Telescope', 'TelescopeFB'},
   config = conf.telescope,
   requires = {
	 {'nvim-telescope/telescope-fzy-native.nvim', opt = true},
	 -- {'nvim-telescope/telescope-file-browser.nvim', opt = true},
	 -- {'ahmedkhalf/project.nvim', opt = true, config=function()
		-- require("project_nvim").setup {}end },
   }
 }

  use {
    'kyazdani42/nvim-tree.lua',
	cmd = {"NvimTreeToggle", "NvimTreeFindFileToggle"},
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icon
    },
	config = conf.nvim_tree
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

  use {'simrat39/symbols-outline.nvim',
	cmt = 'SymbolsOutline',
	config = conf.symbols_outline,
  }

  --TODO: update nvim
  use {'lukas-reineke/indent-blankline.nvim',
    event = 'BufRead *',
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

  -- Python, jupyter
  use { 'dccsillag/magma-nvim',
	run = ':UpdateRemotePlugins',
	setup = function()
	  vim.g.magma_automatically_open_output = false
	  vim.g.magma_image_provider = "ueberzug"
	end,
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

