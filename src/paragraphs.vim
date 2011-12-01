"@ ------------------------------------------------------------------------------
"@ Paragraphs                                               *markdown-paragraphs*
"@
"@ A paragraph is simply one or more consecutive lines of text, separated by one
"@ or more blank lines. Normal paragraphs should not be indented with spaces or
"@ tabs. Example: >
"@
"@   This is a sample of paragraph that will separated by blank lines before and
"@   after.
"@
"@ >
"@ 
"@ ------------------------------------------------------------------------------
"@ Line breaks                                             *markdown-line-breaks*
"@
"@ The line breaks can be included inside a paragraph by two or more spaces
"@ followed by return. Example: >
"@    
"@   This is a sample of paragraph that will separated by blank lines and   
"@   contains a line break.

syntax match markdownLineBreak /\s\{2,}$/ conceal cchar=¬ "cchar=¶

syntax cluster markdownParagraph contains=markdownLineBreak,@markdownSpans

Highlight markdownLineBreak Comment

syntax cluster markdownBlocks contains=@markdownParagraph

