local map_key = vim.api.nvim_set_keymap
local opts

require("keymap.global_functions")

-- global_utils
map_key('n', 'gx', [[<cmd>call v:lua.handle_url()<CR>]], {noremap=true})

-- telescope.nvim
map_key('n', '<C-f>', "<cmd>Telescope find_files<cr>", {noremap=true})
map_key('n', '<C-h>', "<cmd>Telescope oldfiles<cr>", {noremap=true})
map_key('n', 'tT', "<cmd>Telescope buffers<cr>", {noremap=true})
map_key('n', '<LEADER>;', "<cmd>Telescope command_history<cr>", {noremap=true})
map_key('n', '<LEADER>:', "<cmd>Telescope commands<cr>", {noremap=true})

-- vim-clap
--
-- opts = {noremap=true}
-- map_key('n', '<C-f>', [[:<C-u>Clap filer %:p:h<CR>]], opts)
-- map_key('n', '<C-h>', [[:<C-u>Clap history<CR>]], opts)
-- map_key('n', 'tT', [[:<C-u>Clap buffers<CR>]], opts)
-- map_key('n', '<LEADER>;', [[:<C-u>Clap hist:<CR>]], opts)
-- map_key('n', '<LEADER>:', [[:<C-u>Clap command<CR>]], opts)


