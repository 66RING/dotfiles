function! theme#theme_init(colormode, ...)
    if a:0 == 0
        let l:colorscheme = 'oceanic_material'
    else
        let l:colorscheme = a:1
    endif

	if ! exists('g:colors_name')
        let &background=a:colormode
		silent! execute 'colorscheme' l:colorscheme
	endif
endfunction
