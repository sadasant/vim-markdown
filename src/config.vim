if exists("b:current_syntax")
  finish
endif

" Commands for compatibilities and helpers
if version < 508
  syntax clear
  command! -nargs=+ Highlight highlight link <args>
  command! -nargs=+ Load source <sfile>:p:h/<args>
  source <sfile>:p:h/html.vim " Read the HTML syntax
else
  runtime! syntax/html.vim " Read the HTML syntax
  command! -nargs=+ Highlight highlight default link <args>
  command! -nargs=+ Load runtime! syntax/<args>
  unlet b:current_syntax
endif

syntax spell toplevel
syntax sync minlines=10
syntax sync linebreaks=1
"syntax case ignore

