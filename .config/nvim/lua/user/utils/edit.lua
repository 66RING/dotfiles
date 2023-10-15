local M = {}

M.img_to_url = function (scope, root_path)
  if root_path == nil then
	root_path = os.getenv("HOME")..[[/Documents]]
  end

  if scope == nil then
	scope = "%"
  end

  local target = string.gmatch(vim.fn.expand("%:p:r"), root_path.."(.*)")()
  if target == nil then
	print("nothing match")
	return
  end

  local t = {}
  -- /path -> \/path
  for str in string.gmatch(target, "([^/]+)") do
	str = "\\/"..str
	table.insert(t, str)
  end
  target = table.concat(t)

  local prefix = scope..[[s/\(<img src="\)\.\/\(.\{-}\)\(".*\)/]]
  local repo_url = [[https:\/\/raw.githubusercontent.com\/66RING\/66RING\/master\/.github\/images]]..target
  local substitute = "\\1"..repo_url.."\\/\\2\\3"
  local cmd = prefix..substitute
  vim.cmd(cmd)
end

return M
