
"   _    ________  _______  ______
"  | |  / /  _/  |/  / __ \/ ____/
"  | | / // // /|_/ / /_/ / /     
" _| |/ // // /  / / _, _/ /___   
"(_)___/___/_/  /_/_/ |_|\____/   
"                                 
" Author: 66RING@github.com


"========================
" theme settings
"========================
" syntax on
" autocmd ColorScheme * highlight Normal ctermbg=NONE guibg=NONE
" autocmd ColorScheme * highlight TabLineSel ctermbg=NONE guibg=NONE
" autocmd ColorScheme * highlight! Cursorline cterm=bold ctermfg=black guibg=#48515E
" autocmd ColorScheme * highlight! Colorcolumn cterm=bold guibg=#666666
" set background=dark " dulp in oceanic_material

" let g:oceanic_material_transparent_background = 1
" let g:colors_name="oceanic_material"


"========================
" Disable vim distribution plugins
"========================
let g:loaded_getscript         = 1
let g:loaded_getscriptPlugin   = 1
let g:loaded_gzip              = 1
let g:loaded_logiPat           = 1
let g:loaded_matchit           = 1
" let g:loaded_matchparen        = 1
let g:loaded_rrhelper          = 1 " ?
let g:loaded_shada_plugin      = 1 " ?
let g:loaded_tar               = 1
let g:loaded_tarPlugin         = 1
let g:loaded_tutor_mode_plugin = 0
let g:loaded_2html_plugin      = 1
let g:loaded_vimball           = 1
let g:loaded_vimballPlugin     = 1
let g:loaded_zip               = 1
let g:loaded_zipPlugin         = 1
let g:loaded_netrw             = 1
let g:loaded_netrwPlugin       = 1
let g:loaded_netrwSettings     = 1
let g:loaded_netrwFileHandlers = 1


" shotcut configuration file
autocmd FileType markdown source $HOME/.config/nvim/shot_cut_source/md_snippits.vim
source $HOME/.config/nvim/shot_cut_source/coding_short_cut.vim


command! Vimrc :e $MYVIMRC
map s <nop>
map <Up> <Nop>
map <Down> <Nop>
map <Right> <Nop>
map <Left> <Nop>
map <Space>  <Nop>
map gh  <Nop>
map gH  <Nop>
map g<C-h>  <Nop>
map <C-z>  <Nop>
noremap <C-u>  <Nop>
noremap <C-d>  <Nop>


set completeopt=menu,menuone,noselect
set enc=utf8
set fileencodings=ucs-bom,utf-8,utf-16,gbk,big5,gb18030,latin1
set termencoding=utf-8
set colorcolumn=80

set termguicolors
set number
set numberwidth=1
set relativenumber
set cursorline
set showcmd
set wildmenu
set hlsearch
exec "nohlsearch"
set incsearch
set ignorecase
set smartcase
set scrolloff=10 
set tabstop=4
set softtabstop=0
set shiftwidth=4    
set noexpandtab 
" set lazyredraw
set foldmethod=indent
set foldlevel=99
autocmd FileType json,vue,javascript,css,lua,sh,vim setlocal shiftwidth=2
let mapleader=" "

set hidden
set updatetime=100
set shortmess+=c
set display=lastline

noremap h i
noremap H I
noremap k j
noremap K 5j
noremap i k
noremap I 5k
noremap j h
noremap J 5h
noremap L 5l
noremap <C-j> 0
noremap <C-l> $
inoremap <C-j> <ESC>I
inoremap <C-l> <ESC>A

" " standard vim
" noremap H 5j
" noremap J 5j
" noremap K 5k
" noremap L 5l
" noremap <C-h> 0
" noremap <C-l> $
" inoremap <C-h> <ESC>I
" inoremap <C-l> <ESC>A

noremap Y "+y
" :[range]y[ank] [x]
nnoremap yY :%y+<CR> 
noremap P "+p
" m for join
noremap m J  
noremap <silent> M :exec ":mark "nr2char(getchar())<CR>
nmap ' :exec "let save_cursor=getcurpos()" \| exec 'BookmarksToggle' \| call setpos("''", save_cursor)<CR>
noremap <LEADER><CR> :nohlsearch<CR>


"========================
" split window
"========================
noremap sl :<C-u>set splitright<CR>:vsplit<CR>
noremap sj :<C-u>set nosplitright<CR>:vsplit<CR>
noremap si :<C-u>set nosplitbelow<CR>:split<CR>
noremap sk :<C-u>set splitbelow<CR>:split<CR>
noremap st :<C-u>set splitbelow<CR>:10sp<CR>:term<CR>

" " standard
" noremap sl :<C-u>set splitright<CR>:vsplit<CR>
" noremap sh :<C-u>set nosplitright<CR>:vsplit<CR>
" noremap sk :<C-u>set nosplitbelow<CR>:split<CR>
" noremap sj :<C-u>set splitbelow<CR>:split<CR>
" noremap st :<C-u>set splitbelow<CR>:sp<CR>:term<CR>
"=== split screen movement===
noremap <LEADER>w <C-w>w
noremap <LEADER>i <C-w>k
noremap <LEADER>k <C-w>j
noremap <LEADER>j <C-w>h
noremap <LEADER>l <C-w>l

" " standard
" noremap <LEADER>w <C-w>w
" noremap <LEADER>h <C-w>h
" noremap <LEADER>j <C-w>j
" noremap <LEADER>k <C-w>k
" noremap <LEADER>l <C-w>l
"=== split operation===
noremap s<up>    :<C-u>res-5<CR>
noremap s<down>  :<C-u>res+5<CR>
noremap s<left>  :<C-u>vertical resize+5<CR>
noremap s<right> :<C-u>vertical resize-5<CR>


"========================
" file operation
"========================
noremap S :<C-u>w<CR>
noremap Q :<C-u>q<CR>
noremap R :<C-u>source $MYVIMRC<CR>


" Basic file system commands
" nnoremap <C-d> :!mkdir<Space>-p<Space>
"nnoremap <C-m> :!mv<Space>%<Space>
"nnoremap <LEADER>] :bnext<CR>
"nnoremap <LEADER>[ :bprevious<CR>


"========================
" fcitx auto switch CN/EN
"========================
"set ttimeoutlen=150
"退出插入模式
autocmd InsertLeave * lua require("utils.functions").fcitx2en()
""进入插入模式
" autocmd InsertEnter * call <SID>fcitx2zh()


"========================
" something Useful
"========================
" open a terminal window
" noremap <LEADER>/ :<C-u>terminal<CR>
" exit terminal mode
" tnoremap <LEADER><Esc> <C-\><C-n>
" tnoremap <C-n> <C-\><C-n>
" to next <++>
nnoremap <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4l

if !isdirectory(expand('~/.config/nvim/tmp'))
    silent !mkdir -p ~/.config/nvim/tmp/backup
    silent !mkdir -p ~/.config/nvim/tmp/undo
    silent !mkdir -p ~/.config/nvim/tmp/sessions
endif

set backupdir=~/.config/nvim/tmp/backup,.
set directory=~/.config/nvim/tmp/backup,.
if has('persistent_undo')
	set undofile
	set undodir=~/.config/nvim/tmp/undo,.
endif


"========================
" last position
"========================
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" find doc
nnoremap <silent> <leader>d :lua require("utils.functions").find_doc()<CR>
" quick run code
nnoremap <silent> <leader>R :lua require("utils.functions").run_code()<CR>
" build run code
nnoremap <silent> <leader>B :lua require("utils.functions").build_code()<CR>
" debugging with gdb
nnoremap <silent> <leader>D :lua require("utils.functions").debug_code()<CR>

" autocmd FileType json syntax match Comment +\/\/.\+$+


"========================
" packer.nvim
"========================
command! PackerInstall packadd packer.nvim | lua require('plugins').install()
command! PackerUpdate packadd packer.nvim | lua require('plugins').update()
command! PackerSync packadd packer.nvim | lua require('plugins').sync()
command! PackerClean packadd packer.nvim | lua require('plugins').clean()
command! PackerCompile packadd packer.nvim | lua require('plugins').compile()
autocmd BufWritePost plugins.lua PackerCompile
autocmd BufWritePost config.lua PackerCompile
" auto install packer.nvim
let s:install_path = stdpath("data").'/site/pack/packer/opt/packer.nvim'
if empty(glob(s:install_path))
  execute '!git clone https://github.com/wbthomason/packer.nvim '.s:install_path
  execute 'packadd packer.nvim'
endif

lua require('keymap.init')

" /home/ring/.config/nvim/lua/plugins.lua


