local map_key = vim.api.nvim_set_keymap
-- local mapper = require('keymap.mapper')
-- local keymap = mapper.map_cmd
require("keymap.global_functions")


--
-- global_utils
--
map_key('n', 'gx', [[<cmd>lua require("utils.functions").handle_url()<CR>]], {noremap=true})
map_key('n', 'st', [[<cmd>lua require("utils.functions").toggle_term()<CR>]], {noremap=true})

-- telescope.nvim
map_key('n', '<C-f>', "<cmd>Telescope find_files hidden=true follow=true<CR>", {noremap=true})
map_key('n', '<C-p>', "<cmd>Telescope live_grep<CR>", {noremap=true})
map_key('n', '<C-c>', "<cmd>Telescope live_grep cwd=%:p:h<CR>", {noremap=true})
map_key('n', '<C-h>', "<cmd>Telescope oldfiles<CR>", {noremap=true})
map_key('n', 'tT', "<cmd>Telescope file_browser hidden=true cwd=%:p:h<CR>", {noremap=true})
map_key('n', 'tt', "<cmd>Telescope buffers<CR>", {noremap=true})
map_key('n', '<LEADER>;', "<cmd>Telescope command_history<CR>", {noremap=true})
map_key('n', '<LEADER>:', "<cmd>Telescope commands<CR>", {noremap=true})

--
-- fzf.vim
--
-- map_key('n', '<C-f>', "<cmd>Files<CR>", {noremap=true})
-- map_key('n', '<C-p>', "<cmd>Rg<CR>", {noremap=true})
-- map_key('n', '<C-c>', "<cmd>Rgpwd<CR>", {noremap=true})
-- map_key('n', '<C-h>', "<cmd>History<CR>", {noremap=true})
-- -- map_key('n', 'tt', "<cmd>Telescope file_browser hidden=true cwd=%:p:h<CR>", {noremap=true})
-- map_key('n', 'tt', "<cmd>Buffers<CR>", {noremap=true})
-- map_key('n', '<LEADER>;', "<cmd>History:<CR>", {noremap=true})
-- map_key('n', '<LEADER>:', "<cmd>Commands<CR>", {noremap=true})






























-- local mapping = {
--   -- global_utils
--   ["n|gx"]      = keymap([[<cmd>call v:lua.handle_url()<cr>]]):noremap(),

--   -- telescope.nvim
--   ["n|<C-f>"]      = keymap([[<cmd>Telescope find_files<CR>]]):noremap(),
--   ["n|<C-h>"]      = keymap([[<cmd>Telescope oldfiles<CR>]]):noremap(),
--   ["n|tt"]      = keymap([[<cmd>Telescope file_browser hidden=true<CR>]]):noremap(),
--   ["n|tT"]      = keymap([[<cmd>Telescope buffers<CR>]]):noremap(),
--   ["n|<LEADER>;"]      = keymap([[<cmd>Telescope command_history<CR>]]):noremap(),
--   ["n|<LEADER>:"]      = keymap([[<cmd>Telescope commands<CR>]]):noremap(),

-- }

-- mapper.nvim_set_keymap(mapping)

