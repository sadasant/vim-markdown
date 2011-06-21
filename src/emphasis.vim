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

syntax region markdownBoldEmphasisDoubleAsteriskUnderscore start=/\*\*_\S\@=/ end=/\S\@<=_\*\*/ keepend contains=markdownDoubleAsteriskUnderscore,markdownUnderscoreDoubleAsterisk,@Spell
syntax region markdownBoldEmphasisUnderscoreDoubleAsterisk start=/_\*\*\S\@=/ end=/\S\@<=\*\*_/ keepend contains=markdownUnderscoreDoubleAsterisk,markdownDoubleAsteriskUnderscore,@Spell
syntax match  markdownDoubleAsteriskUnderscore contained "\*\*_" conceal
syntax match  markdownUnderscoreDoubleAsterisk contained "_\*\*" conceal

Highlight markdownBoldEmphasisDoubleAsteriskUnderscore htmlBoldItalic
Highlight markdownBoldEmphasisUnderscoreDoubleAsterisk htmlBoldItalic

Highlight markdownDoubleAsteriskUnderscore Operator
Highlight markdownUnderscoreDoubleAsterisk Operator

syntax region markdownBoldEmphasisDoubleUnderscoreAsterisk start=/__\*\S\@=/ end=/\S\@<=\*__/ keepend contains=markdownDoubleUnderscoreAsterisk,markdownAsteriskDoubleUnderscore,@Spell
syntax region markdownBoldEmphasisAsteriskDoubleUnderscore start=/\*__\S\@=/ end=/\S\@<=__\*/ keepend contains=markdownAsteriskDoubleUnderscore,markdownDoubleUnderscoreAsterisk,@Spell
syntax match  markdownDoubleUnderscoreAsterisk contained "__\*" conceal
syntax match  markdownAsteriskDoubleUnderscore contained "\*__" conceal

Highlight markdownBoldEmphasisDoubleUnderscoreAsterisk htmlBoldItalic
Highlight markdownBoldEmphasisAsteriskDoubleUnderscore htmlBoldItalic
Highlight markdownDoubleUnderscoreAsterisk Operator
Highlight markdownAsteriskDoubleUnderscore Operator

syntax region markdownBoldEmphasisAsterisk start=/\*\*\*\S\@=/ end=/\S\@<=\*\*\*/ keepend contains=markdownTripleAsterisk,@Spell
syntax match  markdownTripleAsterisk contained "\*\*\*" conceal

Highlight markdownBoldEmphasisAsterisk htmlBoldItalic
Highlight markdownTripleAsterisk Operator

syntax region markdownBoldEmphasisUnderscore start=/___\S\@=/    end=/\S\@<=___/    keepend contains=markdownTripleUnderscore,@Spell
syntax match  markdownTripleUnderscore contained "___"   conceal

Highlight markdownBoldEmphasisUnderscore htmlBoldItalic
Highlight markdownTripleUnderscore Operator

