# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Build Commands

```bash
# Build and switch (primary workflow)
sudo nixos-rebuild switch --flake .#desktop   # or laptop, vm, iso

# Dry-build to check for errors without applying
nixos-rebuild dry-build --flake .#desktop

# Evaluate a specific option
nix eval .#nixosConfigurations.desktop.config.system.build.toplevel.drvPath

# Format all code (Nix + Shell via treefmt)
nix fmt

# Update flake inputs
nix flake update
```

There are no formal tests. Verify changes with dry-build or `nix flake show`.

## Architecture

NixOS flake configuration with home-manager. Four hosts: **desktop**, **laptop**, **vm**, **iso**.

### How it fits together

`flake.nix` defines four `nixosConfigurations`. Each host gets `specialArgs = { host, self, inputs, username }` where `username = "rweas"`. Each host imports `modules/core/` for system config, then `modules/core/user.nix` pulls in home-manager and imports either `modules/home/default.desktop.nix` (for desktop) or `modules/home/default.nix` (for all other hosts).

### Key module paths

- **System modules**: `modules/core/*.nix` — bootloader, networking, NVIDIA/hardware, pipewire, security, wayland/Hyprland, user management
- **Home-manager modules**: `modules/home/*.nix` and `modules/home/*/` — per-app configs (ghostty, hyprland/, fish/, waybar/, etc.)
- **Packages**: `modules/home/packages/{cli,dev,gui,nix}.nix` — user packages split by category
- **Custom packages**: `pkgs/` — built from source, exposed via overlay in `modules/core/nixpkgs.nix`
- **Custom scripts**: `scripts/scripts/*.sh` — auto-discovered and packaged (name becomes command, e.g. `ascii.sh` → `ascii`)
- **Host configs**: `hosts/{desktop,laptop,vm,iso}/default.nix` — machine-specific hardware and settings

### Adding things

- **New module**: Create `modules/home/<name>.nix`, import it in `modules/home/default.nix`
- **New host**: Create `hosts/<name>/default.nix`, add nixosConfiguration in `flake.nix`
- **New package**: Add to appropriate file in `modules/home/packages/` or create custom package in `pkgs/`
- **New script**: Add `scripts/scripts/<name>.sh`, `git add` it, rebuild — it becomes a command automatically

## Code Style

- **Line length**: 80 columns max (enforced by nixfmt via `nix fmt`)
- **Indentation**: 2 spaces for Nix, 4 spaces for shell scripts
- **Naming**: `snake_case` for variables/functions
- **Trailing commas**: Always include in lists and attrsets
- **Module pattern**: `{ pkgs, inputs, username, host, ... }: { ... }`
- **Shell scripts**: `#!/usr/bin/env bash`, `set -e`, quote all variables

## Notable Patterns

- Desktop host gets a separate home config (`default.desktop.nix`) that imports extra modules not needed on other hosts
- NVIDIA + Wayland environment variables are set in `modules/core/wayland.nix`
- Nix binary caches configured in `modules/core/system.nix` (nix-community, nix-gaming, hyprland, ghostty)
- The `nh` tool is configured in `modules/core/nh.nix` with flake path `~/nixos-config`
- Flake inputs include: nixpkgs (unstable), home-manager, NUR, nix-gaming, nix-flatpak, spicetify-nix, zen-browser, catppuccin, maple-mono, superfile
