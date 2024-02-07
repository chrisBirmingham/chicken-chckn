EXE=chckn
.PHONY: all install clean

all: $(EXE)

$(EXE): chckn.scm
	chicken-install -n

install: $(EXE)
	chicken-install

clean:
	rm $(EXE) $(EXE).build.sh $(EXE).install.sh

