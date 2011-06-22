"@ ------------------------------------------------------------------------------
"@ Links                                                         *markdown-links*
"@ 

syntax region markdownLink      start="\[\S\@="      end="\S\@<=\]\s\{,1}[\[(]"me=e-1 skipwhite keepend oneline nextgroup=markdownLinkUrl,markdownLinkId contains=markdownBracketLeft,markdownBracketRight,@Spell
syntax region markdownLinkId    start="\["           end="\]" oneline contained keepend conceal contains=markdownBracketLeft,markdownBracketRight
syntax region markdownLinkUrl   start="("            end=")"  oneline contained keepend contains=markdownLinkExternalUrl,markdownParenthesisRight,markdownLinkTitle

syntax match markdownLinkExternalUrl contained "(" conceal cchar=> "cchar=»

Highlight markdownLink            htmlLink
Highlight markdownLinkId          Identifier
Highlight markdownLinkUrl         Operator

Highlight markdownLinkExternalUrl Operator

