local M = {}

-- return true if file exist
M.file_exists = function(filename)
   local f=io.open(filename,"r")
   if f~=nil then io.close(f)
	 return true
   else
	 return false
   end
end

return M
