local gl = require('galaxyline')
local gls = gl.section
gl.short_line_list = {'defx','vista', 'dbui', 'vista_markdown'}

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

local mode_icon = {n = '😏', i = '😈', v='😏', [''] = '😏', V='😏',
                    c = '😈', no = '🧐', s = '🧐', S='🧐',
                    [''] = '🧐', r = '😈',rm = '😈', ['r?'] = '🤨',
                    ['!']  = '🤨', t = '🤨'}

local mode_color = {n = colors.blue, i = colors.cyan,v=colors.dim,[''] = colors.dim,V=colors.dim,
                    c = colors.yellow,no = colors.magenta,s = colors.orange,S=colors.orange,
                    [''] = colors.orange,ic = colors.yellow,R = colors.purple,Rv = colors.purple,
                    cv = colors.red,ce=colors.red, r = colors.cyan,rm = colors.cyan, ['r?'] = colors.cyan,
                    ['!']  = colors.red,t = colors.green}

local mode_color_fg = setmetatable(
      {v=colors.reverse,[''] = colors.reverse,V=colors.reverse },
      {__index=function() return colors.line_bg end})

local file_readonly = function()
  if vim.o.filetype == 'help' then
    return ''
  end
  if vim.o.readonly == true then
    return " "
  end
  return ''
end

local buffer_not_empty = function()
  if vim.fn.empty(vim.fn.expand('%:t')) ~= 1 then
    return true
  end
  return false
end

local checkwidth = function()
  local squeeze_width  = vim.fn.winwidth(0) / 2
  if squeeze_width > 40 then
    return true
  end
  return false
end

local function find_git_root()
  local path = vim.fn.expand('%:p:h')
  local get_git_dir = require('galaxyline.provider_vcs').get_git_dir
  return get_git_dir(path)
end

local function get_git_status()
  local status = vim.fn.GitGutterGetHunkSummary()
  return status
end


gls.left[1] = {
  FirstElement = {
    provider = function() 
      vim.api.nvim_command('hi GalaxyFirstElement guibg='..mode_color[vim.fn.mode()])
      return ' ' 
    end,
    highlight = {colors.none,colors.blue}
  },
}
gls.left[2] = {
  ViMode = {
    provider = function()
      -- auto change color according the vim mode
      vim.api.nvim_command('hi GalaxyViMode guibg='..mode_color[vim.fn.mode()])
      return mode_icon[vim.fn.mode()]..' '
    end,
    highlight = {colors.line_bg,colors.blue,'bold'},
  },
}

gls.left[3] = {
  FileName = {
    provider = function()
      vim.api.nvim_command('hi GalaxyFileName guibg='..mode_color[vim.fn.mode()]..' guifg='..mode_color_fg[vim.fn.mode()])

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
    condition = buffer_not_empty,
    highlight = {colors.line_bg,colors.blue,'bold'},
  }
}

gls.left[4] = {
  Sep = {
    provider = function()
      vim.api.nvim_command('hi GalaxySep guifg='..mode_color[vim.fn.mode()])
      return ' '
    end, 
    condition = buffer_not_empty,
    highlight = {colors.blue,colors.none,'bold'},
  }
}

gls.left[5] = {
  GitIcon = {
    provider = function() return ' ' end,
    condition = find_git_root,
    highlight = {colors.yellow,colors.none, 'bold'},
  }
}
gls.left[6] = {
  GitBranch = {
    provider = {'GitBranch'},
    condition = buffer_not_empty,
    highlight = {colors.yellow,colors.none,'bold'},
  }
}

gls.left[7] = {
  GitStatus = {
    provider = function() 
        local status = get_git_status()
        return '+'..status[1]..' ~'..status[2]..' -'..status[3]
      end,
    condition = function() return find_git_root() and checkwidth() end,
    highlight = {colors.orange,colors.none},
  }
}

gls.left[11] = {
  DiagnosticError = {
    provider = function()
        local has_info,info = pcall(vim.fn.nvim_buf_get_var,0,'coc_diagnostic_info')
        if not has_info then return end
        if info.error > 0 then
          return info.error
        end
        return ''
      end,
    icon = '  ',
    highlight = {colors.red,colors.none}
  }
}

gls.left[12] = {
  Space = {
    provider = function () return ' ' end
  }
}

gls.left[13] = {
  DiagnosticWarn = {
    provider = function() 
        local has_info,info = pcall(vim.fn.nvim_buf_get_var,0,'coc_diagnostic_info')
        if not has_info then return end
        if info.warning > 0 then
          return  info.warning
        end
        return ''
      end,
    icon = '  ',
    highlight = {colors.blue,colors.none},
  }
}



gls.right[1]= {
  FileFormat = {
    provider = 'FileFormat',
    highlight = {colors.magenta,colors.none},
  }
}
gls.right[2] = {
  LineInfo = {
    provider = 'LineColumn',
    separator = ' | ',
    separator_highlight = {colors.darkblue,colors.none},
    condition = buffer_not_empty,
    highlight = {colors.grey,colors.none},
  },
}
gls.right[3] = {
  PerCent = {
    provider = 'LinePercent',
    separator = ' | ',
    separator_highlight = {colors.darkblue,colors.none},
    condition = buffer_not_empty,
    highlight = {colors.grey,colors.none},
  }
}
gls.right[4] = {
  ScrollBar = {
    provider = 'FileSize',
    separator = ' | ',
    separator_highlight = {colors.darkblue,colors.none},
    condition = buffer_not_empty,
    highlight = {colors.cyan,colors.none},
  }
}


gls.short_line_left[1] = {
  BufferType = {
    provider = 'FileTypeName',
    separator = '',
    separator_highlight = {colors.dim,colors.none},
    highlight = {colors.reverse,colors.dim}
  }
}
