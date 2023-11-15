HOME := $(shell echo $$HOME)
DOTFILES := $(HOME)/.dotfiles

SRC_DIR := $(DOTFILES)/src/i3
OUT_DIR := $(DOTFILES)/config/i3

SCRIPTS_DIR := $(DOTFILES)/scripts
CONFIG_DIR := $(HOME)/.config/i3

GO_TPL := $(DOTFILES)/utils/bin/go-tpl

clean:
	rm -f $(OUT_DIR)/*

build: $(GO_TPL) $(SOURCE)
	mkdir -p "$(OUT_DIR)"
	$(GO_TPL) "$(SRC_DIR)/config.template" > "$(OUT_DIR)/config"

link:
	if [ -e "$(CONFIG_DIR)/config" ]; then \
		mv "$(CONFIG_DIR)/config" "$(CONFIG_DIR)/config.backup"; \
	fi

	ln -fs "$(OUT_DIR)/config" "$(CONFIG_DIR)/config"

$(GO_TPL):
	$(MAKE) --directory $(DOTFILES)/utils build
