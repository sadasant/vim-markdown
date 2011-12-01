"@ ------------------------------------------------------------------------------
"@ Blockquotes                                             *markdown-blockquotes*
"@ 
"@ A blockquote text must start with > a
"@

syntax match markdownCodeBlockRule /^\(\s\{4}\|\t{1}\)[^\*\-\+]/ conceal

" Code Block
syntax region markdownCodeBlock matchgroup=markdownCodeBlockRule start=/^\(\s\{4}\|\t{1}\)[^\*\-\+]/ end="$"
syntax region markdownCodeBlock start=/^```$/ end=/^```$/ keepend contains=markdownBacktick

Highlight markdownCodeBlockRule Identifier
Highlight markdownCodeBlock     Identifier

syntax cluster markdownBlocks contains=markdownCodeBlock,@Spell

