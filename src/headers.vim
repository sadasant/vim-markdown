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
"@ >
"@ 
"@ To create an atx-style header, you put 1-6 hash marks (#) at the beginning of
"@ the line — the number of hashes equals the resulting HTML header level.
"@ 

"
syntax cluster markdownHeaders contains=markdownHeader1,markdownHeader2,markdownHeader3,markdownHeader4,markdownHeader5,markdownHeader6
syntax match   markdownHeaderBlockRule /^[=-]\+$/  contained
syntax match   markdownHeaderLineRule  /^[#]{1,6}/ contained conceal

syntax match  markdownHeader1 /^.\+\n=\+$/ contains=markdownHeaderBlockRule,@markdownStyle,@Spell
syntax match  markdownHeader2 /^.\+\n-\+$/ contains=markdownHeaderBlockRule,@markdownStyle,@Spell

syntax region markdownHeader1 matchgroup=markdownHeaderLineRule start="^\s*#"      end="\($\|#\+\)" contains=@markdownStyle,@Spell
syntax region markdownHeader2 matchgroup=markdownHeaderLineRule start="^\s*##"     end="\($\|#\+\)" contains=@markdownStyle,@Spell
syntax region markdownHeader3 matchgroup=markdownHeaderLineRule start="^\s*###"    end="\($\|#\+\)" contains=@markdownStyle,@Spell
syntax region markdownHeader4 matchgroup=markdownHeaderLineRule start="^\s*####"   end="\($\|#\+\)" contains=@markdownStyle,@Spell
syntax region markdownHeader5 matchgroup=markdownHeaderLineRule start="^\s*#####"  end="\($\|#\+\)" contains=@markdownStyle,@Spell
syntax region markdownHeader6 matchgroup=markdownHeaderLineRule start="^\s*######" end="\($\|#\+\)" contains=@markdownStyle,@Spell

" Highlight headers
Highlight markdownHeader1         htmlH1
Highlight markdownHeader2         htmlH2
Highlight markdownHeader3         htmlH3
Highlight markdownHeader4         htmlH4
Highlight markdownHeader5         htmlH5
Highlight markdownHeader6         htmlH6
Highlight markdownHeaderBlockRule Operator
Highlight markdownHeaderLineRule  Operator

