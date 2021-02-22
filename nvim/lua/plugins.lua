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
    -- event = "BufRead *",
    config = [[require('custom.lspconfig')]]
  }

  use {"glepnir/lspsaga.nvim",
    cmd = "Lspsaga",
    after = "nvim-lspconfig",
    config = conf.lspsaga
  }

  use {"hrsh7th/nvim-compe"}


  -- dress up
  use {"ryanoasis/vim-devicons"}
  use {"glepnir/dashboard-nvim"}

  use {'glepnir/galaxyline.nvim',
    config = [[require('statusline.moonline')]]
  }

  use {'66RING/bookmarks-nvim'}
  use {'mg979/vim-xtabline'}

  -- enhance
  use {"norcalli/nvim-colorizer.lua",
    config = conf.nvim_colorizer
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
    event = 'InsertCharPre *',
    config = conf.nvim_vsnip
  }

  use {'hrsh7th/vim-vsnip-integ',
    event = 'InsertCharPre *'
  }

  use {'tpope/vim-commentary'}

  -- git
  use {'airblade/vim-gitgutter'}

  -- something useful

  use {'junegunn/vim-easy-align' ,
    -- keys = {'xn', '<Plug>(EasyAlign)'}
  }
  use {'tpope/vim-surround'} -- type ysiw' i sur in word '' or type cs'` to change 'word' to `word` or 'ds' del sur or 'yss'' for sur line h h-> 'h h'
  use {'easymotion/vim-easymotion',
    -- keys = {'n', '<Plug>'}
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

  -- TODO
  use {'kristijanhusak/defx-icons',
    requires = 'Shougo/defx.nvim' -- TODO
  }

  use {'voldikss/vim-translator',
    -- keys = {'x', '<Plug>TranslateW'}
  }

  use {'liuchengxu/vista.vim',
    cmd = 'Vista'
  }

  use {'Yggdroot/indentLine',
    event = 'BufReadPre *',
    config = conf.indentLine
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
    ft = { 'html','css','javascript','javascriptreact','vue','typescript','typescriptreact' },
    config = conf.emmet
  }
  use {'AndrewRadev/tagalong.vim'}
  use {'sophacles/vim-processing',
    ft = 'processing'
  }

end

local plugins = setmetatable({}, {
  __index = function(_, key)
    init()
    return packer[key]
  end
})

return plugins

