" The bold rule /[\*_]{2}(.*?)[\*_]{2}/. Example:
"   **bold with double asterisks** or __bold with double underscores__

syntax region markdownBoldAsterisk   start=/\*\*\S\@=/ end=/\S\@<=\*\*/ keepend contains=markdownDoubleAsterisk,@Spell
syntax region markdownBoldUnderscore start=/__\S\@=/   end=/\S\@<=__/   keepend contains=markdownDoubleUnderscore,@Spell

syntax match markdownDoubleAsterisk   contained "\*\*" conceal
syntax match markdownDoubleUnderscore contained "__"   conceal

Highlight markdownDoubleAsterisk   Operator
Highlight markdownDoubleUnderscore Operator

Highlight markdownBoldUnderscore htmlBold
Highlight markdownBoldAsterisk   htmlBold

