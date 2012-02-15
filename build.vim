set noignorecase

let s:sources = [ "config", "headers", "paragraphs", "lists", "blockquotes", "codeblocks", "code", "emphasis", "link", "highlight" ]

for src in s:sources
  let s:name = "MKD_".toupper(src)
  execute 1
  while search(s:name, "w", line("$")) > 0
    let s:vimsrc = "read src/".src.".vim"
    echo "Set vimsrc ".s:vimsrc
    delete
    execute line(".")-1
    execute s:vimsrc
  endwhile
endfor

let b:plugin = {}
let b:plugin.name     = "markdown"
let b:plugin.language = "Markdown"
let b:plugin.author   = "Hallison Batista <hallison.batista@gmail.com>"
let b:plugin.url      = "http://github.com/hallison/vim-markdown/"
let b:plugin.scm      = "http://github.com/hallison/vim-markdown.git"
let b:plugin.version  = system("git tag | sort | tail -1 | tr -d '\n'")
let b:plugin.release  = system("git log --format='%ai%n' ".b:plugin.version."| head -1 | tr -d '\n'")
let b:plugin.remark   = "This syntax plugin was fully rewritten from source written by Ben Williams <benw@plasticboy.com>"

execute 1

while search("b:plugin.", "w", line("$")) > 0
  let s:key    = matchstr(getline("."), 'b\:plugin\.\w\+')
  let s:value  = eval(s:key)
  let s:value  = substitute(s:value, "\?", '\\\?', "") " fix to url values
  let s:regexp = "s?".s:key."?".s:value."?g"
  execute s:regexp
  execute 1
endwhile

update

