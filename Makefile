LN           = ln -srFnb -S .bak
RM           = rm -f
TMUX_VERSION = $(shell tmux -V | cut -d ' ' -f2)
OS_NAME      = $(shell uname -s | tr '[:upper:]' '[:lower:]')
FILES        = .tmux.conf
CONF_SOURCES = $(wildcard .tmux.base.conf .tmux.$(TMUX_VERSION).conf .tmux.$(OS_NAME).conf)
DEST         = $(HOME)

.PHONY: all
all: $(FILES)

.PHONY: install
install: $(FILES)
	$(LN) $^ $(DEST)

.tmux.conf: $(CONF_SOURCES)
	cat $^ > $@

.PHONY: clean
clean:
	$(RM) .tmux.conf

