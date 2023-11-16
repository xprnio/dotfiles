HOME := $(shell echo $$HOME)
DOTFILES := $(HOME)/.dotfiles

SRC_DIR := $(DOTFILES)/src/polybar
OUT_DIR := $(DOTFILES)/config/polybar

CONFIG_DIR := $(HOME)/.config/polybar
SCRIPTS_DIR := $(DOTFILES)/scripts
SCRIPTS := launch_polybar.sh

GO_TPL := $(DOTFILES)/utils/bin/go-tpl

clean:
	rm -rf $(OUT_DIR)
	rm -rf $(CONFIG_DIR)

build: $(GO_TPL) $(SRC_DIR)/config.template
	mkdir -p "$(OUT_DIR)"
	$(GO_TPL) "$(SRC_DIR)/config.template" > "$(OUT_DIR)/config.ini"

link:
	mkdir -p "$(CONFIG_DIR)"
	if [ -e "$(CONFIG_DIR)/config.ini" ]; then \
		mv "$(CONFIG_DIR)/config.ini" "$(CONFIG_DIR)/config.ini.backup"; \
	fi
	if [ -e "$(CONFIG_DIR)/launch.sh" ]; then \
		mv "$(CONFIG_DIR)/launch.sh" "$(CONFIG_DIR)/launch.sh.backup"; \
	fi

	mkdir -p "$(CONFIG_DIR)/scripts"
	for script in $(SCRIPTS); do \
		ln -fs "$(SCRIPTS_DIR)/$$script" "$(CONFIG_DIR)/scripts/$$script"; \
		chmod +x "$(CONFIG_DIR)/scripts/$$script"; \
	done

	ln -fs "$(OUT_DIR)/config.ini" "$(CONFIG_DIR)/config.ini"
	ln -fs "$(SCRIPTS_DIR)/launch_polybar.sh" "$(CONFIG_DIR)/launch.sh"
	chmod +x "$(CONFIG_DIR)/launch.sh"

$(GO_TPL):
	$(MAKE) --directory $(DOTFILES)/utils build
