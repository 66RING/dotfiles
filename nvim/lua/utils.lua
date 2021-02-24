local map_key = vim.fn.nvim_set_keymap
local M = {}

function M.opt(o, v, scopes)
  scopes = scopes or {vim.o}
  for _, s in ipairs(scopes) do s[o] = v end
end

function M.autocmd(group, cmds, clear)
  clear = clear == nil and false or clear
  if type(cmds) == 'string' then cmds = {cmds} end
  vim.cmd('augroup ' .. group)
  if clear then vim.cmd [[au!]] end
  for _, c in ipairs(cmds) do vim.cmd('autocmd ' .. c) end
  vim.cmd [[augroup END]]
end

function M.map(modes, lhs, rhs, opts)
  opts = opts or {}
  opts.noremap = opts.noremap == nil and true or opts.noremap
  if type(modes) == 'string' then modes = {modes} end
  for _, mode in ipairs(modes) do map_key(mode, lhs, rhs, opts) end
end

return M
