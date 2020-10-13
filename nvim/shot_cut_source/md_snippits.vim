autocmd Filetype markdown inoremap <buffer> ,f <Esc>/<++><CR>:nohlsearch<CR>c4l
autocmd Filetype markdown inoremap <buffer> ,** <Space>**** <++><Esc>F*hi
autocmd Filetype markdown inoremap <buffer> ,* <Space>** <++><Esc>F*i
autocmd Filetype markdown inoremap <buffer> ,~ <Space>~~~~ <++><Esc>F~hi
autocmd Filetype markdown inoremap <buffer> ,` ```<Enter><++><Enter>```<Enter><Enter><++><Esc>4kA
autocmd Filetype markdown inoremap <buffer> ,} {}<++><Esc>F}i
autocmd Filetype markdown inoremap <buffer> ,) ()<++><Esc>F)i
autocmd Filetype markdown inoremap <buffer> ,] []<++><Esc>F]i
autocmd Filetype markdown inoremap <buffer> ,{ {}<++><Esc>F}i
autocmd Filetype markdown inoremap <buffer> ,( ()<++><Esc>F)i
autocmd Filetype markdown inoremap <buffer> ,[ []<++><Esc>F]i
autocmd Filetype markdown inoremap <buffer> ," ""<++><Esc>F"i
autocmd Filetype markdown inoremap <buffer> ,' ''<++><Esc>F'i
autocmd Filetype markdown inoremap <buffer> ,< <><++><Esc>F>i
autocmd Filetype markdown inoremap <buffer> ,$ $$<++><Esc>F$i
autocmd Filetype markdown inoremap <buffer> ,$$ $$$$<++><Esc>F$hi

autocmd Filetype markdown inoremap <buffer> ,a [](<++>)<++><Esc>F]i
autocmd Filetype markdown inoremap <buffer> ,p ![](<++>)<++><Esc>F]i

autocmd Filetype markdown inoremap <buffer> ,1 #<Space>
autocmd Filetype markdown inoremap <buffer> ,2 ##<Space>
autocmd Filetype markdown inoremap <buffer> ,3 ###<Space>
autocmd Filetype markdown inoremap <buffer> ,4 ####<Space>
autocmd Filetype markdown inoremap <buffer> ,5 #####<Space>




