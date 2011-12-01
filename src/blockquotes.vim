" Blockquotes
syntax match  markdownBlockquoteRule /^[>]\{1,6}/ contained conceal
syntax region markdownBlockquote matchgroup=markdownBlockquoteRule start=/^\s*>/ end=/$/ contains=@markdownBlock,@Spell

Highlight markdownBlockquoteRule Ignore
Highlight markdownBlockquote     htmlItalic

