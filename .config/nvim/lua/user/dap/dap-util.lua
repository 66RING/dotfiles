local M = {}
local dap = require 'dap'

-- refresh config
M.reload_continue = function()
  package.loaded['user.dap.setup'] = nil
  require('user.dap.setup').setup()
  dap.continue()
end

-- persist breakpoint
local bp_base_dir = os.getenv("HOME") .. "/.cache/dap-breakpoint/"
local breakpoints = require('dap.breakpoints')

function M.store_breakpoints()
  local fs = require("user.utils.fs")
  -- create breakpoints store
  if not fs.file_exists(bp_base_dir) then
    os.execute("mkdir -p " .. bp_base_dir)
  end

  -- save current buffer breakpoints
  local bps = {}
  local breakpoints_by_buf = breakpoints.get()
  for buf, buf_bps in pairs(breakpoints_by_buf) do
    if buf == vim.api.nvim_buf_get_number(0) then
      bps[vim.api.nvim_buf_get_name(buf)] = buf_bps
    end
  end

  -- get current file name
  local buf_name = vim.api.nvim_buf_get_name(0)
  -- replace '/' with '-'
  buf_name = buf_name:gsub("/", "-")
  local fp = io.open(bp_base_dir .. buf_name:sub(2, #buf_name) .. '.json', 'w')

  -- write bps into json file
  local json_str = vim.fn.json_encode(bps)
  if json_str ~= nil then
    fp:write(json_str)
  end
  fp:close()
end

function M.load_breakpoints()
  -- build bps json file
  local buf_name = vim.api.nvim_buf_get_name(0)
  buf_name = buf_name:gsub("/", "-")
  local fp = io.open(bp_base_dir .. buf_name:sub(2, #buf_name) .. '.json', 'r')
  if fp == nil then
    return
  end

  -- read breakpoints from json file
  local content = fp:read('*a')
  local bps = vim.fn.json_decode(content)
  for bufname, buf_bps in pairs(bps) do
    if vim.api.nvim_buf_get_name(0) == bufname then
      local bufnr = vim.api.nvim_buf_get_number(0)
      for _, bp in pairs(buf_bps) do
        local line = bp.line
        local opts = {
          condition = bp.condition,
          log_message = bp.logMessage,
          hit_condition = bp.hitCondition
        }
        breakpoints.set(opts, bufnr, line)
      end
    end
  end
end

return M
