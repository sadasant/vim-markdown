"@ ------------------------------------------------------------------------------
"@ Phase emphasis                                             *markdown-emphasis*
"@ 
"@ *Markdown* uses asterisks and underscores to indicate spans of emphasis. >
"@ 
"@   This text has *several* _emphasis_. But if you want use strong emphasis,
"@   just write using double **asterisks** or __underscores__.
"@ >
"@ 

syntax region markdownEmphasisUnderscore start=/_\S\@=/  end=/\S\@<=_/  keepend contains=markdownUnderscore,@Spell
syntax region markdownEmphasisAsterisk   start=/\*\S\@=/ end=/\S\@<=\*/ keepend contains=markdownAsterisk,@Spell

syntax match markdownAsterisk   contained "\*" conceal
syntax match markdownUnderscore contained "_"  conceal

Highlight markdownAsterisk   Operator
Highlight markdownUnderscore Operator

Highlight markdownEmphasisUnderscore htmlItalic
Highlight markdownEmphasisAsterisk   htmlItalic

