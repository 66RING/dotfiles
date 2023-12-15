local map_key = vim.api.nvim_set_keymap

-- dap
local opts = { noremap = true, silent = true }
map_key("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint() ; require'user.dap.dap-util'.store_breakpoints()<cr>", opts)
map_key("n", "<leader>dB", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input '[Condition] > ') ; require'user.dap.dap-util'.store_breakpoints()<cr>", opts)
map_key("n", "<leader>dk", "<cmd>lua require'dapui'.eval()<cr>", opts)
map_key("n", "<F4>", "<cmd>lua require'dap'.terminate() ; require('dapui').close()<cr>", opts)
map_key('n', '<F5>', '<cmd>lua require"user.dap.dap-util".reload_continue()<CR>', opts)
map_key("n", "<F6>", "<cmd>lua require'dap'.run_last()<cr>", opts)
map_key("n", "<F7>", "<cmd>lua require'dap'.step_over()<cr>", opts)
map_key("n", "<F8>", "<cmd>lua require'dap'.step_into()<cr>", opts)
map_key("n", "<F9>", "<cmd>lua require'dap'.step_out()<cr>", opts)
map_key("n", "<F10>", "<cmd>lua require'dap'.continue()<cr>", opts)
