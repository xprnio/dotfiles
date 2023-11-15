HOME := $(shell echo $$HOME)
DOTFILES := $(HOME)/.dotfiles

SRC_DIR := $(DOTFILES)/src/polybar
OUT_DIR := $(DOTFILES)/config/polybar

SCRIPTS_DIR := $(DOTFILES)/scripts
CONFIG_DIR := $(HOME)/.config/polybar

GO_TPL := $(DOTFILES)/utils/bin/go-tpl

clean:
	rm -f $(OUT_DIR)/*

build: $(GO_TPL) $(SRC_DIR)/config.template
	mkdir -p "$(OUT_DIR)"
	$(GO_TPL) "$(SRC_DIR)/config.template" > "$(OUT_DIR)/config.ini"

link:
	if [ -e "$(CONFIG_DIR)/config.ini" ]; then \
		mv "$(CONFIG_DIR)/config.ini" "$(CONFIG_DIR)/config.ini.backup"; \
	fi
	if [ -e "$(CONFIG_DIR)/launch.sh" ]; then \
		mv "$(CONFIG_DIR)/launch.sh" "$(CONFIG_DIR)/launch.sh.backup"; \
	fi

	ln -fs "$(OUT_DIR)/config.ini" "$(CONFIG_DIR)/config.ini"
	ln -fs "$(SCRIPTS_DIR)/launch_polybar.sh" "$(CONFIG_DIR)/launch.sh"
	chmod +x "$(CONFIG_DIR)/launch.sh"

$(GO_TPL):
	$(MAKE) --directory $(DOTFILES)/utils build
