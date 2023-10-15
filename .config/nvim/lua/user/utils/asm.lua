local M = {}
local tools=os.getenv("HOME")..'/.config/nvim/cross/asm'
local dosbox="dosbox -conf "..os.getenv("XDG_CONFIG_HOME")..'/dosbox/dosbox.conf'


M.commands = function(asm, action)
  local cmd = { dosbox }
  local template = " -c '%s'"
  local workspace=vim.fn.expand("%:p:h")
  local filename=vim.fn.expand("%:t:r")

  vim.cmd("silent !rm "..workspace.."/".."*.EXE")
  vim.cmd("silent !rm "..workspace.."/".."*.OBJ")

  local env={
	"mount c: "..tools,
	"mount d: "..workspace,
	"d:",
	"set PATH=c:\\masm;c:\\tasm",
  }

  local build = {
	masm = {
	  "masm "..filename..".ASM; >d:\\ASM.LOG ",
	  "if exist "..filename..".OBJ link "..filename..".OBJ; >d:\\LINK.LOG",
	  -- "masm "..filename..".ASM; ",
	  -- "if exist "..filename..".OBJ link "..filename..".OBJ;",
	  "@type d:\\LINK.LOG",
	},
	tasm = {
	  "tasm /zi "..filename..".ASM >d:\\ASM.LOG ",
	  -- "tasm /zi "..filename..".ASM",
	  "@type d:\\ASM.LOG",
	  "if exist "..filename..".OBJ tlink /v/3 "..filename..".obj >d:\\LINK.LOG ",
	  -- "if exist "..filename..".OBJ tlink /v/3 "..filename..".obj",
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
