" The bold rule /[\*_]{2}(.*?)[\*_]{2}/. Example:
"   **bold with double asterisks** or __bold with double underscores__

syntax match markdownBoldRule /[\*_]\{2}/ conceal

syntax region markdownBold matchgroup=markdownBoldRule start=/\(\*\*\|__\)\S\@=/ end=/\S\zs\(\*\*\|__\)/ keepend contains=markdownNewline,@Spell

Highlight markdownBoldRule htmlBold
Highlight markdownBold htmlBold

