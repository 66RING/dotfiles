let s:background = {
      \'medium': ['#282C34', '235'],
      \'ocean' : ['#1b2b34', '235'],
      \'deep': ['#212121', 'NONE'],
      \'darker': ['#1d1f21', '234'],
      \}

let s:oceanic_material_background = get(g:,'oceanic_material_background','medium')
let s:bold = ' cterm=bold gui=bold '
let s:italic = ' cterm=italic gui=italic '
let s:underline = ' cterm=underline gui=underline '

let s:colors = {
      \ 'bg0':              s:background[s:oceanic_material_background],
      \ 'bg1':              ['#343d46',   '237'],
      \ 'bg2':              ['#282828',   '235'],
      \ 'bg3':              ['#3c3836',   '237'],
      \ 'bg4':              ['#3c3836',   '237'],
      \ 'bg5':              ['#504945',   '239'],
      \ 'fg0':              ['#d4be98',   '223'],
      \ 'fg1':              ['#ddc7a1',   '223'],
      \ 'fg3':              ['#4f5b66',   '17'],
      \ 'red':              ['#EC5f67',   '203'],
      \ 'magenta':          ['#d16d9e',   '205'],
      \ 'orange':           ['#e78a4e',   '208'],
      \ 'yellow':           ['#d8a657',   '214'],
      \ 'green':            ['#a7c777',   '111'],
      \ 'aqua':             ['#62b3b2',   '73'],
      \ 'blue':             ['#6699cc',   '68'],
      \ 'purple':           ['#c594c5',   '176'],
      \ 'black':            ['#000000',    '0'],
      \ 'bg_red':           ['#ea6962',   '167'],
      \ 'grey0':            ['#7c6f64',   '243'],
      \ 'grey1':            ['#928374',   '245'],
      \ 'grey2':            ['#a89984',   '246'],
      \ 'operator_base05':  ['#c0c5ce',   '251'],
      \ 'none':             ['NONE',      'NONE']
  \ }
function! s:create_color_variables() abort
  for key in keys(s:colors)
    let palette = get(s:colors,key)
    let {'s:fg_' . key} = ' guifg='.palette[0].' ctermfg='.palette[1].' '
    let {'s:bg_' . key} = ' guibg='.palette[0].' ctermbg='.palette[1]. ' '
  endfor
  let s:sp_red = ' guisp='.s:colors.red[0] . ' '
  let s:sp_blue = ' guisp='.s:colors.blue[0] . ' '
  let s:sp_aqua = ' guisp='.s:colors.aqua[0] . ' '
  let s:sp_yellow = ' guisp='.s:colors.yellow[0] . ' '
  let s:sp_purple = ' guisp='.s:colors.purple[0] . ' '
endfunction

function! s:set_color_variables() abort
  call s:create_color_variables()
  let s:terminal = {
        \ 'black':    s:colors.bg0,
        \ 'red':      s:colors.red,
        \ 'yellow':   s:colors.yellow,
        \ 'green':    s:colors.green,
        \ 'cyan':     s:colors.aqua,
        \ 'blue':     s:colors.blue,
        \ 'purple':   s:colors.purple,
        \ 'white':    s:colors.fg0,
        \ 'light_grey': s:colors.bg5,
        \ 'dark_grey': s:colors.grey0,
        \ }
  let g:terminal_color_0 = s:terminal.black[0]
  let g:terminal_color_1 = s:terminal.red[0]
  let g:terminal_color_2 = s:terminal.green[0]
  let g:terminal_color_3 = s:terminal.yellow[0]
  let g:terminal_color_4 = s:terminal.blue[0]
  let g:terminal_color_5 = s:terminal.purple[0]
  let g:terminal_color_6 = s:terminal.cyan[0]
  let g:terminal_color_7 = s:terminal.light_grey[0]
  let g:terminal_color_8 = s:terminal.dark_grey[0]
  let g:terminal_color_9 = s:terminal.red[0]
  let g:terminal_color_10 = s:terminal.green[0]
  let g:terminal_color_11 = s:terminal.yellow[0]
  let g:terminal_color_12 = s:terminal.blue[0]
  let g:terminal_color_13 = s:terminal.purple[0]
  let g:terminal_color_14 = s:terminal.cyan[0]
  let g:terminal_color_15 = s:terminal.white[0]
endfunction

function! s:apply_syntax_highlightings()
  " Markdown Filetype:
  "===============================================================
  exec 'hi markdownH1'. s:fg_red. s:bold
  exec 'hi markdownH2'. s:fg_orange. s:bold
  exec 'hi markdownH3'. s:fg_yellow. s:bold
  exec 'hi markdownH4'. s:fg_green. s:bold
  exec 'hi markdownH5'. s:fg_blue. s:bold
  exec 'hi markdownH6'. s:fg_purple. s:bold
  exec 'hi markdownUrl'. s:fg_blue. s:underline
  exec 'hi markdownItalic'. s:fg_none. s:italic
  exec 'hi markdownBold'. s:fg_none. s:bold
  exec 'hi markdownItalicDelimiter'. s:fg_grey1. s:italic
  exec 'hi markdownCode' .s:fg_green
  exec 'hi markdownCodeBlock' .s:fg_aqua
  exec 'hi markdownCodeDelimiter' .s:fg_aqua
  exec 'hi markdownBlockquote'.s:fg_grey1
  exec 'hi markdownListMarker'. s:fg_red
  exec 'hi markdownOrderedListMarker'. s:fg_red
  exec 'hi markdownRule'. s:fg_purple
  exec 'hi markdownHeadingRule'. s:fg_grey1
  exec 'hi markdownUrlDelimiter'. s:fg_grey1
  exec 'hi markdownLinkDelimiter'. s:fg_grey1
  exec 'hi markdownLinkTextDelimiter'. s:fg_grey1
  exec 'hi markdownHeadingDelimiter'. s:fg_grey1
  exec 'hi markdownLinkText'. s:fg_purple
  exec 'hi markdownUrlTitleDelimiter'. s:fg_green
  exec 'hi markdownIdDeclaration'. s:fg_purple
  exec 'hi markdownBoldDelimiter'. s:fg_grey1
  exec 'hi markdownId'. s:fg_yellow
endfunction

call s:set_color_variables()
call s:apply_syntax_highlightings()

syntax match todoPrompt "TODO"
highlight link todoPrompt RedrawDebugClear

