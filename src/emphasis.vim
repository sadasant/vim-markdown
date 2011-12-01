"@ ------------------------------------------------------------------------------
"@ Phase emphasis                                             *markdown-emphasis*
"@ 
"@ *Markdown* uses asterisks and underscores to indicate spans of emphasis. >
"@ 
"@   This text has *several* _emphasis_. But if you want use strong emphasis,
"@   just write using double **asterisks** or __underscores__.
"@ >
"@ 

syntax region markdownEmphasis start=/_\S\@=/  end=/\S\@<=_/  keepend contains=markdownUnderscore,@Spell
syntax region markdownEmphasis start=/\*\S\@=/ end=/\S\@<=\*/ keepend contains=markdownAsterisk,@Spell

Highlight markdownEmphasis htmlItalic

syntax cluster markdownSpans contains=markdownEmphasis

syntax region markdownBold start=/\*\*\S\@=/ end=/\S\@<=\*\*/ keepend contains=markdownAsterisk,markdownAsterisk,@Spell
syntax region markdownBold start=/__\S\@=/   end=/\S\@<=__/   keepend contains=markdownUnderscore,markdownUnderscore,@Spell

Highlight markdownBold htmlBold

syntax cluster markdownSpans contains=markdownBold

syntax region markdownBoldEmphasis start=/\*__\S\@=/   end=/\S\@<=__\*/   keepend contains=markdownAsterisk,markdownUnderscore,markdownUnderscore,@Spell
syntax region markdownBoldEmphasis start=/\*\*_\S\@=/  end=/\S\@<=_\*\*/  keepend contains=markdownAsterisk,markdownAsterisk,markdownUnderscore,@Spell
syntax region markdownBoldEmphasis start=/\*\*\*\S\@=/ end=/\S\@<=\*\*\*/ keepend contains=markdownAsterisk,markdownAsterisk,markdownAsterisk,@Spell

syntax region markdownBoldEmphasis start=/_\*\*\S\@=/  end=/\S\@<=\*\*_/  keepend contains=markdownUnderscore,markdownAsterisk,markdownAsterisk,@Spell
syntax region markdownBoldEmphasis start=/__\*\S\@=/   end=/\S\@<=\*__/   keepend contains=markdownUnderscore,markdownUnderscore,markdownAsterisk,@Spell
syntax region markdownBoldEmphasis start=/___\S\@=/    end=/\S\@<=___/    keepend contains=markdownUnderscore,markdownUnderscore,markdownUnderscore,@Spell

Highlight markdownBoldEmphasis htmlBoldItalic

syntax cluster markdownSpans contains=markdownBoldEmphasis

