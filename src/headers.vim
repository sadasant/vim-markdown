"@ ------------------------------------------------------------------------------
"@ Headers                                                      *markdown-headers*
"@ 
"@ For headers, *Markdown* offers two styles to write: setext and atx. Example: >
"@ 
"@   1st level header
"@   ================
"@ 
"@   2nd level header
"@   ----------------
"@ 
"@   Body text and several paragraphs separated by blank lines.
"@ 
"@   ### 3rd level header
"@ 
"@   Body text and several paragraphs separated by blank lines.
"@
"@   #### 4th level header
"@
"@   ##### 5th level header
"@
"@   ###### 6th level header
"@ >
"@ 
"@ To create an atx-style header, you put 1-6 hash marks (#) at the beginning of
"@ the line — the number of hashes equals the resulting HTML header level.
"@ 

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

