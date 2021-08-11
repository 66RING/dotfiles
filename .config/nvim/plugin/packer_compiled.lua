-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/ring/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/ring/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/ring/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/ring/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/ring/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["bookmarks-nvim"] = {
    commands = { "BookmarksToggle" },
    loaded = false,
    needs_bufread = false,
    path = "/home/ring/.local/share/nvim/site/pack/packer/opt/bookmarks-nvim"
  },
  ["bullets.vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/ring/.local/share/nvim/site/pack/packer/opt/bullets.vim"
  },
  ["dashboard-nvim"] = {
    config = { "\27LJ\2\n�\21\0\0\4\0\18\0\0256\0\0\0009\0\1\0005\1\3\0=\1\2\0006\0\0\0009\0\4\0'\2\5\0B\0\2\0016\0\0\0009\0\1\0005\1\n\0005\2\b\0005\3\a\0=\3\t\2=\2\v\0015\2\r\0005\3\f\0=\3\t\2=\2\14\0015\2\16\0005\3\15\0=\3\t\2=\2\17\1=\1\6\0K\0\1\0\14find_file\1\0\1\fcommand'Telescope file_browser hidden=true\1\2\0\0\21 File Browser\17find_history\1\0\1\fcommand\23Telescope oldfiles\1\2\0\0\21ﭯ History     \17empty_buffer\1\0\0\16description\1\0\1\fcommand\tenew\1\2\0\0\21 Empty Buffer\29dashboard_custom_sectionLautocmd FileType dashboard nnoremap <silent><buffer> e :exec \"enew\"<CR>\bcmd\1\23\0\0\5\5\5�\1⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡜⢹⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀�\1⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⠃⠀⢻⡾⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀�\1⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⠀⠀⢸⣼⠁⠀⠀⠄⠹⣿⣆⠀⠀⡰⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀�\1⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⡀⠀⠀⠸⡄⢠⡿⠀⠀⣺⣿⢾⠀⠘⣿⣧⣼⠀⠀⠀⡰⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀�\1⠀⠀⠀⠀⠀⠀⠀⠐⢄⠀⠀⠀⢳⡀⣦⣹⣥⠆⠀⠀⠀⠈⠈⢀⠀⠈⣿⣷⡎⣰⠇⠀⠀⠀⠔⠀⠀⠀⠀⠀⠀⠀⠀�\1⠀⠀⠀⠀⠀⢀⠀⠀⠀⠈⠳⣄⢳⣼⣿⣿⠁⢀⣠⣲⣾⣿⣿⣾⣷⣦⡀⢿⣿⣴⢋⣤⠋⠀⠀⠀⢀⠀⠀⠀⠀⠀⠀�\1⠀⠀⠀⠀⠀⠀⠀⠉⠲⣤⡙⣶⣿⣿⡿⠀⠀⠀⠀⠀⢀⡀⢠⡠⠄⠀⠀⠀⢹⣿⣿⡞⣡⣴⠚⠁⠀⠀⠀⠀⠀⠀⠀�\1⠀⠀⠀⠀⠈⠒⠦⣤⣈⣻⣿⣿⣿⠏⠀⢀⢴⣾⣿⣿⡿⠿⠿⠿⣿⣽⣿⠦⠀⠹⣿⣿⣾⣋⣠⡤⠖⠂⠁⠀⠀⠀⠀�\1⠀⠀⠀⡀⠀⠀⡀⠒⠶⣾⣿⣿⠃⢀⣤⠟⠉⠀⠀⣠⣤⠀⠀⠀⠀⠀⠀⠀⠑⠀⠘⣿⢿⡶⠖⢀⠀⠀⠀⡀⠀⠀⠀�\1⠀⠀⠀⠀⠀⠀⠤⠤⣤⣿⡿⠀⠐⠀⢠⣶⡄⡀⣆⠸⠿⠀⠀⠀⢰⣸⡇⣾⣆⠀⠀⠀⣿⣷⣤⠤⠄⠀⠀⠀⠀⠀⠀�\1⠀⠀⠀⠒⠂⠉⠉⢹⣿⡟⢀⠤⠀⣼⣿⣿⣿⣆⠻⣯⣶⡶⠶⣿⡽⢋⣾⣿⡿⢀⣴⠇⠀⠿⢿⡉⠉⠉⠐⠂⠀⠀⠀�\1⠀⠀⠀⠀⠀⣀⣴⣿⠏⠀⠀⢤⣛⣶⣤⣍⣿⣿⣿⣿⣶⣶⣶⣾⣿⣿⣷⣿⣋⣴⣨⣖⡀⠀⠀⠸⣄⡀⠀⠀⠀⠀⠀�\1⠀⠀⠀⠀⢀⣾⢿⠃⠀⠀⠀⠼⡿⣷⣼⣧⣾⣦⢿⣿⣭⣭⣭⡴⠖⣻⣿⠶⢟⣉⣭⣶⠢⠄⠀⠀⠈⣦⠀⠀⠀⠀⠀�\1⠀⠀⠀⣠⠿⠟⠀⠀⠀⠀⠀⠀⢀⣀⣀⣠⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⡀⣷⠀⠀⠀⠀�\1⠀⠀⠀⠀⠀⠈⠈⢈⠜⠉⠉⠉⣸⠋⣼⢡⡟⣿⣿⢿⣿⣿⣿⣿⡿⡟⣿⠹⡌⢻⡀⠁⠀⠙⢄⠀⠀⠀⠀⠀⠀⠀⠀�\1⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠊⠀⠀⢠⠏⠰⠀⡿⢸⠀⡇⢸⠈⣇⠸⠀⢷⠀⠀⠈⢦⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀�\1⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠃⠀⠀⢰⠀⠀⠀⡇⠀⠀⢸⠀⠀⠀⢣⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀�\1⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ⠀⠀⠀⠀⠀⠂⠀⠀⠀⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀\5\28dashboard_custom_header\6g\bvim\0" },
    loaded = true,
    path = "/home/ring/.local/share/nvim/site/pack/packer/start/dashboard-nvim"
  },
  ["emmet-vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/ring/.local/share/nvim/site/pack/packer/opt/emmet-vim"
  },
  indentLine = {
    after_files = { "/home/ring/.local/share/nvim/site/pack/packer/opt/indentLine/after/plugin/indentLine.vim" },
    loaded = false,
    needs_bufread = false,
    path = "/home/ring/.local/share/nvim/site/pack/packer/opt/indentLine"
  },
  ["lspsaga.nvim"] = {
    config = { "\27LJ\2\n�\n\0\0\t\0#\0S6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\4\0005\4\3\0=\4\5\3B\1\2\0016\1\6\0009\1\a\0019\1\b\0015\2\t\0\18\3\1\0'\5\n\0'\6\v\0'\a\f\0\18\b\2\0B\3\5\1\18\3\1\0'\5\n\0'\6\r\0'\a\14\0\18\b\2\0B\3\5\1\18\3\1\0'\5\n\0'\6\15\0'\a\16\0\18\b\2\0B\3\5\1\18\3\1\0'\5\n\0'\6\17\0'\a\18\0\18\b\2\0B\3\5\1\18\3\1\0'\5\n\0'\6\19\0'\a\20\0\18\b\2\0B\3\5\1\18\3\1\0'\5\n\0'\6\21\0'\a\22\0\18\b\2\0B\3\5\1\18\3\1\0'\5\n\0'\6\23\0'\a\24\0\18\b\2\0B\3\5\1\18\3\1\0'\5\n\0'\6\25\0'\a\26\0\18\b\2\0B\3\5\1\18\3\1\0'\5\27\0'\6\25\0'\a\28\0\18\b\2\0B\3\5\1\18\3\1\0'\5\n\0'\6\29\0'\a\30\0\18\b\2\0B\3\5\1\18\3\1\0'\5\n\0'\6\31\0'\a \0\18\b\2\0B\3\5\0016\3\6\0009\3!\3'\5\"\0B\3\2\1K\0\1\0001command! Format lua vim.lsp.buf.formatting()\bcmdH<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>\14<LEADER>=H<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>\14<LEADER>-H<cmd>'<,'>lua require('lspsaga.codeaction').range_code_action()<CR>\6v=<cmd>lua require('lspsaga.codeaction').code_action()<CR>\14<LEADER>a=<cmd>lua require('lspsaga.hover').render_hover_doc()<CR>\14<LEADER>h8<cmd>lua require'lspsaga.provider'.lsp_finder()<CR>\agh@<cmd>lua require'lspsaga.provider'.preview_definition()<CR>\agDX<cmd>lua require(\"utils.functions\").smart_split('lua vim.lsp.buf.definition()')<CR>\agd4<cmd>lua require('lspsaga.rename').rename()<CR>\15<LEADER>rnE<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>\n<C-d>F<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>\n<C-u>\6n\1\0\2\fnoremap\2\vsilent\2\20nvim_set_keymap\bapi\bvim\23finder_action_keys\1\0\0\1\0\4\topen\f<enter>\vvsplit\6v\nsplit\6s\tquit\6q\18init_lsp_saga\flspsaga\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/ring/.local/share/nvim/site/pack/packer/opt/lspsaga.nvim"
  },
  ["markdown-preview.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/ring/.local/share/nvim/site/pack/packer/opt/markdown-preview.nvim"
  },
  ["nvim-bufferline.lua"] = {
    config = { "\27LJ\2\n�\5\0\0\b\0\26\0+6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\3\0005\4\4\0=\4\5\3=\3\a\0025\3\t\0005\4\b\0=\4\n\3=\3\v\2B\0\2\0016\0\f\0009\0\r\0009\0\14\0005\1\15\0\18\2\0\0'\4\16\0'\5\17\0'\6\18\0\18\a\1\0B\2\5\1\18\2\0\0'\4\16\0'\5\19\0'\6\20\0\18\a\1\0B\2\5\1\18\2\0\0'\4\16\0'\5\21\0'\6\22\0005\a\23\0B\2\5\1\18\2\0\0'\4\16\0'\5\24\0'\6\25\0\18\a\1\0B\2\5\1K\0\1\0]:lua if vim.tbl_count(vim.fn.getbufinfo({buflisted=true}))>1 then vim.cmd(\"bd\") end <CR>\nr<BS>\1\0\1\vsilent\2n:lua if vim.v.count~=0 then require\"bufferline\".go_to_buffer(vim.v.count) else vim.cmd(\"buffer #\")end<CR>\t<BS>\29:BufferLineCyclePrev<CR>\14<LEADER>[\29:BufferLineCycleNext<CR>\14<LEADER>]\6n\1\0\2\fnoremap\2\vsilent\2\20nvim_set_keymap\bapi\bvim\15highlights\20buffer_selected\1\0\0\1\0\2\nguifg\f#61AFEF\bgui\tbold\foptions\1\0\0\20separator_style\1\3\0\0\5\5\1\0\b\28show_buffer_close_icons\1\18modified_icon\b\17number_style\5\27always_show_bufferline\1\fnumbers\fordinal\rmappings\2\15close_icon\5\22buffer_close_icon\5\nsetup\15bufferline\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/ring/.local/share/nvim/site/pack/packer/opt/nvim-bufferline.lua"
  },
  ["nvim-colorizer.lua"] = {
    commands = { "ColorizerToggle" },
    config = { "\27LJ\2\n�\2\0\0\4\0\18\0\0216\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\0025\3\n\0=\3\v\0025\3\f\0=\3\r\0025\3\14\0=\3\15\0025\3\16\0=\3\17\2B\0\2\1K\0\1\0\thtml\1\0\1\tmode\15foreground\ttmux\1\0\1\nnames\1\bvim\1\0\1\nnames\1\vstylus\1\0\1\vrgb_fn\2\tsass\1\0\1\vrgb_fn\2\tscss\1\0\1\vrgb_fn\2\bcss\1\5\0\0\15javascript\20javascriptreact\15typescript\20typescriptreact\1\0\1\vrgb_fn\2\nsetup\14colorizer\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/ring/.local/share/nvim/site/pack/packer/opt/nvim-colorizer.lua"
  },
  ["nvim-compe"] = {
    after_files = { "/home/ring/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe.vim" },
    config = { "\27LJ\2\n�\4\0\0\a\0\19\0'6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\0016\0\6\0009\0\a\0009\0\b\0'\2\t\0B\0\2\0015\0\n\0006\1\6\0009\1\a\0019\1\v\1'\3\f\0'\4\r\0'\5\14\0\18\6\0\0B\1\5\0016\1\6\0009\1\a\0019\1\v\1'\3\f\0'\4\15\0'\5\16\0\18\6\0\0B\1\5\0016\1\6\0009\1\a\0019\1\v\1'\3\f\0'\4\17\0'\5\18\0\18\6\0\0B\1\5\1K\0\1\0\26compe#confirm('<CR>')\t<CR>\27v:lua.s_tab_complete()\f<S-TAB>\25v:lua.tab_complete()\n<TAB>\6i\20nvim_set_keymap\1\0\3\texpr\2\vsilent\2\fnoremap\2Zautocmd FileType clap_input,markdown call compe#setup({ 'autocomplete': v:false }, 0)\17nvim_command\bapi\bvim\vsource\1\0\b\rnvim_lua\2\rnvim_lsp\2\tpath\2\tcalc\2\ttags\2\nvsnip\2\nspell\1\vbuffer\2\1\0\6\14preselect\fdisable\25allow_prefix_unmatch\2\15min_length\3\1\ndebug\1\fenabled\2\17autocomplete\2\nsetup\ncompe\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/ring/.local/share/nvim/site/pack/packer/opt/nvim-compe"
  },
  ["nvim-lspconfig"] = {
    config = { "require('lsp.lspconfig')" },
    loaded = false,
    needs_bufread = false,
    path = "/home/ring/.local/share/nvim/site/pack/packer/opt/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n�\1\0\0\4\0\v\0\0196\0\0\0009\0\1\0009\0\2\0'\2\3\0B\0\2\0016\0\0\0009\0\1\0009\0\2\0'\2\4\0B\0\2\0016\0\5\0'\2\6\0B\0\2\0029\0\a\0005\2\t\0005\3\b\0=\3\n\2B\0\2\1K\0\1\0\14highlight\1\0\0\1\0\1\venable\2\nsetup\28nvim-treesitter.configs\frequire,set foldexpr=nvim_treesitter#foldexpr()\24set foldmethod=expr\17nvim_command\bapi\bvim\0" },
    loaded = false,
    needs_bufread = true,
    path = "/home/ring/.local/share/nvim/site/pack/packer/opt/nvim-treesitter"
  },
  ["nvim-treesitter-context"] = {
    config = { "\27LJ\2\nQ\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0002highlight NormalFloat ctermbg=NONE guibg=NONE\bcmd\bvim\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/ring/.local/share/nvim/site/pack/packer/opt/nvim-treesitter-context"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/ring/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/ring/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/ring/.local/share/nvim/site/pack/packer/opt/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/ring/.local/share/nvim/site/pack/packer/opt/popup.nvim"
  },
  ["tagalong.vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/ring/.local/share/nvim/site/pack/packer/opt/tagalong.vim"
  },
  ["telescope-fzy-native.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/ring/.local/share/nvim/site/pack/packer/opt/telescope-fzy-native.nvim"
  },
  ["telescope.nvim"] = {
    commands = { "Telescope" },
    config = { "\27LJ\2\n�\a\0\0\n\0*\0R6\0\0\0009\0\1\0009\0\2\0\14\0\0\0X\0\f�6\0\3\0009\0\4\0'\2\5\0B\0\2\0016\0\3\0009\0\4\0'\2\6\0B\0\2\0016\0\3\0009\0\4\0'\2\a\0B\0\2\0016\0\b\0'\2\t\0B\0\2\0029\0\n\0005\2#\0005\3\f\0005\4\v\0=\4\r\0035\4\14\0=\4\15\0036\4\b\0'\6\16\0B\4\2\0029\4\17\0049\4\18\4=\4\19\0036\4\b\0'\6\16\0B\4\2\0029\4\20\0049\4\18\4=\4\21\0036\4\b\0'\6\16\0B\4\2\0029\4\22\0049\4\18\4=\4\23\0035\4 \0005\5\26\0006\6\b\0'\b\24\0B\6\2\0029\6\25\6=\6\27\0056\6\b\0'\b\24\0B\6\2\0029\6\28\0066\a\b\0'\t\24\0B\a\2\0029\a\29\a \6\a\0066\a\b\0'\t\24\0B\a\2\0029\a\30\a \6\a\6=\6\31\5=\5!\4=\4\"\3=\3$\0025\3&\0005\4%\0=\4'\3=\3(\2B\0\2\0016\0\b\0'\2\t\0B\0\2\0029\0)\0'\2'\0B\0\2\1K\0\1\0\19load_extension\15extensions\15fzy_native\1\0\0\1\0\2\28override_generic_sorter\1\25override_file_sorter\2\rdefaults\1\0\0\rmappings\6i\1\0\0\n<C-j>\vcenter\19select_default\16move_to_top\n<esc>\1\0\0\nclose\22telescope.actions\21qflist_previewer\22vim_buffer_qflist\19grep_previewer\23vim_buffer_vimgrep\19file_previewer\bnew\19vim_buffer_cat\25telescope.previewers\25file_ignore_patterns\1\2\0\0\n.git/\18layout_config\1\0\4\28minimum_grep_characters\3\2\21sorting_strategy\14ascending\20selection_caret\n🛸 \18prompt_prefix\v 🚀 \1\0\1\20prompt_position\btop\nsetup\14telescope\frequire&packadd telescope-fzy-native.nvim\23packadd popup.nvim\25packadd plenary.nvim\bcmd\bvim\vloaded\17plenary.nvim\19packer_plugins\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/ring/.local/share/nvim/site/pack/packer/opt/telescope.nvim"
  },
  ["vim-commentary"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/ring/.local/share/nvim/site/pack/packer/opt/vim-commentary"
  },
  ["vim-cursorword"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/ring/.local/share/nvim/site/pack/packer/opt/vim-cursorword"
  },
  ["vim-dadbod"] = {
    loaded = true,
    path = "/home/ring/.local/share/nvim/site/pack/packer/start/vim-dadbod"
  },
  ["vim-dadbod-ui"] = {
    commands = { "DBUIToggle", "DBUIAddConnection", "DBUI", "DBUIFindBuffer", "DBUIRenameBuffer" },
    config = { "\27LJ\2\n�\2\0\0\f\0\14\1*6\0\0\0009\0\1\0'\2\2\0B\0\2\2'\1\3\0&\0\1\0004\1\0\0006\2\4\0009\2\5\0029\2\6\2\18\4\0\0B\2\2\2\t\2\0\0X\2\27�6\2\4\0009\2\5\0029\2\a\2\18\4\0\0B\2\2\0026\3\b\0\18\5\2\0B\3\2\4H\6\t�6\b\4\0009\b\5\b9\b\t\b\18\n\a\0'\v\n\0B\b\3\2:\t\1\b:\n\2\b<\n\t\1F\6\3\3R\6�6\3\v\0009\5\f\1B\3\2\0016\3\v\0009\5\r\1B\3\2\1L\1\2\0K\0\1\0\burl\tname\nprint\6,\nsplit\npairs\rreadfile\17filereadable\afn\bvim\r/.db_url\tHOME\vgetenv\aos\2�\1\1\0\5\0\r\0\0283\0\0\0006\1\1\0009\1\2\1'\2\4\0=\2\3\0016\1\1\0009\1\2\1)\2\1\0=\2\5\0016\1\1\0009\1\2\1)\2#\0=\2\6\0016\1\1\0009\1\2\0016\2\b\0009\2\t\2'\4\n\0B\2\2\2'\3\v\0&\2\3\2=\2\a\0016\1\1\0009\1\2\1\18\2\0\0B\2\1\2=\2\f\1K\0\1\0\bdbs /.cache/db_ui_save_location\tHOME\vgetenv\aos\24db_ui_save_location\19db_ui_winwidth\25db_ui_use_nerd_fonts\tleft\23db_ui_win_position\6g\bvim\0\0" },
    loaded = false,
    needs_bufread = true,
    path = "/home/ring/.local/share/nvim/site/pack/packer/opt/vim-dadbod-ui"
  },
  ["vim-easy-align"] = {
    keys = { { "", "<Plug>(EasyAlign)" } },
    loaded = false,
    needs_bufread = false,
    path = "/home/ring/.local/share/nvim/site/pack/packer/opt/vim-easy-align"
  },
  ["vim-easymotion"] = {
    keys = { { "", "<Plug>(easymotion-sn)" } },
    loaded = false,
    needs_bufread = false,
    path = "/home/ring/.local/share/nvim/site/pack/packer/opt/vim-easymotion"
  },
  ["vim-gitgutter"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/ring/.local/share/nvim/site/pack/packer/opt/vim-gitgutter"
  },
  ["vim-maximizer"] = {
    commands = { "MaximizerToggle" },
    loaded = false,
    needs_bufread = false,
    path = "/home/ring/.local/share/nvim/site/pack/packer/opt/vim-maximizer"
  },
  ["vim-surround"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/ring/.local/share/nvim/site/pack/packer/opt/vim-surround"
  },
  ["vim-table-mode"] = {
    loaded = false,
    needs_bufread = true,
    path = "/home/ring/.local/share/nvim/site/pack/packer/opt/vim-table-mode"
  },
  ["vim-translator"] = {
    keys = { { "", "<Plug>TranslateW" } },
    loaded = false,
    needs_bufread = false,
    path = "/home/ring/.local/share/nvim/site/pack/packer/opt/vim-translator"
  },
  ["vim-visual-multi"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/ring/.local/share/nvim/site/pack/packer/opt/vim-visual-multi"
  },
  ["vim-visual-star-search"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/ring/.local/share/nvim/site/pack/packer/opt/vim-visual-star-search"
  },
  ["vim-vsnip"] = {
    after = { "vim-vsnip-integ" },
    loaded = false,
    needs_bufread = false,
    path = "/home/ring/.local/share/nvim/site/pack/packer/opt/vim-vsnip"
  },
  ["vim-vsnip-integ"] = {
    after_files = { "/home/ring/.local/share/nvim/site/pack/packer/opt/vim-vsnip-integ/after/plugin/vsnip_integ.vim" },
    load_after = {
      ["vim-vsnip"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/ring/.local/share/nvim/site/pack/packer/opt/vim-vsnip-integ"
  },
  ["vista.vim"] = {
    commands = { "Vista" },
    loaded = false,
    needs_bufread = false,
    path = "/home/ring/.local/share/nvim/site/pack/packer/opt/vista.vim"
  },
  ["zephyr-nvim"] = {
    after = { "nvim-bufferline.lua" },
    loaded = true,
    only_config = true
  }
}

time([[Defining packer_plugins]], false)
-- Setup for: tagalong.vim
time([[Setup for tagalong.vim]], true)
try_loadstring('\27LJ\2\nL\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\3\0\0\bvue\twxml"tagalong_additional_filetypes\6g\bvim\0', "setup", "tagalong.vim")
time([[Setup for tagalong.vim]], false)
-- Setup for: bullets.vim
time([[Setup for bullets.vim]], true)
try_loadstring("\27LJ\2\n`\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\5\0\0\rmarkdown\ttext\14gitcommit\fscratch\31bullets_enabled_file_types\6g\bvim\0", "setup", "bullets.vim")
time([[Setup for bullets.vim]], false)
-- Setup for: vista.vim
time([[Setup for vista.vim]], true)
try_loadstring("\27LJ\2\n�\3\0\0\6\0\18\0!6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0'\1\5\0=\1\4\0006\0\0\0009\0\1\0'\1\a\0=\1\6\0006\0\0\0009\0\1\0)\1\1\0=\1\b\0006\0\0\0009\0\1\0)\1\1\0=\1\t\0006\0\0\0009\0\1\0005\1\v\0=\1\n\0006\0\0\0009\0\f\0009\0\r\0'\2\14\0'\3\15\0'\4\16\0005\5\17\0B\0\5\1K\0\1\0\1\0\1\fnoremap\2\22:<C-u>Vista!!<CR>\6T\6n\20nvim_set_keymap\bapi\1\0\5\vpandoc\rmarkdown\15typescript\rnvim_lsp\rmarkdown\btoc\fvimwiki\rmarkdown\20typescriptreact\rnvim_lsp\24vista_executive_for\31vista#renderer#enable_icon\29vista_disable_statusline\rmarkdown\28vista_vimwiki_executive\17floating_win\31vista_echo_cursor_strategy\nctags\28vista_default_executive\6g\bvim\0", "setup", "vista.vim")
time([[Setup for vista.vim]], false)
-- Setup for: vim-translator
time([[Setup for vim-translator]], true)
try_loadstring("\27LJ\2\n�\1\0\0\6\0\r\0\0216\0\0\0009\0\1\0005\1\3\0=\1\2\0006\0\0\0009\0\4\0009\0\5\0'\2\6\0'\3\a\0'\4\b\0005\5\t\0B\0\5\0016\0\0\0009\0\4\0009\0\5\0'\2\n\0'\3\a\0'\4\v\0005\5\f\0B\0\5\1K\0\1\0\1\0\1\vsilent\2\22<Plug>TranslateWV\6v\1\0\1\vsilent\2\21<Plug>TranslateW\ats\6n\20nvim_set_keymap\bapi\1\3\0\0\tbing\vgoogle\31translator_default_engines\6g\bvim\0", "setup", "vim-translator")
time([[Setup for vim-translator]], false)
-- Setup for: emmet-vim
time([[Setup for emmet-vim]], true)
try_loadstring("\27LJ\2\n�\2\0\0\3\0\r\0\0266\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0'\1\5\0=\1\4\0006\0\0\0009\0\1\0+\1\1\0=\1\6\0006\0\a\0009\0\b\0009\0\t\0\14\0\0\0X\0\b�6\0\0\0009\0\n\0'\2\v\0B\0\2\0016\0\0\0009\0\n\0'\2\f\0B\0\2\1K\0\1\0;autocmd FileType html,css,vue,wxml,js,jsx EmmetInstall\22packadd emmet-vim\bcmd\vloaded\14emmet-vim\19packer_plugins\30user_emmet_install_global\6,\26user_emmet_leader_key\bivn\20user_emmet_mode\6g\bvim\0", "setup", "emmet-vim")
time([[Setup for emmet-vim]], false)
-- Setup for: vim-easymotion
time([[Setup for vim-easymotion]], true)
try_loadstring("\27LJ\2\n�\1\0\0\6\0\t\0\r6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\4\0009\0\5\0'\2\6\0'\3\a\0'\4\b\0004\5\0\0B\0\5\1K\0\1\0\26<Plug>(easymotion-sn)\ass\6n\20nvim_set_keymap\bapi\boff\26EasyMotion_do_mapping\6g\bvim\0", "setup", "vim-easymotion")
time([[Setup for vim-easymotion]], false)
-- Setup for: indentLine
time([[Setup for indentLine]], true)
try_loadstring("\27LJ\2\n�\2\0\0\2\0\n\0\0216\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\1\0'\1\4\0=\1\3\0006\0\0\0009\0\1\0005\1\6\0=\1\5\0006\0\0\0009\0\1\0'\1\b\0=\1\a\0006\0\0\0009\0\1\0)\1\1\0=\1\t\0K\0\1\0$indentLine_showFirstIndentLevel\binc\29indentLine_concealcursor\1\f\0\0\tdefx\tjson\vdenite\rstartify\tdbui\15vista_kind\nvista\17coc-explorer\14dashboard\rchadtree\rmarkdown\31indentLine_fileTypeExclude\a¦\20indentLine_char\23indentLine_enabled\6g\bvim\0", "setup", "indentLine")
time([[Setup for indentLine]], false)
-- Setup for: vim-commentary
time([[Setup for vim-commentary]], true)
try_loadstring("\27LJ\2\n�\1\0\0\3\0\4\0\t6\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\0\0009\0\1\0'\2\3\0B\0\2\1K\0\1\0009autocmd FileType c,cpp setlocal commentstring=//\\ %s9autocmd FileType apache setlocal commentstring=#\\ %s\bcmd\bvim\0", "setup", "vim-commentary")
time([[Setup for vim-commentary]], false)
-- Setup for: vim-gitgutter
time([[Setup for vim-gitgutter]], true)
try_loadstring("\27LJ\2\n�\4\0\0\6\0\21\00016\0\0\0009\0\1\0)\1\0\0=\1\2\0006\0\0\0009\0\1\0)\1\0\0=\1\3\0006\0\0\0009\0\1\0)\1\0\0=\1\4\0006\0\0\0009\0\1\0)\1\1\0=\1\5\0006\0\0\0009\0\6\0009\0\a\0'\2\b\0'\3\t\0'\4\n\0005\5\v\0B\0\5\0016\0\0\0009\0\6\0009\0\a\0'\2\b\0'\3\f\0'\4\r\0005\5\14\0B\0\5\0016\0\0\0009\0\6\0009\0\a\0'\2\b\0'\3\15\0'\4\16\0005\5\17\0B\0\5\0016\0\0\0009\0\6\0009\0\a\0'\2\b\0'\3\18\0'\4\19\0005\5\20\0B\0\5\1K\0\1\0\1\0\1\fnoremap\2\27:GitGutterNextHunk<CR>\15<LEADER>g=\1\0\1\fnoremap\2\27:GitGutterPrevHunk<CR>\15<LEADER>g-\1\0\1\fnoremap\2\30:GitGutterPreviewHunk<CR>\15<LEADER>gh\1\0\1\fnoremap\2\23:GitGutterFold<CR>\15<LEADER>gf\6n\20nvim_set_keymap\bapi#gitgutter_preview_win_floating-gitgutter_override_sign_column_highlight\23gitgutter_map_keys\20gitgutter_signs\6g\bvim\0", "setup", "vim-gitgutter")
time([[Setup for vim-gitgutter]], false)
-- Setup for: vim-vsnip
time([[Setup for vim-vsnip]], true)
try_loadstring("\27LJ\2\n�\3\0\0\b\0\18\0&6\0\0\0009\0\1\0006\1\3\0009\1\4\1'\3\5\0B\1\2\2'\2\6\0&\1\2\1=\1\2\0006\0\0\0009\0\a\0009\0\b\0005\1\t\0\18\2\0\0'\4\n\0'\5\v\0'\6\f\0\18\a\1\0B\2\5\1\18\2\0\0'\4\r\0'\5\v\0'\6\f\0\18\a\1\0B\2\5\1\18\2\0\0'\4\r\0'\5\14\0'\6\15\0\18\a\1\0B\2\5\1\18\2\0\0'\4\r\0'\5\16\0'\6\17\0\18\a\1\0B\2\5\1K\0\1\0>vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)' : '<C-j>'\n<C-j>>vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)' : '<C-l>'\n<C-l>\6sBvsnip#available()  ? '<Plug>(vsnip-expand-or-jump)' : '<C-e>'\n<C-e>\6i\1\0\1\texpr\2\20nvim_set_keymap\bapi /.config/nvim/config/vsnips\tHOME\vgetenv\aos\22vsnip_snippet_dir\6g\bvim\0", "setup", "vim-vsnip")
time([[Setup for vim-vsnip]], false)
-- Setup for: vim-easy-align
time([[Setup for vim-easy-align]], true)
try_loadstring("\27LJ\2\n|\0\0\6\0\a\0\0176\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0004\5\0\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\6\0'\3\4\0'\4\5\0004\5\0\0B\0\5\1K\0\1\0\6n\22<Plug>(EasyAlign)\aga\6x\20nvim_set_keymap\bapi\bvim\0", "setup", "vim-easy-align")
time([[Setup for vim-easy-align]], false)
-- Setup for: vim-maximizer
time([[Setup for vim-maximizer]], true)
try_loadstring("\27LJ\2\n�\1\0\0\a\0\v\0\0265\0\0\0006\1\1\0009\1\2\0019\1\3\1'\3\4\0'\4\5\0'\5\6\0\18\6\0\0B\1\5\0016\1\1\0009\1\2\0019\1\3\1'\3\a\0'\4\5\0'\5\b\0\18\6\0\0B\1\5\0016\1\1\0009\1\2\0019\1\3\1'\3\t\0'\4\5\0'\5\n\0\18\6\0\0B\1\5\1K\0\1\0\30<C-o>:MaximizerToggle<CR>\6v\30<ESC>:MaximizerToggle<CR>\6i\25:MaximizerToggle<CR>\n<C-x>\6n\20nvim_set_keymap\bapi\bvim\1\0\2\fnoremap\2\vsilent\2\0", "setup", "vim-maximizer")
time([[Setup for vim-maximizer]], false)
-- Config for: zephyr-nvim
time([[Config for zephyr-nvim]], true)
try_loadstring("\27LJ\2\n�\3\0\0\3\0\b\0\0256\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\0\0009\0\1\0'\2\3\0B\0\2\0016\0\0\0009\0\1\0'\2\4\0B\0\2\0016\0\0\0009\0\1\0'\2\5\0B\0\2\0016\0\0\0009\0\1\0'\2\6\0B\0\2\0016\0\0\0009\0\1\0'\2\a\0B\0\2\1K\0\1\0Rautocmd FileType markdown source $HOME/.config/nvim/config/markdown_theme.vimVhighlight MatchParen cterm=bold ctermfg=black ctermbg=grey guifg=black guibg=grey@highlight Cursorline cterm=bold ctermbg=black guibg=#48515E1highlight SignColumn ctermbg=NONE guibg=NONE-highlight Normal ctermbg=NONE guibg=NONE\23colorscheme zephyr\bcmd\bvim\0", "config", "zephyr-nvim")
time([[Config for zephyr-nvim]], false)
-- Config for: dashboard-nvim
time([[Config for dashboard-nvim]], true)
try_loadstring("\27LJ\2\n�\21\0\0\4\0\18\0\0256\0\0\0009\0\1\0005\1\3\0=\1\2\0006\0\0\0009\0\4\0'\2\5\0B\0\2\0016\0\0\0009\0\1\0005\1\n\0005\2\b\0005\3\a\0=\3\t\2=\2\v\0015\2\r\0005\3\f\0=\3\t\2=\2\14\0015\2\16\0005\3\15\0=\3\t\2=\2\17\1=\1\6\0K\0\1\0\14find_file\1\0\1\fcommand'Telescope file_browser hidden=true\1\2\0\0\21 File Browser\17find_history\1\0\1\fcommand\23Telescope oldfiles\1\2\0\0\21ﭯ History     \17empty_buffer\1\0\0\16description\1\0\1\fcommand\tenew\1\2\0\0\21 Empty Buffer\29dashboard_custom_sectionLautocmd FileType dashboard nnoremap <silent><buffer> e :exec \"enew\"<CR>\bcmd\1\23\0\0\5\5\5�\1⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡜⢹⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀�\1⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⠃⠀⢻⡾⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀�\1⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⠀⠀⢸⣼⠁⠀⠀⠄⠹⣿⣆⠀⠀⡰⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀�\1⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⡀⠀⠀⠸⡄⢠⡿⠀⠀⣺⣿⢾⠀⠘⣿⣧⣼⠀⠀⠀⡰⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀�\1⠀⠀⠀⠀⠀⠀⠀⠐⢄⠀⠀⠀⢳⡀⣦⣹⣥⠆⠀⠀⠀⠈⠈⢀⠀⠈⣿⣷⡎⣰⠇⠀⠀⠀⠔⠀⠀⠀⠀⠀⠀⠀⠀�\1⠀⠀⠀⠀⠀⢀⠀⠀⠀⠈⠳⣄⢳⣼⣿⣿⠁⢀⣠⣲⣾⣿⣿⣾⣷⣦⡀⢿⣿⣴⢋⣤⠋⠀⠀⠀⢀⠀⠀⠀⠀⠀⠀�\1⠀⠀⠀⠀⠀⠀⠀⠉⠲⣤⡙⣶⣿⣿⡿⠀⠀⠀⠀⠀⢀⡀⢠⡠⠄⠀⠀⠀⢹⣿⣿⡞⣡⣴⠚⠁⠀⠀⠀⠀⠀⠀⠀�\1⠀⠀⠀⠀⠈⠒⠦⣤⣈⣻⣿⣿⣿⠏⠀⢀⢴⣾⣿⣿⡿⠿⠿⠿⣿⣽⣿⠦⠀⠹⣿⣿⣾⣋⣠⡤⠖⠂⠁⠀⠀⠀⠀�\1⠀⠀⠀⡀⠀⠀⡀⠒⠶⣾⣿⣿⠃⢀⣤⠟⠉⠀⠀⣠⣤⠀⠀⠀⠀⠀⠀⠀⠑⠀⠘⣿⢿⡶⠖⢀⠀⠀⠀⡀⠀⠀⠀�\1⠀⠀⠀⠀⠀⠀⠤⠤⣤⣿⡿⠀⠐⠀⢠⣶⡄⡀⣆⠸⠿⠀⠀⠀⢰⣸⡇⣾⣆⠀⠀⠀⣿⣷⣤⠤⠄⠀⠀⠀⠀⠀⠀�\1⠀⠀⠀⠒⠂⠉⠉⢹⣿⡟⢀⠤⠀⣼⣿⣿⣿⣆⠻⣯⣶⡶⠶⣿⡽⢋⣾⣿⡿⢀⣴⠇⠀⠿⢿⡉⠉⠉⠐⠂⠀⠀⠀�\1⠀⠀⠀⠀⠀⣀⣴⣿⠏⠀⠀⢤⣛⣶⣤⣍⣿⣿⣿⣿⣶⣶⣶⣾⣿⣿⣷⣿⣋⣴⣨⣖⡀⠀⠀⠸⣄⡀⠀⠀⠀⠀⠀�\1⠀⠀⠀⠀⢀⣾⢿⠃⠀⠀⠀⠼⡿⣷⣼⣧⣾⣦⢿⣿⣭⣭⣭⡴⠖⣻⣿⠶⢟⣉⣭⣶⠢⠄⠀⠀⠈⣦⠀⠀⠀⠀⠀�\1⠀⠀⠀⣠⠿⠟⠀⠀⠀⠀⠀⠀⢀⣀⣀⣠⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⡀⣷⠀⠀⠀⠀�\1⠀⠀⠀⠀⠀⠈⠈⢈⠜⠉⠉⠉⣸⠋⣼⢡⡟⣿⣿⢿⣿⣿⣿⣿⡿⡟⣿⠹⡌⢻⡀⠁⠀⠙⢄⠀⠀⠀⠀⠀⠀⠀⠀�\1⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠊⠀⠀⢠⠏⠰⠀⡿⢸⠀⡇⢸⠈⣇⠸⠀⢷⠀⠀⠈⢦⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀�\1⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠃⠀⠀⢰⠀⠀⠀⡇⠀⠀⢸⠀⠀⠀⢣⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀�\1⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ⠀⠀⠀⠀⠀⠂⠀⠀⠀⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀\5\28dashboard_custom_header\6g\bvim\0", "config", "dashboard-nvim")
time([[Config for dashboard-nvim]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd nvim-bufferline.lua ]]

-- Config for: nvim-bufferline.lua
try_loadstring("\27LJ\2\n�\5\0\0\b\0\26\0+6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\3\0005\4\4\0=\4\5\3=\3\a\0025\3\t\0005\4\b\0=\4\n\3=\3\v\2B\0\2\0016\0\f\0009\0\r\0009\0\14\0005\1\15\0\18\2\0\0'\4\16\0'\5\17\0'\6\18\0\18\a\1\0B\2\5\1\18\2\0\0'\4\16\0'\5\19\0'\6\20\0\18\a\1\0B\2\5\1\18\2\0\0'\4\16\0'\5\21\0'\6\22\0005\a\23\0B\2\5\1\18\2\0\0'\4\16\0'\5\24\0'\6\25\0\18\a\1\0B\2\5\1K\0\1\0]:lua if vim.tbl_count(vim.fn.getbufinfo({buflisted=true}))>1 then vim.cmd(\"bd\") end <CR>\nr<BS>\1\0\1\vsilent\2n:lua if vim.v.count~=0 then require\"bufferline\".go_to_buffer(vim.v.count) else vim.cmd(\"buffer #\")end<CR>\t<BS>\29:BufferLineCyclePrev<CR>\14<LEADER>[\29:BufferLineCycleNext<CR>\14<LEADER>]\6n\1\0\2\fnoremap\2\vsilent\2\20nvim_set_keymap\bapi\bvim\15highlights\20buffer_selected\1\0\0\1\0\2\nguifg\f#61AFEF\bgui\tbold\foptions\1\0\0\20separator_style\1\3\0\0\5\5\1\0\b\28show_buffer_close_icons\1\18modified_icon\b\17number_style\5\27always_show_bufferline\1\fnumbers\fordinal\rmappings\2\15close_icon\5\22buffer_close_icon\5\nsetup\15bufferline\frequire\0", "config", "nvim-bufferline.lua")

time([[Sequenced loading]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file MaximizerToggle lua require("packer.load")({'vim-maximizer'}, { cmd = "MaximizerToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file DBUI lua require("packer.load")({'vim-dadbod-ui'}, { cmd = "DBUI", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file DBUIFindBuffer lua require("packer.load")({'vim-dadbod-ui'}, { cmd = "DBUIFindBuffer", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file DBUIRenameBuffer lua require("packer.load")({'vim-dadbod-ui'}, { cmd = "DBUIRenameBuffer", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Vista lua require("packer.load")({'vista.vim'}, { cmd = "Vista", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Telescope lua require("packer.load")({'telescope.nvim'}, { cmd = "Telescope", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file ColorizerToggle lua require("packer.load")({'nvim-colorizer.lua'}, { cmd = "ColorizerToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file DBUIAddConnection lua require("packer.load")({'vim-dadbod-ui'}, { cmd = "DBUIAddConnection", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file BookmarksToggle lua require("packer.load")({'bookmarks-nvim'}, { cmd = "BookmarksToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file DBUIToggle lua require("packer.load")({'vim-dadbod-ui'}, { cmd = "DBUIToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

-- Keymap lazy-loads
time([[Defining lazy-load keymaps]], true)
vim.cmd [[noremap <silent> <Plug>(easymotion-sn) <cmd>lua require("packer.load")({'vim-easymotion'}, { keys = "<lt>Plug>(easymotion-sn)", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <Plug>(EasyAlign) <cmd>lua require("packer.load")({'vim-easy-align'}, { keys = "<lt>Plug>(EasyAlign)", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <Plug>TranslateW <cmd>lua require("packer.load")({'vim-translator'}, { keys = "<lt>Plug>TranslateW", prefix = "" }, _G.packer_plugins)<cr>]]
time([[Defining lazy-load keymaps]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType css ++once lua require("packer.load")({'nvim-colorizer.lua'}, { ft = "css" }, _G.packer_plugins)]]
vim.cmd [[au FileType html ++once lua require("packer.load")({'nvim-colorizer.lua', 'tagalong.vim'}, { ft = "html" }, _G.packer_plugins)]]
vim.cmd [[au FileType pandoc.markdown ++once lua require("packer.load")({'markdown-preview.nvim'}, { ft = "pandoc.markdown" }, _G.packer_plugins)]]
vim.cmd [[au FileType rmd ++once lua require("packer.load")({'markdown-preview.nvim'}, { ft = "rmd" }, _G.packer_plugins)]]
vim.cmd [[au FileType wxml ++once lua require("packer.load")({'tagalong.vim'}, { ft = "wxml" }, _G.packer_plugins)]]
vim.cmd [[au FileType vim ++once lua require("packer.load")({'nvim-colorizer.lua'}, { ft = "vim" }, _G.packer_plugins)]]
vim.cmd [[au FileType vue ++once lua require("packer.load")({'tagalong.vim'}, { ft = "vue" }, _G.packer_plugins)]]
vim.cmd [[au FileType sass ++once lua require("packer.load")({'nvim-colorizer.lua'}, { ft = "sass" }, _G.packer_plugins)]]
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'bullets.vim', 'markdown-preview.nvim', 'vim-table-mode'}, { ft = "markdown" }, _G.packer_plugins)]]
vim.cmd [[au FileType typescript ++once lua require("packer.load")({'nvim-colorizer.lua'}, { ft = "typescript" }, _G.packer_plugins)]]
vim.cmd [[au FileType typescriptreact ++once lua require("packer.load")({'nvim-colorizer.lua'}, { ft = "typescriptreact" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au BufNewFile * ++once lua require("packer.load")({'vim-cursorword'}, { event = "BufNewFile *" }, _G.packer_plugins)]]
vim.cmd [[au BufReadPre * ++once lua require("packer.load")({'indentLine', 'nvim-compe', 'vim-cursorword', 'nvim-lspconfig'}, { event = "BufReadPre *" }, _G.packer_plugins)]]
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'emmet-vim', 'vim-vsnip', 'vim-vsnip-integ'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
vim.cmd [[au BufRead * ++once lua require("packer.load")({'vim-gitgutter', 'lspsaga.nvim', 'vim-surround', 'vim-visual-multi', 'nvim-treesitter', 'nvim-treesitter-context', 'vim-commentary', 'vim-visual-star-search'}, { event = "BufRead *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
