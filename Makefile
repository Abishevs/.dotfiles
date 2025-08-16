DOTFILES_DIR := $(HOME)/dev/dotfiles
PACMAN_PKGS := $(DOTFILES_DIR)/pkglist_repo1.txt
AUR_PKGS    := $(DOTFILES_DIR)/pkglist_aur1.txt

.PHONY: help pkg_save

help:
	@echo "Usage: make <target>"
	@echo ""
	@echo "Available targets:"
	@echo "  pkg_save   Save pacman and AUR packages to dotfiles dir"

pkg_save:
	@echo "Saving Pacman packages..."
	@pacman -Qqen > $(PACMAN_PKGS)
	@echo "Saving AUR packages..."
	@pacman -Qqem > $(AUR_PKGS)
