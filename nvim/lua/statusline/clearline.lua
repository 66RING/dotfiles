local gl = require('galaxyline')
local condition = require('galaxyline.condition')
local gls = gl.section
gl.short_line_list = {'defx','vista', 'dbui', 'vista_markdown', 'packer'}

local colors = {
  bg = '#282c34',
  reverse = '#8be9fd',
  none = 'NONE',
  line_bg = '#21242b',
  yellow = '#ffff66',
  cyan = '#d7ffd7',
  darkblue = '#081633',
  green = '#99cc66',
  orange = '#FF8800',
  purple = '#5d4d7a',
  magenta = '#d16d9e',
  dim = '#6272a4',
  blue = '#61AFEF',
  red = '#ec5f67'
}


local mode_color = {n = colors.cyan, i = colors.red,v=colors.dim,[''] = colors.dim,V=colors.dim,
                    c = colors.green,no = colors.magenta,s = colors.orange,S=colors.orange,
                    [''] = colors.orange,ic = colors.yellow,R = colors.purple,Rv = colors.purple,
                    cv = colors.red,ce=colors.red, r = colors.cyan,rm = colors.cyan, ['r?'] = colors.cyan,
                    ['!']  = colors.red,t = colors.green}

local file_readonly = function()
  if vim.o.filetype == 'help' then
    return ''
  end
  if vim.o.readonly == true then
    return " "
  end
  return ''
end

--
-- Left
--
table.insert(gls.left,{
  FirstElement = {
    provider = function()
      vim.api.nvim_command('hi GalaxyFirstElement guibg=NONE')
      return ' '
    end,
    highlight = {colors.none,colors.blue}
  },
})

table.insert(gls.left, {
  FileName = {
    provider = function()
      vim.api.nvim_command('hi GalaxyFileName guibg=NONE guifg='..mode_color[vim.fn.mode()])

      local file = vim.fn.expand('%:t')
      if vim.fn.empty(file) == 1 then return '' end
      if string.len(file_readonly()) ~= 0 then
        return file .. file_readonly()
      end
      if vim.o.modifiable then
        if vim.bo.modified then
          return file .. ' '
        end
      end
      return file .. ' '
    end,
    condition = condition.buffer_not_empty,
    highlight = {colors.line_bg,colors.blue,'bold'},
  }
})

table.insert(gls.left, {
  GitIcon = {
    provider = function()
      return ' '
    end,
    condition = condition.check_git_workspace,
    highlight = {colors.yellow,colors.none, 'bold'},
  }
})
table.insert(gls.left, {
  GitBranch = {
    provider = {'GitBranch'},
    condition = condition.check_git_workspace,
    highlight = {colors.yellow,colors.none,'bold'},
  }
})

table.insert(gls.left, {
  Space = {
    provider = function () return ' ' end
  }
})

table.insert(gls.left, {
  DiffAdd = {
    provider = 'DiffAdd',
    icon = ' ',
    highlight = {colors.green,colors.none},
  }
})

table.insert(gls.left, {
  DiffModified = {
    provider = 'DiffModified',
    icon = ' ',
    highlight = {colors.orange,colors.none},
  }
})

table.insert(gls.left, {
  DiffRemove = {
    provider = 'DiffRemove',
    icon = ' ',
    highlight = {colors.red,colors.none},
  }
})

table.insert(gls.left, {
  DiagnosticError = {
    provider = 'DiagnosticError',
    icon = '  ',
    highlight = {colors.red,colors.none}
  }
})
table.insert(gls.left, {
  Space = {
    provider = function () return ' ' end
  }
})
table.insert(gls.left, {
  DiagnosticWarn = {
    provider = 'DiagnosticWarn',
    icon = '  ',
    highlight = {colors.blue,colors.none},
  }
})


--
-- Right
--
table.insert(gls.right, {
  FileFormat = {
    provider = 'FileFormat',
    highlight = {colors.magenta,colors.none},
  }
})

-- table.insert(gls.right, {
--   LineInfo = {
--     provider = 'LineColumn',
--     separator = ' | ',
--     separator_highlight = {colors.darkblue,colors.none},
--     condition = condition.buffer_not_empty,
--     highlight = {colors.dim,colors.none},
--   },
-- })

table.insert(gls.right, {
  FileEncode = {
    provider = 'FileEncode',
    separator = ' |',
    separator_highlight = {colors.darkblue,colors.none},
    condition = condition.buffer_not_empty,
    highlight = {colors.green,colors.none},
  },
})

table.insert(gls.right, {
  PerCent = {
    provider = 'LinePercent',
    separator = ' |',
    separator_highlight = {colors.darkblue,colors.none},
    condition = condition.buffer_not_empty,
    highlight = {colors.dim,colors.none},
  }
})

table.insert(gls.right, {
  ScrollBar = {
    provider = 'FileSize',
    separator = '| ',
    separator_highlight = {colors.darkblue,colors.none},
    condition = condition.buffer_not_empty,
    highlight = {colors.cyan,colors.none},
  }
})

--
-- Short Line left
--
table.insert(gls.short_line_left, {
  SSpace = {
    provider = function () return "  " end,
    condition = condition.buffer_not_empty,
    highlight = {colors.reverse,colors.dim},
  },
})

table.insert(gls.short_line_left, {
  SFileIcon = {
    provider = 'FileIcon',
    condition = condition.buffer_not_empty,
    highlight = {colors.reverse,colors.dim},
  },
})

table.insert(gls.short_line_left, {
  SFileName = {
    provider = 'FileName',
    highlight = {colors.reverse,colors.dim},
    separator = '%m',
    separator_highlight = {colors.dim,colors.none},
  }
})

-- table.insert(gls.short_line_right, {
--   BufferIcon = {
--     provider= 'BufferIcon',
--     separator = '',
--     separator_highlight = {colors.reverse,colors.none},
--     highlight = {colors.dim,colors.reverse}
--   }
-- })

