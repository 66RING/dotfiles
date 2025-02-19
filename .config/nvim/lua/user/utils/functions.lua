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
  local cmd = os.getenv("FCITX_VERSION").."-remote"
  if tonumber(vim.fn.system(cmd)) == 2 then
    M.input_toggle = 2
    os.execute(cmd.." -c")
  end
end

function M.fcitx2cn()
  local cmd = os.getenv("FCITX_VERSION").."-remote"
  if tonumber(vim.fn.system(cmd)) ~= 2 and M.input_toggle == 1 then
    M.input_toggle = 2
    os.execute(cmd.." -o")
  end
end

--
-- magic bang!
-- parse magic bang command at ten first line
-- e.g. // bang!:run:term g++ -mavx2 -std=c++20 -g3 -fsanitize=address -fopenmp %:p -o %< && %:p:r
--
function M.parse_bang(filename, keyword)
  local file = io.open(filename, "r")
  if not file then
      print("Can not open file"..filename)
      return nil
  end

  local cnt = 0
  for line in file:lines() do
      if cnt > 10 then
        break
      end
      cnt = cnt + 1

      if line then
        -- parse bang!:keyword:command
        local pattern = "([^%s]-)bang!:"..keyword..":(.+)"
        local _, command = line:match(pattern)
        return command
      else
        break
      end
  end
  return nil
end


--
-- quick run
--
function M.run_code()
  --- Check if a file or directory exists in this path
  local function exists(file)
     local ok, err, code = os.rename(file, file)
     if not ok then
        if code == 13 then
           -- Permission denied, but it exists
           return true
        end
     end
     return ok, err
  end

  --- Check if a directory exists in this path
  local function isdir(path)
     -- "/" works on both Unix and Windows
     return exists(path.."/")
  end

  local cmd = {
	-- build and run
    c = "term gcc -mavx2 -g3 -fsanitize=address -l pthread %:p -o %< && %:p:r",
    cpp = "term g++ -mavx2 -std=c++20 -g3 -fsanitize=address %:p -o %< && %:p:r",
    cuda = "term nvcc -arch=compute_80 -code=sm_80  -l pthread %:p -o %< && %:p:r",
    java = "term javac %:p && java %:p:t:r",
	--------
    -- c = "term %:p:r",
    -- cpp = "term %:p:r",
    -- java = "term java %:p:t:r",
    rust = "term cargo run --bin %:t:r",
    python = "term python %:p",
    typescript = "term ts-node %:p",
    javascript = "term node %:p",
    sh = "term bash %:p",
    vim = "term source %:p",
    go = "term go run %:p",
    lua = "term lua %:p",
    processing = "term processing-java --sketch='"..vim.fn.trim(vim.fn.system('pwd')).."' --output='"..vim.fn.trim(vim.fn.system('pwd')).."/bin' --force --run",
    asm = "term "..require("user.utils.asm").commands("masm", 'run'),
  }
  if not isdir("./src/bin") then
    cmd.rust = "term cargo run"
  end

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
    vim.cmd("20sp")
    -- try to run magic bang command
    local magic_bang = M.parse_bang(vim.fn.expand("%:p"), "run")
    if magic_bang ~= nil then
      vim.cmd(magic_bang)
    else
      vim.cmd(cmd[file_type])
    end
  else
    print("nothing to run")
  end
end

--
-- quick build
--
function M.build_code()
  local cmd = {
    c = "term gcc -g3 -fsanitize=address -l pthread %:p -o %<",
    cpp = "term g++ -std=c++20 -g3 -fsanitize=address %:p -o %<",
    cuda = "term nvcc -arch=compute_80 -code=sm_80 -std=c++20 %:p -o %<",
    java = "term javac %:p",
    typescript = "term tsc %:p",
    lua = "term luac %:p",
    wast = "term wat2wasm %:p",
    processing = "term processing-java --sketch='"..vim.fn.trim(vim.fn.system('pwd')).."' --output='"..vim.fn.trim(vim.fn.system('pwd')).."/bin' --force --build"
  }
  local file_type = vim.bo.filetype
  if cmd[file_type] ~= nil then
    vim.cmd("w")
    vim.o.splitbelow = true
    vim.cmd("20sp")
    -- try to run magic bang command
    local magic_bang = M.parse_bang(vim.fn.expand("%:p"), "build")
    if magic_bang ~= nil then
      vim.cmd(magic_bang)
    else
      vim.cmd(cmd[file_type])
    end
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
    asm = "term "..require("user.utils.asm").commands('masm', 'debug')
  }
  local file_type = vim.bo.filetype
  if cmd[file_type] ~= nil then
    vim.cmd("w")
    vim.o.splitbelow = true
    vim.cmd("20sp")
    -- try to run magic bang command
    local magic_bang = M.parse_bang(vim.fn.expand("%:p"), "debug")
    if magic_bang ~= nil then
      vim.cmd(magic_bang)
    else
      vim.cmd(cmd[file_type])
    end
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

  vim.cmd[[setl wfw]]
  vim.cmd[[setl wfh]]
  -- -- float term plugin
  -- require("FTerm").toggle()
end

function M.reload_config()
  for name,_ in pairs(package.loaded) do
    if name:match('^cnull') then
      package.loaded[name] = nil
    end
  end

  vim.cmd("source "..vim.env.MYVIMRC)
end



return M

