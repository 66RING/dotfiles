local map_key = vim.api.nvim_set_keymap
-- local mapper = require('keymap.mapper')
-- local keymap = mapper.map_cmd
require("keymap.global_functions")


-- global_utils
map_key('n', 'gx', [[<cmd>lua require("utils.functions").handle_url()<CR>]], {noremap=true})

-- telescope.nvim
map_key('n', '<C-f>', "<cmd>Telescope find_files<cr>", {noremap=true})
map_key('n', '<C-h>', "<cmd>Telescope oldfiles<cr>", {noremap=true})
map_key('n', 'tt', "<cmd>Telescope file_browser hidden=true<cr>", {noremap=true})
map_key('n', 'tT', "<cmd>Telescope buffers<cr>", {noremap=true})
map_key('n', '<LEADER>;', "<cmd>Telescope command_history<cr>", {noremap=true})
map_key('n', '<LEADER>:', "<cmd>Telescope commands<cr>", {noremap=true})


-- local mapping = {
--   -- global_utils
--   ["n|gx"]      = keymap([[<cmd>call v:lua.handle_url()<CR>]]):noremap(),

--   -- telescope.nvim
--   ["n|<C-f>"]      = keymap([[<cmd>Telescope find_files<cr>]]):noremap(),
--   ["n|<C-h>"]      = keymap([[<cmd>Telescope oldfiles<cr>]]):noremap(),
--   ["n|tt"]      = keymap([[<cmd>Telescope file_browser hidden=true<cr>]]):noremap(),
--   ["n|tT"]      = keymap([[<cmd>Telescope buffers<cr>]]):noremap(),
--   ["n|<LEADER>;"]      = keymap([[<cmd>Telescope command_history<cr>]]):noremap(),
--   ["n|<LEADER>:"]      = keymap([[<cmd>Telescope commands<cr>]]):noremap(),

-- }

-- mapper.nvim_set_keymap(mapping)

