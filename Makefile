.POSIX:

# DESTDIR is empty by default
NAME = gnup
SHELL = /bin/sh
OS = $(shell uname -s)
ifndef PREFIX
	PREFIX = /usr/local
endif
ifndef MANPREFIX
	MANPREFIX = $(PREFIX)/share/man
endif

install:
	# Binaries
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	for script in bin/*; do \
		cp -f $$script $(DESTDIR)$(PREFIX)/bin/; \
		chmod 755 $(DESTDIR)$(PREFIX)/$$script; \
	done
	# Assets (like configs)
	mkdir -p $(DESTDIR)$(PREFIX)/share/gnup
	chmod 755 $(DESTDIR)$(PREFIX)/share/gnup
	for shared in share/*; do \
		cp -f $$shared $(DESTDIR)$(PREFIX)/share/gnup; \
		chmod 644 $(DESTDIR)$(PREFIX)/share/gnup/$$(basename $(notdir $$shared)); \
	done
	# Manpage
	mkdir -p $(DESTDIR)$(MANPREFIX)/man1
	cp -f gnup.1 $(DESTDIR)$(MANPREFIX)/man1/gnup.1
	chmod 644 $(DESTDIR)$(MANPREFIX)/man1/gnup.1
	# Not sure
	if [ "$(PREFIX)" ]; then \
		sed -iba 's|/usr/local|$(PREFIX)|' $(DESTDIR)$(PREFIX)/share/gnup/gnuprc; \
		rm -f $(DESTDIR)$(PREFIX)/share/gnup/gnuprcba; \
		sed -iba 's|/usr/local|$(PREFIX)|' $(DESTDIR)$(PREFIX)/bin/gnup; \
		rm -f $(DESTDIR)$(PREFIX)/bin/gnupba; \
		sed -iba 's|/usr/local|$(PREFIX)|' $(DESTDIR)$(MANPREFIX)/man1/gnup.1; \
		rm -f $(DESTDIR)$(MANPREFIX)/man1/gnup.1ba; \
	fi

uninstall:
	for script in bin/*; do \
		rm -f $(DESTDIR)$(PREFIX)/$$script; \
	done
	rm -rf $(DESTDIR)$(PREFIX)/share/gnup
	rm -f $(DESTDIR)$(MANPREFIX)/man1/gnup.1

.PHONY: install uninstall
