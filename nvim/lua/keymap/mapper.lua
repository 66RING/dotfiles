local mapper = {}

function mapper:new(cmd_string)
  local object = {
      cmd = cmd_string,
      options = {
        nowait = false,
        noremap = false,
        silent = false,
        expr = false
      }
  }
  setmetatable(object, self)
  self.__index = self
  return object
end

function mapper:noremap()
  self.options.noremap = true
  return self
end

function mapper:silent()
  self.options.silent = true
  return self
end

function mapper:nowait()
  self.options.nowait = true
  return self
end

function mapper:expr()
  self.options.expr = true
  return self
end

function mapper.map_cmd(cmd_string)
  local ro = mapper:new(cmd_string)
  return ro
end

function mapper.nvim_set_keymap(mapping)
  for key,value in pairs(mapping) do
    local mode,lhs = key:match("([^|]*)|?(.*)")
    if type(value) == 'table' then
      local rhs = value.cmd
      local options = value.options
      vim.api.nvim_set_keymap(mode,lhs,rhs,options)
    end
  end
end

return mapper
