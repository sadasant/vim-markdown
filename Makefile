SHELL = /bin/bash

MAKEDIR = build
SRCDIR  = src
PKGDIR  = pkg

PLUGIN  = markdown
VERSION = $(shell git tag | sort | tail -1 | tr -d "[v\n]")
RELEASE = $(shell git log v$(VERSION) --format="%ai" | head -1 | tr -d "\n")

SYNTAX   = $(MAKEDIR)/syntax/$(PLUGIN).vim
COMPILER = $(MAKEDIR)/compiler/$(PLUGIN).vim
FTDETECT = $(MAKEDIR)/ftdetect/$(PLUGIN).vim
FTPLUGIN = $(MAKEDIR)/ftplugin/$(PLUGIN).vim
SNIPPETS = $(MAKEDIR)/snippets/$(PLUGIN).snippets
SOURCES  = $(SYNTAX) $(COMPILER) $(FTDETECT) $(FTPLUGIN) $(SNIPPETS)

VIMBALL  = $(PLUGIN)-$(VERSION).vba

HELP     		= $(MAKEDIR)/doc/$(PLUGIN).txt
README   		= $(MAKEDIR)/README.mkd
PLUGIN_INFO = $(MAKEDIR)/plugin-info.txt

vim = vim -n

.PHONY: $(MAKEDIR)

all: build doc

build: $(VIMBALL)

doc: $(HELP) $(README) $(PLUGIN_INFO)

install: all
	$(vim) $(VIMBALL) -c "source % | quit!"

uninstall:
	$(vim) -c "RmVimball markdown <cr>" -c "quit!"

clean:
	rm -rf $(MAKEDIR)/*
	rm -rf $(VIMBALL)
	rm -rf $(PKGDIR)/$(VIMBALL).*

dist: all
	mkdir -p $(PKGDIR)
	gzip $(VIMBALL)
	mv $(VIMBALL).gz $(PKGDIR)

$(SOURCES):
	mkdir -p $(@D)
	cp $(SRCDIR)/$(notdir $(@D))$(suffix $(@F)) $(@)
	$(vim) --noplugin $(@) -c "source build.vim | exit!"

$(HELP): %$(PLUGIN).txt:
	mkdir -p $(*)
	rm -f $(@)
	cat $(SYNTAX) $(SNIPPETS) > $(@)
	sed -i -run 's/^(["#]@|["#]@.)//gp' $(@)
	echo "vim:tw=78:ts=8:ft=help:norl:" >> $(@)
	sed -i -r '/^(["#]@|["#]@.)/d;/^$$/d;/^"$$/d' $(SYNTAX)
	sed -i -r '/^(["#]@|["#]@.)/d;/^$$/d;/^"$$/d' $(SNIPPETS)

$(README):
	cp README.mkd $(MAKEDIR)

$(PLUGIN_INFO):
	cp plugin-info.txt $(@)
	$(vim) --noplugin $(@) -c "source build.vim | exit!"

mkmanifest = for src in $(subst $(MAKEDIR)/,,$(^)); do echo $${src} >> manifest; done
mkvimball  = vim -n manifest -c "%MkVimball! $(VIMBALL) ." -c "exit!"

$(VIMBALL): $(SOURCES) $(HELP)
	cd $(MAKEDIR) && rm -f manifest && $(mkmanifest) && $(mkvimball) && mv $(VIMBALL) ..

