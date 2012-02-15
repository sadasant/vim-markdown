" Vim file type plugin
" Language:   b:plugin.language
" Maintainer: b:plugin.author
" Remark:     This source is a complement of the Vim-Markdown syntax
"             highlight.

autocmd BufNewFile,BufRead *.{md,mkd,mkdn,mark*} set filetype=markdown
autocmd FileType markdown compiler markdown

