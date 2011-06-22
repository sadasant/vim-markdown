" Code

syntax region markdownCode start=/\\\@<!`/    end=/\\\@<!`/    keepend contains=markdownBacktick
syntax region markdownCode start=/\s*``[^`]*/ end=/[^`]*``\s*/ keepend contains=markdownBacktick
syntax region markdownCode start=/<pre[^>]*/  end=/<\/pre>/    keepend
syntax region markdownCode start=/<code[^>]*/  end=/<\/code>/  keepend

Highlight markdownCode Identifier

