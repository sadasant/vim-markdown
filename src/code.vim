" Code

syntax region markdownCode start=/\\\@<!`/    end=/\\\@<!`/    keepend contains=markdownBacktick
syntax region markdownCode start=/\s*``[^`]*/ end=/[^`]*``\s*/ keepend contains=markdownBacktick
syntax region markdownCode start=/<pre[^>]*/  end=/<\/pre>/    keepend contains=htmlTag
syntax region markdownCode start=/<code[^>]/  end=/<\/code>/   keepend contains=htmlTag
syntax match  markdownBacktick contained "`" conceal

Highlight markdownCode Identifier
Highlight markdownBacktick Operator

