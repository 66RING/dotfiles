local packer = nil
local conf = require('config')

local function init()

  if packer == nil then
    packer = require('packer')
    packer.init({disable_commands = true})
  end

  local use = packer.use
  local use_rocks = packer.use_rocks
  packer.reset()

  -- Packer can manage itself as an optional plugin
  use {'wbthomason/packer.nvim', opt = true}

  use {"neovim/nvim-lspconfig",
    event = "BufRead *",
    setup = [[require('custom.lspconfig')]]
  }

  use {"glepnir/lspsaga.nvim",
    event = "BufRead *",
    config = conf.lspsaga
  }

  use {"hrsh7th/nvim-compe",
    event = 'InsertEnter *',
    -- setup = conf.nvim_compe
  }


  -- dress up
  use {"glepnir/dashboard-nvim"}

  use {'glepnir/galaxyline.nvim',
    config = [[require('statusline.moonline')]],
    requires = {'kyazdani42/nvim-web-devicons'}
  }

  use {'66RING/bookmarks-nvim'}
  use {'mg979/vim-xtabline'}

  -- enhance
  use {"norcalli/nvim-colorizer.lua",
    setup = conf.nvim_colorizer
  }
  use {'itchyny/vim-cursorword',
    event={'BufReadPre *', 'BufNewFile *'}
  }

  -- markdown
  use {'iamcco/markdown-preview.nvim',
    ft = {'markdown', 'pandoc.markdown', 'rmd'},
    run = 'sh -c "cd app && yarn install"' }
  use {'dhruvasagar/vim-table-mode',
    ft = 'markdown'
  }
  use {'dkarter/bullets.vim',
    ft = 'markdown'
  }

  use {'hrsh7th/vim-vsnip',
    event = 'InsertEnter *',
    setup = conf.vim_vsnip
  }

  use {'hrsh7th/vim-vsnip-integ',
    event = 'InsertEnter *',
    after = 'vim-vsnip'
  }

  use {'tpope/vim-commentary'}

  -- git
  use {'airblade/vim-gitgutter'}

  -- something useful
  use {'junegunn/vim-easy-align' ,
    keys = '<Plug>(EasyAlign)'
  }
  use {'tpope/vim-surround'} -- type ysiw' i sur in word '' or type cs'` to change 'word' to `word` or 'ds' del sur or 'yss'' for sur line h h-> 'h h'
  use {'easymotion/vim-easymotion',
    keys = '<Plug>(easymotion-sn)'
  }

  -- fuzzy find
  use {'liuchengxu/vim-clap',
    run = [[vim.cmd('Clap install-binary')]],
    lock = true,
    cmd = 'Clap'
  }

  use {'mg979/vim-visual-multi'}
  use {'Shougo/defx.nvim',
    run = "vim.cmd('UpdateRemotePlugins')",
    cmd = 'Defx',
    config = conf.defx
  }

  use {'kristijanhusak/defx-icons',
    after = 'defx.nvim'
  }

  use {'voldikss/vim-translator',
    keys = '<Plug>TranslateW'
  }

  use {'liuchengxu/vista.vim',
    cmd = 'Vista'
  }

  use {'Yggdroot/indentLine',
    event = 'BufReadPre *',
    setup = conf.indentLine
  }

  -- sreach
  use {'bronson/vim-visual-star-search'}

  -- database
  -- use {'tpope/vim-dadbod'}
  use {'kristijanhusak/vim-dadbod-ui',
    cmd = {'DBUIToggle', 'DBUIAddConnection', 'DBUI', 'DBUIFindBuffer', 'DBUIRenameBuffer'} ,
    requires = {'tpope/vim-dadbod',opt = true}
  }

  use {'mattn/emmet-vim',
    event = 'InsertEnter *',
    ft = {'html','css','javascript','javascriptreact','vue','typescript','typescriptreact'},
    setup = conf.emmet
  }
  -- div>li>a  div+li+a*3  div>li>a^p  div>(li>a)^p
  -- V: div>li*  * means for each line
  -- div[hello="1"]{TEXT} or some css selector grammar
  -- ul>li#item$*5  different number at least one digit
  -- ul>li#item$@3*5  start counting from 3, -3 as  reverse
  -- emmet ket + d, D, n, N, m, k, j, /, a

  use {'AndrewRadev/tagalong.vim'}
  use {'sophacles/vim-processing',
    ft = 'processing'
  }

  use {'szw/vim-maximizer',
    cmd = "MaximizerToggle",
    setup = function()
      local opts = {silent=true, noremap=true}
      vim.api.nvim_set_keymap('n', '<C-m>', ":MaximizerToggle<CR>", opts)
      vim.api.nvim_set_keymap('i', '<C-m>', ":MaximizerToggle<CR>", opts)
      vim.api.nvim_set_keymap('v', '<C-m>', "<C-o>:MaximizerToggle<CR>", opts)
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

