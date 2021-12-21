local M = {
  input_toggle = 1,
  term_bufnr = nil
}

M.handle_url = function()
  local uri = vim.fn.matchstr(vim.fn.getline("."), "[a-z]*://[^ >,;#()]*")
  if uri ~= "" then
    local cmd = "silent !"..os.getenv("BROWSER").." '"..uri.."' &"
    vim.cmd(cmd)
  else
    print("No URI found in line.")
  end
end

-- M.smart_split = function (cmd)
--   if vim.fn.winnr('$')>=4 or vim.fn.winwidth(0) < 120 then
--     vim.cmd(cmd)
--   else
--     vim.cmd [[setlocal splitright]]
--     vim.cmd [[vsplit]]
--     vim.cmd(cmd)
--   end
-- end

--
-- fcitx auto switch
--
function M.fcitx2en()
  if tonumber(vim.fn.system("fcitx5-remote")) == 2 then
    M.input_toggle = 2
    os.execute("fcitx5-remote -c")
  end
end

function M.fcitx2cn()
  if tonumber(vim.fn.system("fcitx5-remote")) ~= 2 and M.input_toggle == 1 then
    M.input_toggle = 2
    os.execute("fcitx5-remote -o")
  end
end


--
-- quick run
--
function M.run_code()
  local cmd = {
    c = "term %:p:r",
    cpp = "term %:p:r",
    rust = "term cargo run",
    python = "term python %:p",
    java = "term java %:p:t:r",
    sh = "term bash %:p",
    vim = "term source %:p",
    go = "term go run %:p",
    lua = "term lua %:p",
    processing = "term processing-java --sketch='"..vim.fn.trim(vim.fn.system('pwd')).."' --output='"..vim.fn.trim(vim.fn.system('pwd')).."/bin' --force --run",
    asm = "term "..require("utils.asm").commands("masm", 'run'),
  }
  local cmd_without_split = {
    html = "silent ! "..os.getenv("BROWSER").." %:p &",
    markdown = "MarkdownPreview",
    vimwiki = "MarkdownPreview",
  }
  local file_type = vim.bo.filetype
  if cmd_without_split[file_type] ~= nil then
    vim.cmd(cmd_without_split[file_type])
  elseif cmd[file_type] ~= nil then
    vim.cmd("w")
    vim.o.splitbelow = true
    vim.cmd("sp")
    vim.cmd(cmd[file_type])
  else
    print("nothing to run")
  end
end

--
-- quick build
--
function M.build_code()
  local cmd = {
    c = "term gcc -g -l pthread %:p -o %<",
    cpp = "term g++ -g %:p -o %<",
    java = "term javac %:p",
    typescript = "term tsc %:p",
    lua = "term luac %:p",
    processing = "term processing-java --sketch='"..vim.fn.trim(vim.fn.system('pwd')).."' --output='"..vim.fn.trim(vim.fn.system('pwd')).."/bin' --force --build"
  }
  local file_type = vim.bo.filetype
  if cmd[file_type] ~= nil then
    vim.cmd("w")
    vim.o.splitbelow = true
    vim.cmd("sp")
    vim.cmd(cmd[file_type])
  else
    print("nothing to run")
  end
end

--
-- debug with gdb
--
function M.debug_code()
  local cmd = {
    c = "term gdb -q %:p:r",
    cpp = "term gdb -q %:p:r",
    asm = "term "..require("utils.asm").commands('masm', 'debug')
  }
  local file_type = vim.bo.filetype
  if cmd[file_type] ~= nil then
    vim.cmd("w")
    vim.o.splitbelow = true
    vim.cmd("sp")
    vim.cmd(cmd[file_type])
  else
    print("nothing to run")
  end
end

--
-- find doc
--
function M.find_doc()
  local cmd = {
    python = "term python -c \"help('"..vim.fn.expand("<cword>").."')\" | cat",
    vim = "h "..vim.fn.expand("<cword>"),
  }
  local file_type = vim.bo.filetype
  if file_type == "vim" then
    vim.cmd(cmd[file_type])
  elseif cmd[file_type] ~= nil then
    vim.cmd("w")
    vim.o.splitbelow = false
    vim.cmd("sp")
    vim.cmd(cmd[file_type])
  else
    vim.cmd(cmd["vim"])
  end
end

--
-- toggle term window
--
function M.toggle_term()
  vim.o.splitbelow = true
  vim.cmd[[10sp]]

  if vim.fn.bufexists(M.term_bufnr) == 1 then
  vim.cmd("buffer "..M.term_bufnr)
  else
  vim.cmd[[term]]
  M.term_bufnr = vim.fn.bufnr()
  end

  -- -- float term plugin
  -- require("FTerm").toggle()
end



return M

