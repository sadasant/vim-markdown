if exists("b:current_syntax")
  finish
endif

" Commands for compatibilities and helpers
if version < 508
  syntax clear
  command! -nargs=+ Highlight highlight link <args>
  " Read the HTML syntax
  source <sfile>:p:h/html.vim
else
  command! -nargs=+ Highlight highlight default link <args>
  " Read the HTML syntax
  runtime! syntax/html.vim
endif

unlet b:current_syntax

syntax spell toplevel
syntax sync minlines=10
syntax sync linebreaks=1
"syntax case ignore

syntax match markdownAsterisk         contained "\*"   conceal
syntax match markdownPlus             contained "+"   "conceal
syntax match markdownMinus            contained "\-"  "conceal
syntax match markdownUnderscore       contained "_"    conceal
syntax match markdownHash             contained "#"   "conceal
syntax match markdownBacktick         contained "`"    conceal
syntax match markdownQuote            contained "\""   conceal
syntax match markdownApostrophe       contained "'"    conceal
syntax match markdownColon            contained ":"   "conceal
syntax match markdownBracketLeft      contained "\["   conceal
syntax match markdownBracketRight     contained "\]"   conceal
syntax match markdownParenthesisLeft  contained "("    conceal
syntax match markdownParenthesisRight contained ")"    conceal

Highlight markdownAsterisk         Operator
Highlight markdownPlus             Operator
Highlight markdownMinus            Operator
Highlight markdownUnderscore       Operator
Highlight markdownHash             Operator
Highlight markdownBacktick         Operator
Highlight markdownQuote            Operator
Highlight markdownApostrophe       Operator
Highlight markdownColon            Operator
Highlight markdownBracketLeft      Operator
Highlight markdownBracketRight     Operator
Highlight markdownParenthesisLeft  Operator
Highlight markdownParenthesisRight Operator

" Escapes
syntax match markdownEscapeChars "\\[][\\`*_{}()#+.!-]"

" Spans
syntax cluster markdownSpan       contains=@markdownStyle,markdownLineBreak,markdownLink
syntax cluster markdownStyle      contains=markdownBold,markdownEmphasis,markdownBoldEmphasis,markdownCode,htmlSpecialChar
syntax match   markdownStyleRule  /^\s*_\s\{0,1}_\s\{0,1}_$/

