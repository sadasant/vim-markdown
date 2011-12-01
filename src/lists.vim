"@ ------------------------------------------------------------------------------
"@ Lists                                                         *markdown-lists*
"@
"@ Unordered (bulleted) lists use asterisks and hyphens (* and -) and ordered
"@ lists use plus (+). >
"@
"@   Unordered list:
"@
"@   * item two
"@   * item one
"@   * item three
"@
"@   Or
"@
"@   - item two
"@   - item one
"@   - item three
"@
"@   Ordered list:
"@
"@   + item one
"@   + item two
"@   + item three
"@
"@   Or uses nested list:
"@
"@   + Item one
"@
"@     It's possible includes paragraphs.
"@
"@     - content 1.1
"@     - content 1.2
"@
"@   + Item two
"@
"@     - content 2.1
"@     - content 2.2
"@ >
"@

" Lists
" TOFIX: Lists and codeblocks collide
syntax match markdownListItemRule /^\([\*\+\-]\|\s\{0,3}[\*\+\-]\)\s/
syntax region markdownListItem matchgroup=markdownListItemRule start=/^\([\*\+\-]\|\s\{1,}[\*\+\-]\)\s/ end=/$/

"syntax match markdownListMultiLineItemRule /^\(\s\{4,}\|\t{1,}\)[\*\+\-]\s/

"/^[\*\-\+].*$\n/
"/^\s*\zs[\*\+\-].*$/

" List items
"syntax match markdownListItem /^\s*[-*+]\s\+.*\n\(\(^.\+\n\)*\n\?\)\(\(^\(\s\{4}\|\t\)\+.*\n\)\(^.\+\n\)*\n\?\)*/  contains=@markdownSpan
"syntax match markdownListItem /^\s*\d\+\.\s\+.*\n\(\(^.\+\n\)*\n\?\)\(\(^\(\s\{4}\|\t\)\+.*\n\)\(^.\+\n\)*\n\?\)*/ contains=@markdownSpan

"syntax region markdownListItem matchgroup=markdownListOneItemRule start="^[\*\-\+].*$\n" end="$\n"
"
"syntax cluster markdownList contains=markdownListOneItemRule,markdownListItem
"Highlight markdownListMultiLineItemRule Special

Highlight markdownListItemRule Identifier
Highlight markdownListItem String

syntax cluster markdownBlocks contains=markdownListItem

