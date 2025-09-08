GIT_ROOT := $(shell git rev-parse --show-toplevel 2>/dev/null)
DOTFILES_DIR := $(GIT_ROOT)/dotfiles	
STOW_TARGET := $(HOME)
PACMAN_PKGS := $(GIT_ROOT)/pkglist_repo.txt
AUR_PKGS    := $(GIT_ROOT)/pkglist_aur.txt

.PHONY: help pkg_save stow unstow

pkg_save:
	@echo "Saving Pacman packages..."
	@pacman -Qqen > $(PACMAN_PKGS)
	@echo "Saving AUR packages..."
	@pacman -Qqem > $(AUR_PKGS)

help:
	@echo "Usage: make <target>"
	@echo ""
	@echo "Available targets:"
	@echo "  pkg_save Save pacman and AUR packages to dotfiles dir"
	@echo "  stow     Stow all directories from the root of the repo"
	@echo "  unstow   Unstow all directories from the root of the repo"

stow:
	@if [ -z "$(DOTFILES_DIR)" ]; then \
		echo "Error: Could not determine dotfiles root!"; \
		exit 1; \
	fi
	@echo "Stowing all dotfiles from $(DOTFILES_DIR)..."
	@cd $(DOTFILES_DIR); \
	for d in */ ; do \
		if [ -d "$$d" ]; then \
			pkg=$$(basename "$$d"); \
			echo "Stowing $$pkg..."; \
			stow -v -R -t $(STOW_TARGET) "$$pkg"; \
		fi; \
	done

unstow:
	@if [ -z "$(DOTFILES_DIR)" ]; then \
		echo "Error: Could not determine dotfiles root!"; \
		exit 1; \
	fi
	@echo "Unstowing all dotfiles from $(DOTFILES_DIR)..."
	@cd $(DOTFILES_DIR); \
	for d in */ ; do \
		if [ -d "$$d" ]; then \
			pkg=$$(basename "$$d"); \
			echo "Unstowing $$pkg..."; \
			stow -v -D -t $(STOW_TARGET) "$$pkg"; \
		fi; \
	done

