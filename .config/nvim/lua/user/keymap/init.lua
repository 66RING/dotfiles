--
-- global_utils
--
-- vim.keymap.set('n', 'gx', [[<cmd>lua require("user.utils.functions").handle_url()<CR>]], {noremap=true}) -- use default
vim.keymap.set('n', 'st', function() require('flex_plane').toggle('zsh', { desc = "Open term.", position = "bottom", default_height=8 }) end, { desc = "Open term.", noremap=true})

-- nvim tree
vim.keymap.set('n', 'tT', "<cmd>NvimTreeFindFileToggle<CR>", {noremap=true})

-- telescope.nvim
vim.keymap.set('n', '<C-f>', "<cmd>Telescope find_files hidden=true follow=true<CR>", {noremap=true})
vim.keymap.set('n', '<C-p>', "<cmd>Telescope live_grep<CR>", {noremap=true})
vim.keymap.set('n', '<C-c>', "<cmd>Telescope live_grep cwd=%:p:h<CR>", {noremap=true})
vim.keymap.set('n', '<C-h>', "<cmd>Telescope oldfiles<CR>", {noremap=true})
-- vim.keymap.set('n', 'tT', "<cmd>Telescope file_browser hidden=true cwd=%:p:h<CR>", {noremap=true})
-- vim.keymap.set('n', 'tT', "<cmd>lua require 'telescope'.extensions.file_browser.file_browser({cwd=vim.fn.expand('%:p:h')})<CR>", {noremap=true})
-- vim.keymap.set('n', 'tT', "<cmd>TelescopeFB<CR>", {noremap=true})
vim.keymap.set('n', 'tt', "<cmd>Telescope buffers<CR>", {noremap=true})
-- vim.keymap.set('n', 'tp', "<cmd>Telescope projects<CR>", {noremap=true})
vim.keymap.set('n', '<LEADER>;', "<cmd>Telescope command_history<CR>", {noremap=true})
vim.keymap.set('n', '<LEADER>:', "<cmd>Telescope commands<CR>", {noremap=true})

-- clipboard-image.nvim
vim.keymap.set("n", "<LEADER>p", "<cmd>PasteImg<CR>", { silent = true })

-- Outline
vim.keymap.set('n', 'T', [[:<C-u>SymbolsOutline<CR>]], {noremap=true})


