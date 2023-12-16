HOME := $(shell echo $$HOME)
DOTFILES := $(HOME)/.dotfiles

SRC_DIR := $(DOTFILES)/src/i3
OUT_DIR := $(DOTFILES)/config/i3

CONFIG_DIR := $(HOME)/.config/i3
SCRIPTS_DIR := $(DOTFILES)/scripts
SCRIPTS := i3-exit.sh i3-volume.sh i3-workspace-layouts.pl

GO_TPL := $(DOTFILES)/utils/bin/go-tpl

clean:
	rm -rf $(OUT_DIR)
	rm -rf $(CONFIG_DIR)

build: $(GO_TPL) $(SOURCE)
	mkdir -p "$(OUT_DIR)"
	$(GO_TPL) "$(SRC_DIR)/config.template" > "$(OUT_DIR)/config"

link:
	mkdir -p "$(CONFIG_DIR)"
	if [ -e "$(CONFIG_DIR)/config" ]; then \
		mv "$(CONFIG_DIR)/config" "$(CONFIG_DIR)/config.backup"; \
	fi
	ln -fs "$(OUT_DIR)/config" "$(CONFIG_DIR)/config"

	mkdir -p "$(CONFIG_DIR)/scripts"
	for script in $(SCRIPTS); do \
		ln -fs "$(SCRIPTS_DIR)/$$script" "$(CONFIG_DIR)/scripts/$$script"; \
		chmod +x "$(CONFIG_DIR)/scripts/$$script"; \
	done

$(GO_TPL):
	$(MAKE) --directory $(DOTFILES)/utils build
