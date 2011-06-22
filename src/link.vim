"@ ------------------------------------------------------------------------------
"@ Links                                                         *markdown-links*
"@ 

syntax region markdownLink      start="\[\S\@="      end="\S\@<=\]\s\{,1}[\[(]"me=e-1 skipwhite keepend oneline nextgroup=markdownLinkUrl,markdownLinkId contains=markdownBracketLeft,markdownBracketRight,@Spell
syntax region markdownLinkId    start="\["           end="\]" oneline contained keepend conceal contains=markdownBracketLeft,markdownBracketRight
syntax region markdownLinkId    start="^ \{,3}\zs\[" end="\]:" skipwhite keepend oneline nextgroup=markdownUrl,markdownLinkTitle contains=markdownBracketLeft,markdownBracketRight,markdownColon
syntax region markdownLinkUrl   start="("            end=")"  oneline contained keepend contains=markdownLinkExternalUrl,markdownParenthesisRight,markdownLinkTitle
syntax region markdownLinkTitle start=+"+            end=+"+  contained keepend contains=markdownQuote,@Spell
syntax region markdownLinkTitle start=+'+            end=+'+  contained keepend contains=markdownApostrophe,@Spell
syntax region markdownLinkTitle start=+(+            end=+)+  contained keepend contains=markdownParenthesisLeft,markdownParenthesisRight,@Spell

syntax match markdownLinkExternalUrl contained "("    nextgroup=markdownUrl conceal cchar=> "cchar=»
syntax match markdownUrl             contained "\S\+" nextgroup=markdownLinkTitle skipwhite skipnl

Highlight markdownLink            htmlLink
Highlight markdownLinkId          Identifier
Highlight markdownLinkUrl         Operator
Highlight markdownLinkTitle       Comment

Highlight markdownUrl             String
Highlight markdownLinkExternalUrl Operator

