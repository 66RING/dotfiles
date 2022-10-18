local M = {
  toggle = true,
}

-- nvim7 required
function M.toggle_diagnostics()
  if M.toggle  == true then
	vim.diagnostic.config({
	  float = false,
	  signs = false,
	  underline = false,
	  virtual_text = false
	})
	M.toggle = false
  else
	vim.diagnostic.config({
	  float = true,
	  signs = true,
	  underline = true,
	  virtual_text = true
	})
	M.toggle = true
  end
end

return M
