function! autoload#smart_split(cmd)
  if winnr('$')>=4 || winwidth(0) < 120
    exec a:cmd
  else
    exec "vsplit"
    exec a:cmd
  endif
endfunction
