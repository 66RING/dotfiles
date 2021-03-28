local function check_back_space()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  -- elseif vim.fn.call("vsnip#available", {1}) == 1 then
  --   return t "<Plug>(vsnip-expand-or-jump)"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn['compe#complete']()
  end
end

_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  -- elseif vim.fn.call("vsnip#jumpable", {-1}) == 1 then
  --   return t "<Plug>(vsnip-jump-prev)"
  else
    return t "<S-Tab>"
  end
end


_G.handle_url = function()
  local uri = vim.fn.matchstr(vim.fn.getline("."), "[a-z]*://[^ >,;#]*")
  if uri ~= "" then
    local cmd = "silent !"..os.getenv("BROWSER").." '"..uri.."'"
    vim.cmd(cmd)
  else
    print("No URI found in line.")
  end
end

_G.smart_split = function (cmd)
  if vim.fn.winnr('$')>=4 or vim.fn.winwidth(0) < 120 then
    vim.cmd(cmd)
  else
    vim.cmd [[setlocal splitright]]
    vim.cmd [[vsplit]]
    vim.cmd(cmd)
  end
end






