local M = {}
local tools=os.getenv("HOME")..'/.vscode-insiders/extensions/xsro.masm-tasm-0.9.0/tools'
local dosbox="dosbox -conf "..os.getenv("XDG_CONFIG_HOME")..'/dosbox/dosbox.conf'
local workspace=vim.fn.expand("%:p:h")
local filename=vim.fn.expand("%<")

local env={
  "mount c: "..tools,
  "mount d: "..workspace,
  "d:",
  "set path=c:\\masm;c:\\tasm",
}

local build = {
  masm = {
	"set path=c:\\masm",
	"masm "..filename..".ASM; >d:\\ASM.LOG ",
	"if exist "..filename..".OBJ link "..filename..".OBJ; >d:\\LINK.LOG",
	"@type d:\\LINK.LOG",
  },
  tasm = {
	"set path=c:\\tasm",
	"tasm /zi "..filename..".ASM >d:\\ASM.LOG ",
	"@type d:\\ASM.LOG",
	"if exist "..filename..".OBJ tlink /v/3 "..filename..".obj >d:\\LINK.LOG ",
	"@type d:\\LINK.LOG"
  }
}

local mode = {
  run = {
	"@if not exist "..filename..".exe exit ",
	filename..".exe",
	"@echo (END)Here is the end of the program output"
  },
  tasm_debug={
	"if exist "..filename..".exe c:\\tasm\\TD "..filename..".exe"
  },
  masm_debug={
	"if exist "..filename..".exe c:\\masm\\debug "..filename..".exe"
  }
}

M.commands = function(asm, action)
  local cmd = { dosbox }
  local template = " -c '%s'"
  -- environment
  for _,v in ipairs(env) do
	cmd[#cmd+1]=template:format(v)
  end

  -- build with 'asm' tool
  for _,v in ipairs(build[asm]) do
	cmd[#cmd+1]=template:format(v)
  end

  -- run/debug
  if action == 'debug' then
	action = asm.."_"..action
  end
  for _,v in ipairs(mode[action]) do
	cmd[#cmd+1]=template:format(v)
  end
  return table.concat(cmd)
end

return M
