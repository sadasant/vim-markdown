"@ ------------------------------------------------------------------------------
"@ Bold                                                           *markdown-bold*
"@ 
"@ *Markdown* uses double asterisks or underscores to indicate spans of bold. >
"@ 
"@   This text has **several** __bold__. But if you want use strong emphasis,
"@   just write using double **asterisks** or __underscores__.
"@ >
"@ 
syntax region markdownBoldAsterisk   start=/\*\*\S\@=/ end=/\S\@<=\*\*/ keepend contains=markdownDoubleAsterisk,@Spell
syntax region markdownBoldUnderscore start=/__\S\@=/   end=/\S\@<=__/   keepend contains=markdownDoubleUnderscore,@Spell

syntax match markdownDoubleAsterisk   contained "\*\*" conceal
syntax match markdownDoubleUnderscore contained "__"   conceal

Highlight markdownDoubleAsterisk   Operator
Highlight markdownDoubleUnderscore Operator

Highlight markdownBoldUnderscore htmlBold
Highlight markdownBoldAsterisk   htmlBold

