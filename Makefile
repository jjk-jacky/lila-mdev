it: all

include config.mak

BINS = mdev-disk mdev-dm mdev-debug
CONF = mdev.conf

%: %.in
	sed -e 's#@BINDIR@#$(bindir)#' -e 's#@LIBDIR@#$(libdir)#' $^ > $@

all: $(BINS) $(CONF)

install: it
	for bin in $(BINS); do \
		install -Dm744 $$bin $(DESTDIR)$(libdir)/lila-mdev/$$bin; \
	done
	for f in $(CONF); do \
		install -Dm644 $$f $(DESTDIR)/etc/$$f; \
	done

clean:
	rm -f $(BINS) $(CONF)
distclean: clean
	rm -f config.mak

.PHONY: install it all clean distclean
