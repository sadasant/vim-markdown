"@ ------------------------------------------------------------------------------
"@ Paragraphs                                               *markdown-paragraphs*
"@
"@ A paragraph is simply one or more consecutive lines of text, separated by one
"@ or more blank lines.  Normal paragraphs should not be indented with spaces or
"@ tabs. Example: >
"@
"@   This is a sample of paragraph that will separated by blank lines before and
"@   after.
"@
"@ >

" Paragraph and line matches
syntax match markdownLineContinue /.$/       contained
syntax match markdownLineBreak    /\s\{2,}$/ conceal cchar=_
syntax match markdownNewline      /^[<@]\@!/ nextgroup=@markdownBlock

Highlight markdownLineContinue Ignore
Highlight markdownLineBreak    Comment

