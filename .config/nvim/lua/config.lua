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
  -- vim.api.nvim_command('set foldmethod=expr')
  -- vim.api.nvim_command('set foldexpr=nvim_treesitter#foldexpr()')
  if not packer_plugins['nvim-treesitter-textobjects'].loaded then
	vim.cmd [[packadd nvim-treesitter-textobjects]]
  end
  require'nvim-treesitter.configs'.setup {
    highlight = {
      enable = true,
    },
	textobjects = {
	  select = {
		enable = true,

		-- Automatically jump forward to textobj, similar to targets.vim
		lookahead = true,

		keymaps = {
		  -- You can use the capture groups defined in textobjects.scm
		  ["af"] = "@function.outer",
		  ["hf"] = "@function.inner",
		  ["ac"] = "@class.outer",
		  ["hc"] = "@class.inner",
		},
		-- You can choose the select mode (default is charwise 'v')
		selection_modes = {
		  ['@parameter.outer'] = 'v', -- charwise
		  ['@function.outer'] = 'V', -- linewise
		  ['@class.outer'] = '<c-v>', -- blockwise
		},
		-- If you set this to `true` (default is `false`) then any textobject is
		-- extended to include preceding xor succeeding whitespace. Succeeding
		-- whitespace has priority in order to act similarly to eg the built-in
		-- `ap`.
		include_surrounding_whitespace = true,
	  },
	},
    -- ensure_installed = 'all'
  }
end

-- unused
function config.indentLine()
  vim.g.indentLine_enabled = 1
  vim.g.indentLine_char='¦'
  vim.g.indentLine_fileTypeExclude = {'defx', 'json', 'denite','startify','dbui','vista_kind','vista','coc-explorer','dashboard','chadtree', 'markdown', 'terminal', 'FTerm'}
  vim.g.indentLine_concealcursor = 'inc'
  vim.g.indentLine_showFirstIndentLevel =1
end


function config.indent_blankline_nvim()
  vim.opt.list = true
  require("indent_blankline").setup {
	  show_end_of_line = true,
  }
end


function config.nvim_bufferline()
  require('bufferline').setup{
    options = {
      modified_icon = '',
      buffer_close_icon = '',
      show_buffer_close_icons = false,
      close_icon = "",
	  persist_buffer_sort = true,
	  sort_by = "tabs",
      always_show_bufferline = false,
      separator_style = {'', ''},
	  indicator_icon = '',
	  numbers = function(opts)
		return string.format('%s', opts.ordinal)
	  end,
	  -- numbers = "ordinal",
      view = "multiwindow",
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
  map_key('n', '<BS>', [[:<c-u>lua if vim.v.count~=0 then vim.cmd("BufferLineGoToBuffer "..vim.v.count) else vim.cmd("buffer #")end<CR>]], opts)
  map_key('n', 'r<BS>', [[:lua if vim.tbl_count(vim.fn.getbufinfo({buflisted=true}))>1 then vim.cmd("bd") end <CR>]], opts)
end

function config.symbols_outline()
  require("symbols-outline").setup({
	highlight_hovered_item = false,
	show_guides = true,
	auto_preview = false,
	position = 'right',
	relative_width = true,
	width = 25,
	auto_close = false,
	show_numbers = false,
	show_relative_numbers = false,
	show_symbol_details = false,
	preview_bg_highlight = 'Pmenu',
	keymaps = { -- These keymaps can be a string or a table for multiple keys
	  close = {"<Esc>", "q"},
	  goto_location = "<Cr>",
	  focus_location = "o",
	  hover_symbol = "<C-space>",
	  toggle_preview = "O",
	  rename_symbol = "r",
	  code_actions = "<Nop>",
	},
	lsp_blacklist = {},
	symbol_blacklist = {},
	symbols = {
	  File = {icon = "", hl = "TSURI"},
	  Module = {icon = "", hl = "TSNamespace"},
	  Namespace = {icon = "", hl = "TSNamespace"},
	  Package = {icon = "", hl = "TSNamespace"},
	  Class = {icon = "𝓒", hl = "TSType"},
	  Method = {icon = "ƒ", hl = "TSMethod"},
	  Property = {icon = "", hl = "TSMethod"},
	  Field = {icon = "", hl = "TSField"},
	  Constructor = {icon = "", hl = "TSConstructor"},
	  Enum = {icon = "ℰ", hl = "TSType"},
	  Interface = {icon = "ﰮ", hl = "TSType"},
	  Function = {icon = "", hl = "TSFunction"},
	  Variable = {icon = "", hl = "TSConstant"},
	  Constant = {icon = "", hl = "TSConstant"},
	  String = {icon = "𝓐", hl = "TSString"},
	  Number = {icon = "#", hl = "TSNumber"},
	  Boolean = {icon = "⊨", hl = "TSBoolean"},
	  Array = {icon = "", hl = "TSConstant"},
	  Object = {icon = "⦿", hl = "TSType"},
	  Key = {icon = "🔐", hl = "TSType"},
	  Null = {icon = "NULL", hl = "TSType"},
	  EnumMember = {icon = "", hl = "TSField"},
	  Struct = {icon = "𝓢", hl = "TSType"},
	  Event = {icon = "🗲", hl = "TSType"},
	  Operator = {icon = "+", hl = "TSOperator"},
	  TypeParameter = {icon = "𝙏", hl = "TSParameter"}
	}
  })
end

function config.todo_comments()
  -- with `:` after
  if not packer_plugins['plenary.nvim'].loaded then
	vim.cmd [[packadd plenary.nvim]]
  end
  require("todo-comments").setup{
	signs = true, -- show icons in the signs column
	sign_priority = 8, -- sign priority
	-- keywords recognized as todo comments
	keywords = {
	  FIX = {
		icon = " ", -- icon used for the sign, and in search results
		color = "error", -- can be a hex color, or a named color (see below)
		alt = { "FIXME", "BUG", "FIXIT", "ISSUE", "ERROR" }, -- a set of other keywords that all map to this FIX keywords
		-- signs = false, -- configure signs for some keywords individually
	  },
	  TODO = { icon = " ", color = "info" },
	  HACK = { icon = " ", color = "warning" },
	  WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
	  PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
	  NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
	},
	merge_keywords = true, -- when true, custom keywords will be merged with the defaults
	-- highlighting of the line containing the todo comment
	-- * before: highlights before the keyword (typically comment characters)
	-- * keyword: highlights of the keyword
	-- * after: highlights after the keyword (todo text)
	highlight = {
	  before = "", -- "fg" or "bg" or empty
	  keyword = "wide", -- "fg", "bg", "wide" or empty. (wide is the same as bg, but will also highlight surrounding characters)
	  after = "fg", -- "fg" or "bg" or empty
	  pattern = [[.*<(KEYWORDS)\s*:]], -- pattern or table of patterns, used for highlightng (vim regex)
	  comments_only = true, -- uses treesitter to match keywords in comments only
	  max_line_len = 400, -- ignore lines longer than this
	  exclude = {}, -- list of file types to exclude highlighting
	},
	-- list of named colors where we try to extract the guifg from the
	-- list of hilight groups or use the hex color if hl not found as a fallback
	colors = {
	  error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
	  warning = { "DiagnosticWarning", "WarningMsg", "#FBBF24" },
	  info = { "DiagnosticInfo", "#2563EB" },
	  hint = { "DiagnosticHint", "#10B981" },
	  default = { "Identifier", "#7C3AED" },
	},
	search = {
	  command = "rg",
	  args = {
		"--color=never",
		"--no-heading",
		"--with-filename",
		"--line-number",
		"--column",
	  },
	  -- regex that will be used to match keywords.
	  -- don't replace the (KEYWORDS) placeholder
	  pattern = [[\b(KEYWORDS):]], -- ripgrep regex
	  -- pattern = [[\b(KEYWORDS)\b]], -- match without the extra colon. You'll likely get false positives
	},
  }
	
end



--
-- editor
--


function config.telescope()
  if not packer_plugins['plenary.nvim'].loaded then
    vim.cmd [[packadd plenary.nvim]]
    vim.cmd [[packadd popup.nvim]]
    vim.cmd [[packadd telescope-fzy-native.nvim]]
    vim.cmd [[packadd telescope-file-browser.nvim]]
    -- vim.cmd [[packadd project.nvim]]
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
	  file_ignore_patterns = {".git/", '%.o', '%jdt%'},
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
 	  file_browser = {
 		-- theme = "ivy",
 		mappings = {
 		  ["i"] = {
 			["<C-e>"] = require "telescope".extensions.file_browser.actions.create,
 			["<C-r>"] = require "telescope".extensions.file_browser.actions.rename,
 		  },
 		}
 	  }
    }
  }

  vim.cmd[[command! -nargs=* TelescopeFB lua require 'telescope'.extensions.file_browser.file_browser({cwd=vim.fn.expand('%:p:h')})]]
  require("telescope").load_extension('file_browser')
  require('telescope').load_extension('fzy_native')
  -- require("telescope").load_extension('projects')
end

function config.fzf_vim()
  vim.g.fzf_preview_window = {'right:60%', 'ctrl-/'}
  vim.g.fzf_layout = { window={ width=0.9, height=0.9 } }
  vim.cmd[[command! -bang -nargs=* Rgpwd call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, fzf#vim#with_preview({'dir': expand('%:p:h')}), <bang>0)]]
end

-- session manager
function config.neovim_session_manager()
  if not packer_plugins['plenary.nvim'].loaded then
    vim.cmd [[packadd plenary.nvim]]
  end

  local Path = require('plenary.path')
  local status_ok, session_manager = pcall(require, "session_manager")
  if not status_ok then
	return
  end

  session_manager.setup({
	sessions_dir = Path:new(vim.fn.stdpath('data'), 'sessions'), -- The directory where the session files will be saved.
	path_replacer = '__', -- The character to which the path separator will be replaced for session files.
	colon_replacer = '++', -- The character to which the colon symbol will be replaced for session files.
	autoload_mode = require('session_manager.config').AutoloadMode.Disabled, -- Define what to do when Neovim is started without arguments. Possible values: Disabled, CurrentDir, LastSession
	autosave_last_session = true, -- Automatically save last session on exit and on session switch.
	autosave_ignore_not_normal = true, -- Plugin will not save a session when no buffers are opened, or all of them aren't writable or listed.
	autosave_ignore_filetypes = { -- All buffers of these file types will be closed before the session is saved.
	  'gitcommit',
	},
	autosave_only_in_session = false, -- Always autosaves session. If true, only autosaves after a session is active.
	max_path_length = 80,  -- Shorten the display path if length exceeds this threshold. Use 0 if don't want to shorten the path at all.
  })
end

function config.alpha_nvim()
  local dashboard = require("alpha.themes.dashboard")
  dashboard.section.header.val = {
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
	'⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡜⢹⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
	'⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⠃⠀⢻⡾⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
	'⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⠀⠀⢸⣼⠁⠀⠀⠄⠹⣿⣆⠀⠀⡰⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
	'⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⡀⠀⠀⠸⡄⢠⡿⠀⠀⣺⣿⢾⠀⠘⣿⣧⣼⠀⠀⠀⡰⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
	'⠀⠀⠀⠀⠀⠀⠀⠐⢄⠀⠀⠀⢳⡀⣦⣹⣥⠆⠀⠀⠀⠈⠈⢀⠀⠈⣿⣷⡎⣰⠇⠀⠀⠀⠔⠀⠀⠀⠀⠀⠀⠀⠀',
	'⠀⠀⠀⠀⠀⢀⠀⠀⠀⠈⠳⣄⢳⣼⣿⣿⠁⢀⣠⣲⣾⣿⣿⣾⣷⣦⡀⢿⣿⣴⢋⣤⠋⠀⠀⠀⢀⠀⠀⠀⠀⠀⠀',
	'⠀⠀⠀⠀⠀⠀⠀⠉⠲⣤⡙⣶⣿⣿⡿⠀⠀⠀⠀⠀⢀⡀⢠⡠⠄⠀⠀⠀⢹⣿⣿⡞⣡⣴⠚⠁⠀⠀⠀⠀⠀⠀⠀',
	'⠀⠀⠀⠀⠈⠒⠦⣤⣈⣻⣿⣿⣿⠏⠀⢀⢴⣾⣿⣿⡿⠿⠿⠿⣿⣽⣿⠦⠀⠹⣿⣿⣾⣋⣠⡤⠖⠂⠁⠀⠀⠀⠀',
	'⠀⠀⠀⡀⠀⠀⡀⠒⠶⣾⣿⣿⠃⢀⣤⠟⠉⠀⠀⣠⣤⠀⠀⠀⠀⠀⠀⠀⠑⠀⠘⣿⢿⡶⠖⢀⠀⠀⠀⡀⠀⠀⠀',
	'⠀⠀⠀⠀⠀⠀⠤⠤⣤⣿⡿⠀⠐⠀⢠⣶⡄⡀⣆⠸⠿⠀⠀⠀⢰⣸⡇⣾⣆⠀⠀⠀⣿⣷⣤⠤⠄⠀⠀⠀⠀⠀⠀',
	'⠀⠀⠀⠒⠂⠉⠉⢹⣿⡟⢀⠤⠀⣼⣿⣿⣿⣆⠻⣯⣶⡶⠶⣿⡽⢋⣾⣿⡿⢀⣴⠇⠀⠿⢿⡉⠉⠉⠐⠂⠀⠀⠀',
	'⠀⠀⠀⠀⠀⣀⣴⣿⠏⠀⠀⢤⣛⣶⣤⣍⣿⣿⣿⣿⣶⣶⣶⣾⣿⣿⣷⣿⣋⣴⣨⣖⡀⠀⠀⠸⣄⡀⠀⠀⠀⠀⠀',
	'⠀⠀⠀⠀⢀⣾⢿⠃⠀⠀⠀⠼⡿⣷⣼⣧⣾⣦⢿⣿⣭⣭⣭⡴⠖⣻⣿⠶⢟⣉⣭⣶⠢⠄⠀⠀⠈⣦⠀⠀⠀⠀⠀',
	'⠀⠀⠀⣠⠿⠟⠀⠀⠀⠀⠀⠀⢀⣀⣀⣠⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⡀⣷⠀⠀⠀⠀',
	'⠀⠀⠀⠀⠀⠈⠈⢈⠜⠉⠉⠉⣸⠋⣼⢡⡟⣿⣿⢿⣿⣿⣿⣿⡿⡟⣿⠹⡌⢻⡀⠁⠀⠙⢄⠀⠀⠀⠀⠀⠀⠀⠀',
	'⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠊⠀⠀⢠⠏⠰⠀⡿⢸⠀⡇⢸⠈⣇⠸⠀⢷⠀⠀⠈⢦⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
	'⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠃⠀⠀⢰⠀⠀⠀⡇⠀⠀⢸⠀⠀⠀⢣⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
	'⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ⠀⠀⠀⠀⠀⠂⠀⠀⠀⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
    '',
  }
  dashboard.section.buttons.val = {
	{ type = "button", val = "" },
  }
  -- dashboard.section.footer.val = "Fabrice!"
  dashboard.section.footer.val = "MAY CHAOS TAKE THE WORLD, MAY OPEN SOURCE GUIDE YOUR WAY"
  -- "STAY HUNGRY, STAY FOOLISH",
  -- " 		       			— Steve Jobs"
  -- "  THE PEOPLE WHO ARE CRAZY ENOUGH",
  -- "TO THINK THEY CAN CHANGE THE WORLD",
  -- "  		  THE ONES WHO DO.",
  -- " 		       			— Steve Jobs"

  dashboard.section.header.opts.hl = "Title"
  dashboard.section.buttons.opts.hl = "Keyword"
  dashboard.section.footer.opts.hl = "ErrorMsg"

  require'alpha'.setup(dashboard.opts)

  vim.cmd [[autocmd FileType alpha nnoremap <silent><buffer> e :exec "enew"<CR>]]
  vim.cmd [[autocmd FileType alpha hi Cursor blend=100 | set guicursor+=a:Cursor/Cursor | autocmd BufLeave <buffer> set guicursor-=a:Cursor/Cursor]]
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
    vim.cmd [[autocmd FileType html,css,vue,wxml,js,jsx,markdown EmmetInstall]]
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

function config.luasnip()
  local ls = require "luasnip"
  local types = require "luasnip.util.types"

  ls.config.set_config {
	history = true,
	-- update as your type if you have multi snip
	updateevents = "TextChanged, TextChangedI",
	-- TODO:
	enable_autosnippets = true,
	ext_opts = {
	  [types.choiceNode] = {
		active = {
		  virt_text = { {"<-", "Error"} },
		},
	  }
	}
  }

  require("luasnip.loaders.from_vscode").lazy_load()
  require("luasnip.loaders.from_vscode").load({ paths = { "./config/vsnips" } })

  vim.keymap.set("i", "<c-e>", "luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<c-e>'", {expr = true})

  -- vim.keymap.set({"i", "s"}, "<c-l>", function ()
	-- if ls.expand_or_jumpable() then
	  -- ls.expand_or_jump()
	-- end
  -- end, {silent = true})

  -- vim.keymap.set({"i", "s"}, "<c-j>", function ()
	-- if ls.jumpable(-1) then
	  -- ls.jump(-1)
	-- end
  -- end, {silent = true})

  -- multi choose
  vim.keymap.set({"i"}, "<c-o>", function ()
	if ls.choice_active() then
	  ls.choice_active(1)
	end
  end)
end

function config.lspsaga()
  local saga = require 'lspsaga'
  saga.init_lsp_saga{
    finder_action_keys = {
      open = '<enter>', vsplit = 'v',split = 's',quit = 'q',
    },
	code_action_lightbulb = {
	  enable = false,
	  sign = true,
	  sign_priority = 20,
	  virtual_text = true,
	},
  }
end


function config.nvim_cmp()
  if not packer_plugins['lspkind-nvim'].loaded then
    vim.cmd [[packadd lspkind-nvim]]
  end
  local cmp = require'cmp'
  local lspkind = require'lspkind'
  cmp.setup {
	snippet = {
      expand = function(args)
        -- vim.fn["vsnip#anonymous"](args.body)
		require'luasnip'.lsp_expand(args.body)
      end,
    },
	window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    mapping = {
      ['<Down>'] = cmp.mapping.scroll_docs(-4),
      ['<Up>'] = cmp.mapping.scroll_docs(4),
	  ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
	  ['<c-n>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
	  ['<c-p>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 's' }),
      ['<C-e>'] = cmp.mapping.complete(),
      ['<C-c>'] = cmp.mapping.close(),
      ['<CR>'] = cmp.mapping.confirm(),
    },
	formatting = {
	  format = lspkind.cmp_format({with_text = false, maxwidth = 50})
	},
	sources = {
	  { name = 'nvim_lsp' },
	  -- { name = 'vsnip'},
	  { name = 'luasnip'},
	  { name = 'cmp-nvim-lsp-signature-help'},
	  -- { name = 'cmp_tabnine'},
	  { name = 'path' },
	  { name = 'buffer' },
	  { name = 'calc'},
	  { name = 'latex_symbols'},
	  { name = 'vim-dadbod-completion'},
	}
  }
  vim.cmd[[set completeopt=menu,menuone,noinsert,noselect]]
  vim.cmd[[autocmd FileType markdown lua require'cmp'.setup.buffer{completion = {autocomplete=false}}]]
end

function config.cmp_tabnine()
  local tabnine = require('cmp_tabnine.config')
  tabnine:setup({
		  max_lines = 1000;
		  max_num_results = 20;
		  sort = true;
	  run_on_every_keystroke = true;
	  snippet_placeholder = '🚀';
  })
end

-- nvim tree
function config.nvim_tree()
  require'nvim-tree'.setup {
	view = {
	  mappings = {
		list = {
		  { key = { "<CR>", "o", "<2-LeftMouse>" }, action = "edit" },
		  { key = "<C-e>",                          action = "" },
		  { key = "O",                              action = "" },
		  { key = { "<C-]>", "<2-RightMouse>" },    action = "" },
		  { key = "<C-v>",                          action = "vsplit" },
		  { key = "<C-x>",                          action = "split" },
		  { key = "<C-t>",                          action = "" },
		  { key = "<",                              action = "prev_sibling" },
		  { key = ">",                              action = "next_sibling" },
		  { key = "P",                              action = "" },
		  { key = "<BS>",                           action = "close_node" },
		  { key = "<Tab>",                          action = "" },
		  { key = "K",                              action = "" },
		  { key = "J",                              action = "" },
		  { key = "I",                              action = "" },
		  { key = "H",                              action = "" },
		  { key = "U",                              action = "" },
		  { key = "R",                              action = "refresh" },
		  { key = "mf",                              action = "create" },
		  { key = "dD",                              action = "remove" },
		  { key = "D",                              action = "trash" },
		  { key = "r",                              action = "rename" },
		  { key = "<C-r>",                          action = "" },
		  { key = "dd",                              action = "cut" },
		  { key = "c",                              action =  "" },
		  { key = "yy",                              action = "copy" },
		  { key = "pp",                              action = "paste" },
		  { key = "y",                              action = "" },
		  { key = "Y",                              action = "" },
		  { key = "yp",                             action = "copy_absolute_path" },
		  { key = "[c",                             action = "prev_git_item" },
		  { key = "]c",                             action = "next_git_item" },
		  { key = "-",                              action = "dir_up" },
		  { key = "s",                              action = "system_open" },
		  { key = "f",                              action = "live_filter" },
		  { key = "F",                              action = "clear_live_filter" },
		  { key = "q",                              action = "close" },
		  { key = "W",                              action = "collapse_all" },
		  { key = "E",                              action = "expand_all" },
		  { key = "S",                              action = "search_node" },
		  { key = ".",                              action = "run_file_command" },
		  { key = "<C-k>",                          action = "toggle_file_info" },
		  { key = "g?",                             action = "toggle_help" },
		  -- custom
		  { key = "v",                             action = "toggle_help" },
		}
	  }
	}
  }
end

-- tool
function config.vim_dadbod_ui()
  -- format: <name>,<url>
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
