" ____  _             _         ____       _   _   _                 
"|  _ \| |_   _  __ _(_)_ __   / ___|  ___| |_| |_(_)_ __   __ _ ___ 
"| |_) | | | | |/ _` | | '_ \  \___ \ / _ \ __| __| | '_ \ / _` / __|
"|  __/| | |_| | (_| | | | | |  ___) |  __/ |_| |_| | | | | (_| \__ \
"|_|   |_|\__,_|\__, |_|_| |_| |____/ \___|\__|\__|_|_| |_|\__, |___/
"               |___/                                      |___/     


"========================
" completion
"========================
" " Set completeopt to have a better completion experience
" set completeopt=menuone,noinsert,noselect
" " Avoid showing message extra message when using completion
" set shortmess+=c

" let g:completion_confirm_key = ""
" imap <expr> <cr>  pumvisible() ? complete_info()["selected"] != "-1" ?
"                  \ "\<Plug>(completion_confirm_completion)"  : "\<c-e>\<CR>" :  "\<CR>"

" imap <tab> <Plug>(completion_smart_tab)
" imap <s-tab> <Plug>(completion_smart_s_tab)

" let g:completion_enable_snippet = 'UltiSnips'
" let g:completion_enable_auto_hover = 0
" let g:completion_auto_change_source = 1
" let g:completion_enable_auto_popup = 1
" let g:completion_matching_ignore_case = 0
" let g:completion_chain_complete_list = [
"     \  {'complete_items': ['lsp']},
"     \  {'complete_items': ['snippet']},
"     \  {'complete_items': ['buffers']},
"     \  {'complete_items': ['path']},
"     \  {'mode': '<c-p>'},
"     \  {'mode': '<c-n>'}
"   \]
" autocmd FileType markdown let g:completion_enable_auto_popup = 0

set completeopt=menu,menuone,noselect
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ compe#complete()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
let g:compe = {}
let g:compe.enabled = v:true
let g:compe.autocomplete = v:true
let g:compe.debug = v:false
let g:compe.min_length = 1
let g:compe.preselect = 'disable'
let g:compe.allow_prefix_unmatch = v:false

let g:compe.source = {}
" let g:compe.source.path = {'ignored_filetypes': ['clap_input', 'markdown']}
" let g:compe.source.buffer = {'ignored_filetypes': ['clap_input', 'markdown']}
" let g:compe.source.calc = {'ignored_filetypes': ['clap_input', 'markdown']}
" let g:compe.source.vsnip = {'ignored_filetypes': ['clap_input', 'markdown']}
" let g:compe.source.nvim_lsp = {'ignored_filetypes': ['clap_input', 'markdown']}
" let g:compe.source.nvim_lua = {'ignored_filetypes': ['clap_input', 'markdown']}
let g:compe.source.path = v:true
let g:compe.source.buffer = v:true
let g:compe.source.calc = v:true
let g:compe.source.vsnip = v:true
let g:compe.source.nvim_lsp = v:true
let g:compe.source.nvim_lua = v:true

autocmd FileType clap_input,markdown let g:compe.autocomplete=v:false



"========================
" lsp
"========================
nnoremap <silent><LEADER>rn <cmd>lua require('lspsaga.rename').rename()<CR>
nnoremap <silent>gd <cmd>lua require'lspsaga.provider'.preview_definition()<CR>
nnoremap <silent>gh <cmd>lua require'lspsaga.provider'.lsp_finder()<CR>
nnoremap <silent><LEADER>h <cmd>lua require('lspsaga.hover').render_hover_doc()<CR>
nnoremap <silent><LEADER>a <cmd>lua require('lspsaga.codeaction').code_action()<CR>
vnoremap <silent><LEADER>a <cmd>'<,'>lua require('lspsaga.codeaction').range_code_action()<CR>
nnoremap <silent><LEADER>- <cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>
nnoremap <silent><LEADER>= <cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>
" nnoremap <silent><C-s> <cmd>lua vim.lsp.buf.formatting()<CR>
command! Format lua vim.lsp.buf.formatting()


""========================
"" snips
""========================
" " Expand
" imap <expr> <C-e>   vsnip#expandable()  ? '<Plug>(vsnip-expand)' : '<C-e>'
" smap <expr> <C-e>   vsnip#expandable()  ? '<Plug>(vsnip-expand)' : '<C-e>'
" " Jump forward or backward
" smap <expr> <C-l>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)' : '<C-l>'
" smap <expr> <C-j>   vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)' : '<C-j>'


"========================
" easymotion
"========================
let g:EasyMotion_do_mapping = 'off'
nmap ss <Plug>(easymotion-sn)



"========================
" tagalong
"========================
let g:tagalong_additional_filetypes = ['vue', 'wxml']


"========================
" vim-commentary
"========================
autocmd FileType apache setlocal commentstring=#\ %s
autocmd FileType c,cpp setlocal commentstring=//\ %s


"========================
" EasyAlign
"========================
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)


"========================
" markdown preview setting
"========================
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 0
let g:mkdp_open_ip = ''
let g:mkdp_browser = ''
let g:mkdp_echo_preview_url = 0
let g:mkdp_browserfunc = ''
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {}
    \ }
let g:mkdp_markdown_css = ''
let g:mkdp_highlight_css = ''
let g:mkdp_port = ''


"========================
" bullets
"========================
let g:bullets_enabled_file_types = [
    \ 'markdown',
    \ 'text',
    \ 'gitcommit',
    \ 'scratch'
    \]
" disable default key mapping
" let g:bullets_set_mappings = 0 "


"========================
" xtabline
"========================
" :h xtabline.txt
let g:xtabline_lazy = 1
let g:xtabline_settings = get(g:, 'xtabline_settings', {})
let g:xtabline_settings.tabline_modes = ['buffers']
let g:xtabline_settings.enable_mappings = 0
let g:xtabline_settings.buffer_filtering = 0
let g:xtabline_settings.tab_number_in_buffers_mode = 0
let g:xtabline_settings.last_open_first = 1
let g:xtabline_settings.recent_buffers = 20
noremap <LEADER>] :<C-u>XTabNextBuffer<CR>
noremap <LEADER>[ :<C-u>XTabPrevBuffer<CR>
noremap *p :<C-u>XTabPinBuffer<CR>
map <BS> <Plug>(XT-Select-Buffer)
noremap r<BS> :<C-u>XTabCloseBuffer<CR>

function s:xtabline_custom()
  return {
  \"XTSelect":      [ 187, 23,  '#61AFEF',   'NONE',   1 ],
  \"XTSelectMod":   [ 174, 23,  '#ff0000',   'NONE',   1 ],
  \"XTVisible":     [ 223, 233, '#6272a4',   'NONE',   2 ],
  \"XTVisibleMod":  [ 174, 233, '#ff0000',   'NONE',   1 ],
  \"XTHidden":      [ 174, 241, '#6272a4',   'NONE',   2 ],
  \"XTHiddenMod":   [ 174, 241, '#DF8C8C',   'NONE',   1 ],
  \"XTExtra":       [ 253, 126, '#6272a4',   'NONE',   0 ],
  \"XTExtraMod":    [ 174, 126, '#DF8C8C',   'NONE',   0 ],
  \"XTSpecial":     [ 239, 223, '#61AFEF',   'NONE',   0 ],
  \"XTNumSel":      [ 239, 150, '#F2C38F',   'NONE',   1 ],
  \"XTNum":         [ 223, 233, '#6272a4',   'NONE',   0 ],
  \"XTCorner":      [ 223, 233, '#61AFEF',   'NONE',   1 ],
  \"XTFill":        [ 248, 0,   '#6272a4',   'NONE',   1 ],
  \}
endfunction

augroup xtabline_custom
    au!
    au TabNew,SessionLoadPost,BufAdd * call xtabline#init#start()
    au TabNew,SessionLoadPost,BufAdd * call xtabline#hi#generate('custom_theme', <SID>xtabline_custom())
    au TabNew,SessionLoadPost,BufAdd * exec "XTabTheme custom_theme"
augroup END



"========================
" GitGutte
"========================
let g:gitgutter_signs = 1
let g:gitgutter_map_keys = 0
let g:gitgutter_override_sign_column_highlight = 0
let g:gitgutter_preview_win_floating = 1
" autocmd BufWritePost * GitGutter
nnoremap <LEADER>gf :GitGutterFold<CR>
nnoremap <LEADER>gh :GitGutterPreviewHunk<CR>
nnoremap <LEADER>g- :GitGutterPrevHunk<CR>
nnoremap <LEADER>g= :GitGutterNextHunk<CR>


"========================
" Vista.vim
"========================
":Vista [EXECUTIVE]: open vista window powered by EXECUTIVE
noremap T :<C-u>Vista!!<CR>
noremap <LEADER>v :<C-u>silent! Vista finder<CR>
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista_default_executive = 'ctags'
let g:vista_echo_cursor_strategy = 'floating_win'
let g:vista_vimwiki_executive = 'markdown'
let g:vista_disable_statusline = 1
let g:vista#renderer#enable_icon = 1
let g:vista#renderer#icons = {
\   "function": "\uf794",
\   "variable": "\uf71b",
\  }
let g:vista_executive_for = {
  \ 'vimwiki': 'markdown',
  \ 'pandoc': 'markdown',
  \ 'markdown': 'toc',
  \ 'yaml': 'coc',
  \ 'typescript': 'coc',
  \ 'typescriptreact': 'coc',
  \ }

"========================
" Telescope
"========================

"========================
" vim-clap
"========================
let g:clap_cache_directory = '~/cache/clap'
let g:clap_theme = 'material_design_dark'
let g:clap_current_selection_sign= { 'text': '🚀', 'texthl': "ClapCurrentSelectionSign", "linehl": "ClapCurrentSelection"}
let g:clap_layout = { 'relative': 'editor' }
let g:clap_enable_icon = 1
let g:clap_enable_background_shadow = v:false
let g:clap_provider_grep_enable_icon = 1

noremap <C-f> :<C-u>Clap filer %:p:h<CR>
noremap <C-h> :<C-u>Clap history<CR>
noremap tT :<C-u>Clap buffers<CR>
noremap <leader>; :<C-u>Clap hist:<CR>
noremap <leader>: :<C-u>Clap command<CR>
" Unmap
autocmd FileType clap_input inoremap <silent> <buffer> <C-j> <NOP>
autocmd FileType clap_input inoremap <silent> <buffer> <C-k> <NOP>
autocmd FileType clap_input inoremap <silent> <buffer> <C-n> <C-R>=clap#navigation#linewise('down')<CR>
autocmd FileType clap_input inoremap <silent> <buffer> <C-p> <C-R>=clap#navigation#linewise('up')<CR>
autocmd FileType clap_input inoremap <silent> <buffer> <Esc> <Esc>:<c-u>call clap#handler#exit()<CR>


"========================
" vim-translator
"========================
let g:translator_default_engines=['bing', 'google']
nmap <silent> ts <Plug>TranslateW
vmap <silent> ts <Plug>TranslateWV


"========================
" dashboard
"========================
let g:dashboard_custom_header = [
    \'',
    \'',
    \'⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀  ',
    \'⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣼⣿⣦⢀⡐⠀⠀ ⠀⠀⠀⠀⠀⠀⠀⠀⠀  ',
    \'⠀⠀⠀⠀⠀⠀⠠⢀⠠⢚⡉⠘⢰⣾⣿⣿⣿⣷⠀⠈⢈⠒⢀⠀⠀⠀⠀⠀⠀⠀⠀  ',
    \'⠀⠀⠀⠀⢀⠠⠈⠑⣄⣠⠽⣰⣿⢿⣾⢾⣿⢻⣿⣰⠯⣀⣨⠋⢀⢀ ⠀⠀⠀⠀  ',
    \'⠀⠀⢀⢠⠈⠈⢶⣔⠉⢳⣴⣿⣻⢰⢽⢼⠯⢼⢻⣿⣦⠾⠹⣠⠶⠁⠑⣀⡀⠀⠀  ',
    \'⠀⠀⣀⠉⠐⣶⣉⣨⢻⣾⣿⠹⢤⢞⢸⢸⢏⡺⢼⢩⢿⣶⠛⢁⣩⣴⠊⢉⢀⠀⠀  ',
    \'⠀⠨⢁⠒⢴⣭⣰⣉⣿⣟⢶⣴⣾⣾⣿⣿⣿⣿⣶⣬⠺⣻⣽⣉⣠⣬⡶⠒⠘⠀⠀  ',
    \' ⢾⠴⠤⣯⣤⣴⣽⣻⣾⣿⠿⣿⠟⣿⣿⣿⢻⡿⠿⣿⣷⣝⣽⣤⢤⣽⠴⢴⢶⠀  ',
    \'⠀⣌⣀⣠⣭⣴⣾⢿⢿⣷⣀⢀⠘⣶⣙⢟⣋⣾⠃⢀⣠⣾⣿⢿⣿⣦⣼⣠⣸⣠⠀  ',
    \'⠀⢈⠠⢀⣿⣿⣉⣸⢤⢙⣻⢿⣶⣶⣭⣭⣭⣴⣶⠿⢯⢻⢴⣀⣹⢿⣿⡀⠀⠁⠀  ',
    \'⠀ ⢡⣿⣾⠙⢙⣠⢜⢤⣰⢋⢾⣝⢹⢻⡟⣫⢵⢸⢼⢼⢺⣠⣩⢻⣾⣿⡘⠀⠀  ',
    \'⠀⣰⣿⢿⣾⢿⣾⣿⣾⢿⣿⣾⣾⣾⣿⣾⢿⢾⣾⣿⣿⣿⣾⣿⣷⢿⢿⢿⢾⣄⠀  ',
    \'⠀⠀⠀⠀⠨⢊⠠⢀⠾⢠⣠⠞⠀⣰⠐⢰⢀⣲⢀⢺⣐⠜⢶⠀⢀⠱⢀⠀⠀⠀⠀  ',
    \'⠀⠀⠀⠀⠀⠀⠨⠒⠠⢀⠟⠀⢹⠉⠀⣿⠘⠸⠉⠀⠻⣐⠀⠒⠀⠀⠀⠀⠀⠀⠀  ',
    \'⠀⠀⠀⠀⠀⠀⠀⠀⠀ ⠉⠀⠒⠐⠠⠿⠘⠐⢒⠈⠉⠑⠀⠀⠀⠀⠀⠀⠀⠀⠀  ',
    \'',
    \]

" let g:dashboard_preview_command = 'cowsay'
" let g:dashboard_preview_file = ' '
" let g:dashboard_preview_file_height = 9 
" let g:dashboard_preview_file_width = 30

" let footer = systemlist('fortune -s')
" let g:dashboard_custom_footer = footer

autocmd FileType dashboard set laststatus=0 | autocmd BufLeave <buffer> set laststatus=2
autocmd FileType dashboard set showtabline=0 | autocmd BufLeave <buffer> set showtabline=2
autocmd FileType dashboard nnoremap <silent><buffer> e :exec "set laststatus=2 \| enew"<CR>

let g:dashboard_custom_section={
  \ 'empty_buffer': {
      \ 'description': [' Empty Buffer'],
      \ 'command': 'set laststatus=2 | enew' },
  \ 'find_history': {
      \ 'description': ['ﭯ History     '],
      \ 'command': 'Clap history' },
  \ 'find_file': {
      \ 'description': [' Find Files  '],
      \ 'command': 'Clap filer' },
  \ }


"========================
" dadbod and dadbod-ui
"========================
" :DBUI... to connect to database
let g:db_ui_win_position = 'left'
let g:db_ui_use_nerd_fonts = 1
let g:db_ui_winwidth = 35
let g:db_ui_save_location = '$HOME/.cache/db_ui_save_location'
function! s:load_db()
    let l:dbs = []
    let l:db_url = getenv("HOME")."/.db_url"
    if filereadable(l:db_url)
      let l:url_content = readfile(l:db_url)
      for item in l:url_content
        let l:line_content = split(item,",")
        call add(l:dbs, {'name':l:line_content[0], 'url': l:line_content[1]})
      endfor
      return l:dbs
    endif
endfunction
let g:dbs = s:load_db()


"========================
" defx
"========================
" use / to quick go this buffer dir
nnoremap <silent> tt :cd %:p:h<CR>:Defx -resume -toggle -buffer-name=tab`tabpagenr()`<CR>

function! s:defx_expand_or_drop() abort
    if defx#is_directory()
        return defx#do_action('open_or_close_tree')
    endif
    return defx#do_action('multi', ['drop', 'quit'])
endfunction

autocmd FileType defx call <SID>defx_my_settings()

function! s:defx_my_settings() abort
    " motion
    nnoremap <silent><buffer><expr> l               <sid>defx_expand_or_drop()
    nnoremap <silent><buffer><expr> L               defx#do_action('open', 'botright vsplit')
    nnoremap <silent><buffer><expr> j               defx#async_action('cd', ['..'])
    nnoremap <silent><buffer><expr> J               defx#do_action('close_tree')
    nnoremap <silent><buffer><expr> k               line('.') == line('$') ? 'gg' : 'j'
    nnoremap <silent><buffer><expr> K               line('.') == line('$') ? 'gg' : '5j'
    nnoremap <silent><buffer><expr> i               line('.') == 1 ? 'G' : 'k'
    nnoremap <silent><buffer><expr> I               line('.') == 1 ? 'G' : '5k'

    nnoremap <silent><buffer><expr><nowait> s       defx#do_action('open', 'botright split')
    nnoremap <silent><buffer><expr><nowait> *       defx#do_action('toggle_select') . 'j'
    nnoremap <silent><buffer><expr><nowait> v       defx#do_action('toggle_select_all')
    " actions
    " nnoremap <silent><buffer><expr><nowait> c  defx#do_action('copy')
    " nnoremap <silent><buffer><expr><nowait> m  defx#do_action('move')
    nnoremap <silent><buffer><expr> yy  defx#do_action('copy')
    nnoremap <silent><buffer><expr> yp defx#do_action('yank_path')
    nnoremap <silent><buffer><expr> pp  defx#do_action('paste')
    nnoremap <silent><buffer><expr> C  defx#do_action('toggle_columns', 'mark:indent:icon:filename:type:size:time')
    nnoremap <silent><buffer><expr> P  defx#do_action('preview')
    nnoremap <silent><buffer><expr> md defx#do_action('new_directory')
    nnoremap <silent><buffer><expr> mf defx#do_action('new_multiple_files')
    nnoremap <silent><buffer><expr> dD defx#do_action('remove')
    nnoremap <silent><buffer><expr> dd defx#do_action('move')
    nnoremap <silent><buffer><expr> rn defx#do_action('rename')
    nnoremap <silent><buffer><expr> X  defx#do_action('execute_system')
    nnoremap <silent><buffer><expr> zh defx#do_action('toggle_ignored_files')
    nnoremap <silent><buffer><expr> q  defx#do_action('quit')
    " sort and redraw
    nnoremap <silent><buffer><expr> st    defx#do_action('toggle_sort', 'time')
    nnoremap <silent><buffer><expr> <C-r> defx#do_action('redraw')
    nnoremap <silent><buffer><expr> <C-g> defx#do_action('print')
    
    " " jumps
    " nnoremap <silent><buffer>  [g :<C-u>call <SID>jump_dirty(-1)<CR>
    " nnoremap <silent><buffer>  ]g :<C-u>call <SID>jump_dirty(1)<CR>
    nnoremap <silent><buffer><expr> gh      defx#async_action('cd')
    nnoremap <silent><buffer><expr> gf      defx#async_action('cd', expand('~/.config'))
    nnoremap <silent><buffer><expr> gd      defx#async_action('cd', expand('~/Documents'))
    nnoremap <silent><buffer><expr> gs      defx#async_action('cd', expand('~/scripts'))
    nnoremap <silent><buffer><expr> gv      defx#async_action('cd', expand('~/var'))
    nnoremap <silent><buffer><expr> \       defx#async_action('cd', getcwd())
    " nnoremap <silent><buffer><expr><nowait> & defx#async_action('cd', getcwd())
endfunction
let g:defx_icons_mark_icon = ''
let g:defx_icons_parent_icon = ""
