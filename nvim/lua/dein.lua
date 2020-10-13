local dein = {}
local global = require 'global'


function dein:init()
  local cache_path = "SOME/PATH"

  if vim.fn.has('vim_starting') then
    vim.api.nvim_set_var('dein#auto_recache',1)
    vim.api.nvim_set_var('dein#install_max_processes',12)

    if not string.match(vim.o.runtimepath,'/dein.vim') then
      if not global.isdir(dein_dir) then
        os.execute(cmd)
      end
      vim.o.runtimepath = vim.o.runtimepath ..','..dein_dir
    end
  end




end
