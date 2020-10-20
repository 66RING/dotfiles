"========================
" Plugins
"========================
call plug#begin('~/.vim/plugged')

"" completion
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
"" Plug 'vn-ki/coc-clap'

"" dress up
"Plug 'ryanoasis/vim-devicons'
"Plug 'glepnir/dashboard-nvim'
"Plug '66RING/eleline.vim'
" Plug 'mg979/vim-xtabline'
"" Plug 'Konfekt/FastFold'
"" Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }

"" Genreal Highlighter
"Plug 'jaxbot/semantic-highlight.vim'
"" Plug 'norcalli/nvim-colorizer.lua'


"" markdown
"Plug 'iamcco/markdown-preview.nvim', { 'for': 'markdown', 'on': 'MarkdownPreview',  'do': 'cd app & yarn install'  }
"Plug 'dhruvasagar/vim-table-mode', { 'for': 'markdown' }

"Plug 'dkarter/bullets.vim', { 'for': 'markdown' }
   

""" snips
""" Track the engine.
"Plug 'honza/vim-snippets'
"Plug 'tpope/vim-commentary'


"" git
"Plug 'airblade/vim-gitgutter'


"" something useful
"Plug 'junegunn/vim-easy-align' , { 'on': ['<Plug>(EasyAlign)']}
"Plug 'tpope/vim-surround' " type ysiw' i sur in word '' or type cs'` to change 'word' to `word` or 'ds' del sur or 'yss'' for sur line h h-> 'h h'
"Plug 'easymotion/vim-easymotion', { 'on': ['<Plug>(easymotion-sn)']}
Plug 'liuchengxu/vim-clap', { 'on': 'Clap', 'do': ':Clap install-binary' , 'branch': 'fix-shadow-win'}
"Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'kristijanhusak/defx-icons'
"" Plug 'junegunn/goyo.vim'  " goyo to turn on goyo! to turn off, g:goyo_  to config
"Plug 'voldikss/vim-translator', { 'on': ['<Plug>TranslateW', '<Plug>TranslateWV']}

"" taglist
"Plug 'liuchengxu/vista.vim', { 'on': ['Vista', 'Vista!', 'Vista!!']}

"" search selected
"Plug 'bronson/vim-visual-star-search'


"" database
"Plug 'tpope/vim-dadbod'
"Plug 'kristijanhusak/vim-dadbod-ui', {'on': ['DBUIToggle', 'DBUIAddConnection', 'DBUI', 'DBUIFindBuffer', 'DBUIRenameBuffer'] }


"" coding
"" golang
"Plug 'fatih/vim-go', { 'for': 'go', 'do': ':GoUpdateBinaries' }

"" Tex
"" Plug 'lervag/vimtex'

"" CSharp
"Plug 'OmniSharp/omnisharp-vim', { 'for': 'cs' }
"Plug 'ctrlpvim/ctrlp.vim' , { 'for': ['cs', 'vim-plug'] } " omnisharp-vim dependency

"" HTML, CSS, JavaScript, PHP, JSON, etc.
"Plug 'elzr/vim-json', { 'for': 'json' }
"Plug 'hail2u/vim-css3-syntax', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
"Plug 'spf13/PIV', { 'for' :['php', 'vim-plug'] }
"Plug 'pangloss/vim-javascript', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
"Plug 'yuezk/vim-js', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
"Plug 'MaxMEllon/vim-jsx-pretty', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
"Plug 'jelera/vim-javascript-syntax', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
""Plug 'jaxbot/browserlink.vim'
"Plug 'alvan/vim-closetag'
"Plug 'AndrewRadev/tagalong.vim'

"" Python
"Plug 'Vimjas/vim-python-pep8-indent', { 'for' :['python', 'vim-plug'] }
"Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins', 'for' :['python', 'vim-plug'] }
"" Plug 'tweekmonster/braceless.vim'

"" Processing
"Plug 'sophacles/vim-processing', { 'for': ['processing'] }

call plug#end()



