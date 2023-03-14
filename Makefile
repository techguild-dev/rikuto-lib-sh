SHELL := /bin/bash
SH_FILES := $(wildcard *.sh)
EXECUTABLES := $(patsubst %.sh,%,$(SH_FILES))
BINDIR := bin

.PHONY: all clean

all: $(addprefix $(BINDIR)/, $(EXECUTABLES))

$(BINDIR)/%: %.sh | $(BINDIR)
	cp $< $@
	chmod +x $@

$(BINDIR):
	mkdir -p $(BINDIR)

clean:
	rm -rf $(BINDIR) $(EXECUTABLES)
