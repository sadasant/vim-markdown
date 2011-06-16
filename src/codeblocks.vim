"@ ------------------------------------------------------------------------------
"@ Blockquotes                                             *markdown-blockquotes*
"@ 
"@ A blockquote text must start with > a
"@

syntax match markdownCodeBlockRule /^\(\s\{4}\|\t{1}\)/ conceal

" Code Block
syntax region markdownCodeBlock matchgroup=markdownCodeBlockRule start="\s\{4}\|\t{1}" end="$"

Highlight markdownCodeBlockRule Ignore
Highlight markdownCodeBlock     Operator
