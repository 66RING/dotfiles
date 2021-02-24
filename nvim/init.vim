
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
" autocmd ColorScheme * highlight! Cursorline cterm=bold ctermfg=black guibg=#666666
" autocmd ColorScheme * highlight! Colorcolumn cterm=bold guibg=#666666
" set background=dark " dulp in oceanic_material

let g:oceanic_material_transparent_background = 1
let g:colors_name="oceanic_material"
" call theme#theme_init("dark", "oceanic_material")


"========================
" Disable vim distribution plugins
"========================
let g:loaded_getscript = 1
let g:loaded_getscriptPlugin = 1
let g:loaded_gzip = 1
let g:loaded_logiPat = 1
let g:loaded_matchit = 1
let g:loaded_matchparen = 1
let g:loaded_rrhelper = 1  " ?
let g:loaded_shada_plugin = 1  " ?
let g:loaded_tar = 1
let g:loaded_tarPlugin = 1
let g:loaded_tutor_mode_plugin = 0
let g:loaded_2html_plugin = 1
let g:loaded_vimball = 1
let g:loaded_vimballPlugin = 1
let g:loaded_zip = 1
let g:loaded_zipPlugin = 1

" netrw
let g:netrw_browsex_viewer= "setsid xdg-open" 


" shotcut configuration file
source $HOME/.config/nvim/shot_cut_source/md_snippits.vim
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
set softtabstop=4   
set shiftwidth=4    
set expandtab 
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
nmap ' <Plug>(bookmarks_nvim)
noremap <LEADER><CR> :nohlsearch<CR>


"========================
" split window
"========================
noremap sl :<C-u>set splitright<CR>:vsplit<CR>
noremap sj :<C-u>set nosplitright<CR>:vsplit<CR>
noremap si :<C-u>set nosplitbelow<CR>:split<CR>
noremap sk :<C-u>set splitbelow<CR>:split<CR>
noremap st :<C-u>set splitbelow<CR>:sp<CR>:term<CR>

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
let s:input_toggle = 1
function! s:fcitx2en()
   let s:input_status = system("fcitx-remote")
   if s:input_status == 2
      let s:input_toggle = 1
      let l:a = system("fcitx-remote -c")
   endif
endfunction

function! s:fcitx2zh()
   let s:input_status = system("fcitx-remote")
   if s:input_status != 2 && s:input_toggle == 1
      let l:a = system("fcitx-remote -o")
      let s:input_toggle = 0
   endif
endfunction

"set ttimeoutlen=150
"退出插入模式
autocmd InsertLeave * call <SID>fcitx2en()
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

" Call figlet
noremap tx :r !figlet


"========================
" find doc
"========================
nnoremap <leader>d :<C-u>call FindDoc()<CR>
func! FindDoc()
    if &filetype == 'python' 
		set nosplitbelow
		:sp
        :exec "term python -c \"help('".expand("<cword>")."')\" | cat"
    elseif &filetype == 'vim'
        :exec "h ". expand("<cword>")
    else
        " default
        :exec "h ". expand("<cword>")
    endif                                                                              
endfunc


"========================
" last position
"========================
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


"========================
" quick run code
"========================
nnoremap <leader>R :<C-u>call RunCode()<CR>
func! RunCode()
    exec "w" 
    if &filetype == 'c' 
		set splitbelow
		:sp
        :term %:p:r
    elseif &filetype == 'cpp'
		set splitbelow
		:sp
        :term %:p:r
    elseif &filetype == 'python'
		set splitbelow
		:sp
        :term python %:p
    elseif &filetype == 'java'
		set splitbelow
		:sp
        :term java %:p:r
    elseif &filetype == 'sh'
		set splitbelow
		:sp
        :term bash %:p
    elseif &filetype == 'vim'
        :source %:p
	elseif &filetype == 'markdown'
		exec 'MarkdownPreview'
	elseif &filetype == 'vimwiki'
		exec 'MarkdownPreview'
    elseif &filetype == 'go'
		set splitbelow
		:sp
		:term go run %:p
    elseif &filetype == 'processing'
		set splitbelow
		:sp
        exec "term processing-java --sketch='".trim(system('pwd'))."' --output='".trim(system('pwd'))."/bin' --force --run"
    elseif &filetype == 'html'
		set splitbelow
		:sp
		:term google-chrome-stable %:p
    elseif &filetype == 'lua'
		set splitbelow
		:sp
		:term lua %:p
    else
        echo "nothing to run"
    endif                                                                              
endfunc

nnoremap <leader>B :<C-u>call BuildCode()<CR>
func! BuildCode()
    exec "w" 
    if &filetype == 'c' 
		set splitbelow
		:sp
        "              v  for my school work only
        " :term gcc -std=c90 -g %:p -o %<
        :term gcc -g %:p -o %<
    elseif &filetype == 'cpp'
		set splitbelow
		:sp
        " :term g++ -std=c++98 -g % -o %<
        :term g++ -g %:p -o %<
    elseif &filetype == 'java'
		set splitbelow
		:sp
        :term javac %:p
    elseif &filetype == 'typescript'
		set splitbelow
		:sp
        :term tsc %:p
    elseif &filetype == 'processing'
		set splitbelow
		:sp
        exec "term processing-java --sketch='".trim(system('pwd'))."' --output='".trim(system('pwd'))."/bin' --force --build"
    elseif &filetype == 'lua'
		set splitbelow
		:sp
		:term luac %:p
    else
        echo "nothing to build"
    endif                                                                              
endfunc

" debugging with gdb
nnoremap <leader>D :<C-u>call DebugWithGDB()<CR>
func! DebugWithGDB()
    exec "w" 
    if &filetype == 'c' 
		set splitbelow
		:sp
        :term gdb %:p:r
    elseif &filetype == 'cpp'
		set splitbelow
		:sp
        :term gdb %:p:r
    else
        echo "nothing to debug"
    endif                                                                              
endfunc

autocmd FileType json syntax match Comment +\/\/.\+$+


command! PackerInstall packadd packer.nvim | lua require('plugins').install()
command! PackerUpdate packadd packer.nvim | lua require('plugins').update()
command! PackerSync packadd packer.nvim | lua require('plugins').sync()
command! PackerClean packadd packer.nvim | lua require('plugins').clean()
command! PackerCompile packadd packer.nvim | lua require('plugins').compile()


execute 'source' fnamemodify('$HOME/.config/nvim/config/plugin_config.vim', '')
" " dein.vim
" execute 'source' fnamemodify('$HOME/.config/nvim/config/dein_plugins.vim', '')


