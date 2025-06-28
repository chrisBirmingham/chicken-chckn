.PHONY: all install clean uninstall

PROG=chckn
PREFIX?=/usr/local
BINDIR=$(PREFIX)/bin

all: $(PROG)

$(PROG): chckn.scm
	chicken-install -n

install: $(PROG)
	mkdir -p $(BINDIR)
	cp $(PROG) $(BINDIR)

clean:
	rm -f $(PROG) $(PROG).build.sh $(PROG).install.sh

uninstall:
	rm -f$(BINDIR)/$(PROG)

