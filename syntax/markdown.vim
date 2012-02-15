" Vim syntax file
" Language: Markdown
" Author:   Hallison Batista <hallison.batista@gmail.com>
" URL:      http://github.com/hallison/vim-markdown/
" Version:  v1.2.2
" Release:  2011-03-02 20:06:53 -0400
" Remark:
"   This syntax plugin was fully rewritten from source written by Ben Williams <benw@plasticboy.com>
" Remark:
"   Uses HTML syntax file
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
syntax match markdownLineBreak /\s\{2,}$/ conceal cchar=¬ "cchar=¶
syntax cluster markdownParagraph contains=markdownLineBreak,@markdownSpans
Highlight markdownLineBreak Comment
syntax cluster markdownBlocks contains=@markdownParagraph
syntax match markdownHeaderUnderline contained /^[=-]\+$/
syntax match markdownHeaderLine      contained /^[#]{1,6}/
syntax match markdownHeader1 /^.\+\n=\+$/ contains=markdownHeaderUnderline,@markdownStyle,@Spell
syntax match markdownHeader2 /^.\+\n-\+$/ contains=markdownHeaderUnderline,@markdownStyle,@Spell
syntax region markdownHeader1 start="^\s*#"      end="\($\|#\+\)" contains=markdownHash,@markdownSpanElements,@Spell
syntax region markdownHeader2 start="^\s*##"     end="\($\|#\+\)" contains=markdownHash,@markdownSpanElements,@Spell
syntax region markdownHeader3 start="^\s*###"    end="\($\|#\+\)" contains=markdownHash,@markdownSpanElements,@Spell
syntax region markdownHeader4 start="^\s*####"   end="\($\|#\+\)" contains=markdownHash,@markdownSpanElements,@Spell
syntax region markdownHeader5 start="^\s*#####"  end="\($\|#\+\)" contains=markdownHash,@markdownSpanElements,@Spell
syntax region markdownHeader6 start="^\s*######" end="\($\|#\+\)" contains=markdownHash,@markdownSpanElements,@Spell
" Highlight headers
Highlight markdownHeader1         htmlH1
Highlight markdownHeader2         htmlH2
Highlight markdownHeader3         htmlH3
Highlight markdownHeader4         htmlH4
Highlight markdownHeader5         htmlH5
Highlight markdownHeader6         htmlH6
Highlight markdownHeaderUnderline Operator
Highlight markdownHeaderLine      Operator
syntax cluster markdownBlocks contains=markdownHeader1,markdownHeader2,markdownHeader3,markdownHeader4,markdownHeader5,markdownHeader6
" Blockquotes
syntax match  markdownBlockquoteRule /^[>]\{1,6}/ contained conceal
syntax region markdownBlockquote matchgroup=markdownBlockquoteRule start=/^\s*>/ end=/$/ contains=@markdownBlock,@Spell
Highlight markdownBlockquoteRule Ignore
Highlight markdownBlockquote     htmlItalic
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
"syntax cluster markdownList contains=markdownListOneItemRule,markdownListItem
"Highlight markdownListMultiLineItemRule Special
Highlight markdownListItemRule Identifier
Highlight markdownListItem String
syntax cluster markdownBlocks contains=markdownListItem
syntax match markdownCodeBlockRule /^\(\s\{4}\|\t{1}\)[^\*\-\+]/ conceal
" Code Block
syntax region markdownCodeBlock matchgroup=markdownCodeBlockRule start=/^\(\s\{4}\|\t{1}\)[^\*\-\+]/ end="$"
syntax region markdownCodeBlock start=/^```$/ end=/^```$/ keepend contains=markdownBacktick
Highlight markdownCodeBlockRule Identifier
Highlight markdownCodeBlock     Identifier
syntax cluster markdownBlocks contains=markdownCodeBlock,@Spell
"MKD_HRULES
syntax region markdownLink      start="\[\S\@="    end="\S\@<=\]\s\{,1}[\[(]"me=e-1 skipwhite keepend oneline nextgroup=markdownLinkUrl,markdownLinkId contains=markdownBracketLeft,markdownBracketRight,@Spell
syntax region markdownLinkId    start="\["         end="\]"  contained keepend oneline conceal contains=markdownBracketLeft,markdownBracketRight
syntax region markdownLinkId    start="^\s\{,3}\[" end="\]:" keepend oneline skipwhite nextgroup=markdownUrl,markdownLinkTitle contains=markdownBracketLeft,markdownBracketRight,markdownColon
syntax region markdownLinkUrl   start="("          end=")"   contained keepend oneline contains=markdownLinkExternalUrl,markdownParenthesisRight,markdownLinkTitle
syntax region markdownLinkTitle start=+"+          end=+"+   contained keepend contains=markdownQuote,@Spell
syntax region markdownLinkTitle start=+'+          end=+'+   contained keepend contains=markdownApostrophe,@Spell
syntax region markdownLinkTitle start=+(+          end=+)+   contained keepend contains=markdownParenthesisLeft,markdownParenthesisRight,@Spell
syntax match markdownLinkExternalUrl contained "("    nextgroup=markdownUrl conceal cchar=> "cchar=»
syntax match markdownUrl             contained "\S\+" nextgroup=markdownLinkTitle skipwhite skipnl
Highlight markdownLink            htmlLink
Highlight markdownLinkId          Identifier
Highlight markdownLinkUrl         Operator
Highlight markdownLinkTitle       Comment
Highlight markdownUrl             String
Highlight markdownLinkExternalUrl Operator
syntax cluster markdownSpans contains=markdownLink
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
" Code
syntax region markdownCode start=/\\\@<!`/    end=/\\\@<!`/    keepend contains=markdownBacktick
syntax region markdownCode start=/\s*``[^`]*/ end=/[^`]*``\s*/ keepend contains=markdownBacktick
syntax region markdownCode start=/<pre[^>]*/  end=/<\/pre>/    keepend
syntax region markdownCode start=/<code[^>]*/  end=/<\/code>/  keepend
Highlight markdownCode Identifier
syntax cluster markdownSpans contains=markdownCode,@Spell
"MKD_IMAGE
let b:current_syntax = "markdown"
delcommand Highlight
" vim:tabstop=2
