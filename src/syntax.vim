" Vim syntax file
" Language: b:plugin.language
" Author:   b:plugin.author
" URL:      b:plugin.url
" Version:  b:plugin.version
" Release:  b:plugin.release
" Remark:
"   b:plugin.remark
" Remark:
"   Uses HTML syntax file

"MKD_CONFIG

"@ *markdown* - Syntax highlight for Vim editor
"@
"@ Keywords: *markdown* *mkd*
"@
"@ ==============================================================================
"@ Contents                                                   *markdown-contents*
"@
"@   1. Information about this plugin......................|markdown|
"@   2. Markdown Syntax....................................|markdown-syntax|
"@      2.1. Paragraphs....................................|markdown-paragraphs|
"@      2.2. Line breaks...................................|markdown-line-breaks|
"@      2.3. Headers.......................................|markdown-headers|
"@      2.4. Blockquotes...................................|markdown-blockquotes|
"@      2.5. Lists.........................................|markdown-lists|
"@      2.6. Codeblocks....................................|markdown-codeblocks|
"@      2.7. Horizontal rules..............................|markdown-hrules|
"@      2.8. Links.........................................|markdown-links|
"@      2.9. Emphasis......................................|markdown-emphasis|
"@      2.10. Code.........................................|markdown-code|
"@      2.11. Images.......................................|markdown-images|
"@   3. Snippets...........................................|markdown-snippets|
"@
"@ ==============================================================================
"@ Information about this plugin                                       *markdown*
"@
"@ Author          : Hallison Batista <hallison.batista@gmail.com>
"@ Vim Script Page : http://www.vim.org/scripts/script.php?script_id=2882
"@ Repository      : http://github.com/hallison/vim-markdown
"@
"@ ==============================================================================
"@ Formatting Syntax                                            *markdown-syntax*
"@
"@ The full syntax reference can be read in the official site of the author John
"@ Grubber http://daringfireball.net/projects/markdown/.
"@
"@ This *plugin* is a *syntax* *highlight* and was developed and tested using
"@ the official parser implemented by John Grubber in Perl. Other parsers was
"@ used:
"@
"@ * maruku    - Ruby implementation library.
"@ * rdiscount - Ruby implementation library.
"@

"MKD_PARAGRAPHS

"MKD_HEADERS

"MKD_BLOCKQUOTES

"MKD_LISTS

"MKD_CODEBLOCKS

"MKD_HRULES

"MKD_LINK

"MKD_EMPHASIS

"MKD_CODE

"MKD_IMAGE

let b:current_syntax = "markdown"

delcommand Highlight

" vim:tabstop=2
