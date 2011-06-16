function! HighlightGroup()
  if !exists("*synstack")
    return
  endif
  return string(map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")'))
endfunction

" get highlight
map <leader>gh :echo HighlightGroup()<cr>

