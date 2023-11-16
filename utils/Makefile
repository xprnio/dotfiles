SOURCES := go-tpl
MAKE_DIRS := go-tpl

.PHONY: $(MAKE_DIRS)

clean:
	@for util in $(SOURCES); do \
		$(MAKE) --directory $(CURDIR)/$$util clean; \
	done
	rm -f $(CURDIR)/bin/go-tpl

build: $(MAKE_DIRS)
	mkdir -p "$(CURDIR)/bin"
	ln -fs $(CURDIR)/go-tpl/bin/go-tpl $(CURDIR)/bin/go-tpl

$(MAKE_DIRS):
	$(MAKE) --directory=$@ build
