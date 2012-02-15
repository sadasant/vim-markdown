"split test/fixtures/syntax.mkd
split overview.mkd

set columns=86 lines=40

source test/helpers.vim
source src/ftplugin.vim
source src/ftdetect.vim
source src/config.vim

source src/paragraphs.vim
source src/headers.vim
source src/lists.vim
source src/blockquotes.vim
source src/codeblocks.vim
source src/code.vim
source src/link.vim
source src/emphasis.vim

update

