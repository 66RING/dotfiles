local map_key = vim.api.nvim_set_keymap
-- local mapper = require('keymap.mapper')
-- local keymap = mapper.map_cmd
require("keymap.global_functions")


--
-- global_utils
--
map_key('n', 'gx', [[<cmd>lua require("utils.functions").handle_url()<CR>]], {noremap=true})
map_key('n', 'st', [[<cmd>lua require("utils.functions").toggle_term()<CR>]], {noremap=true})

-- nvim tree
-- map_key('n', 'tT', "<cmd>NvimTreeFindFileToggle<CR>", {noremap=true})

-- telescope.nvim
map_key('n', '<C-f>', "<cmd>Telescope find_files hidden=true follow=true<CR>", {noremap=true})
map_key('n', '<C-p>', "<cmd>Telescope live_grep<CR>", {noremap=true})
map_key('n', '<C-c>', "<cmd>Telescope live_grep cwd=%:p:h<CR>", {noremap=true})
map_key('n', '<C-h>', "<cmd>Telescope oldfiles<CR>", {noremap=true})
-- map_key('n', 'tT', "<cmd>Telescope file_browser hidden=true cwd=%:p:h<CR>", {noremap=true})
-- map_key('n', 'tT', "<cmd>lua require 'telescope'.extensions.file_browser.file_browser({cwd=vim.fn.expand('%:p:h')})<CR>", {noremap=true})
map_key('n', 'tT', "<cmd>TelescopeFB<CR>", {noremap=true})
map_key('n', 'tt', "<cmd>Telescope buffers<CR>", {noremap=true})
-- map_key('n', 'tp', "<cmd>Telescope projects<CR>", {noremap=true})
map_key('n', '<LEADER>;', "<cmd>Telescope command_history<CR>", {noremap=true})
map_key('n', '<LEADER>:', "<cmd>Telescope commands<CR>", {noremap=true})

-- lspsaga
map_key('n', 'gr', [[<cmd>Lspsaga lsp_finder<CR>]], {silent=true, noremap=true})
map_key("n", "gD", "<cmd>Lspsaga preview_definition<CR>", { silent = true })
map_key("n", "<leader>cd", "<cmd>Lspsaga show_line_diagnostics<CR>", { silent = true })

-- Outline
vim.api.nvim_set_keymap('n', 'T', [[:<C-u>SymbolsOutline<CR>]], {noremap=true})

