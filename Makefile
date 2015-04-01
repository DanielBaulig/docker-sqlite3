PROJECT=sqlite3
SQLITE_VERSION=3080803
SQLITE_DIR=sqlite-autoconf-$(SQLITE_VERSION)
SQLITE_URL=https://www.sqlite.org/2015/sqlite-autoconf-$(SQLITE_VERSION).tar.gz
USERNAME=dbaulig
IMAGE=$(USERNAME)/$(PROJECT)

default: dist

$(SQLITE_DIR)/configure:
	curl $(SQLITE_URL) | tar xz

$(SQLITE_DIR)/Makefile: $(SQLITE_DIR)/configure
	cd $(dir $<) && ./configure --enable-static LDFLAGS=-static

$(SQLITE_DIR)/sqlite3: $(SQLITE_DIR)/Makefile
	$(MAKE) -C $(dir $<)

bin/sqlite3: $(SQLITE_DIR)/sqlite3
	mkdir -p $(dir $@)
	cp $< $@

dist: dist/$(PROJECT).tar

refs/latest: Dockerfile bin/sqlite3
	mkdir -p refs
	latest=$$(sudo docker build -t $(IMAGE) . |tee /dev/stderr |sed -rn 's/Successfully built (.+)$$/\1/p'); [ -z "$$latest" ] && exit 1; echo "$$latest" >$@;

dist/$(PROJECT).tar: refs/latest
	mkdir -p dist
	sudo docker save $$(cat refs/latest) >dist/$(PROJECT).tar

clean: 
	rm -rf refs/ bin/
	-$(MAKE) -C $(SQLITE_DIR) distclean

mrproper: clean
	rm -rf $(SQLITE_DIR)

dist-clean: mrproper
	rm -rf dist/

.PHONY: clean dist-clean dist default
