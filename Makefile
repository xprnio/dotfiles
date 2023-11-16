HOME := $(shell echo $$HOME)
DEPENDENCIES := make i3-wm i3lock polybar go scrot imagemagick

DOTFILES := $(HOME)/.dotfiles
SOURCES = i3 polybar

clean:
	$(MAKE) --directory $(DOTFILES)/utils clean
	for source in $(SOURCES); do \
		$(MAKE) --directory $(DOTFILES)/src/$$source clean; \
	done

build: clean
	$(MAKE) --directory $(DOTFILES)/utils build
	for source in $(SOURCES); do \
		$(MAKE) --directory $(DOTFILES)/src/$$source build; \
	done

install: build
	for source in $(SOURCES); do \
		$(MAKE) --directory $(DOTFILES)/src/$$source link; \
	done

install-dependencies:
	sudo pacman -S --needed $(DEPENDENCIES)
