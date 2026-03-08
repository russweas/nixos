# AGENTS.md - NixOS Configuration Guide

This is a NixOS flake-based configuration using home-manager for user settings.

## Build/Lint/Test Commands

### Building the System

```bash
# Build and switch to a specific host configuration
sudo nixos-rebuild switch --flake .#desktop
sudo nixos-rebuild switch --flake .#laptop
sudo nixos-rebuild switch --flake .#vm
sudo nixos-rebuild switch --flake .#iso

# Using nh (if installed)
sudo nh switch --flake .#desktop
```

### Evaluating Configuration

```bash
# Dry-run to check for errors without applying
nix eval .#nixosConfigurations.desktop.config.system.build.toplevel.drvPath
nix flake show
```

### Code Formatting (Linting)

```bash
# Format all code (Nix, Shell) using treefmt
nix fmt

# Or run formatters directly
nixfmt -sv -w80 *.nix          # Format Nix files to 80 columns
shfmt -l -w -ci -sr -i4 *.sh  # Format shell scripts
```

### Running a Single Test

There are no formal tests in this configuration. To verify a module works:
1. Run a dry-build: `nixos-rebuild dry-build --flake .#desktop`
2. Or evaluate: `nix eval .#nixosConfigurations.desktop.config.<option>`

---

## Code Style Guidelines

### General Structure

- **Flake structure**: `flake.nix` defines inputs and outputs (nixosConfigurations)
- **Hosts**: Defined in `hosts/<name>/default.nix` (desktop, laptop, vm, iso)
- **Modules**:
  - System-level: `modules/core/*.nix`
  - Home-manager: `modules/home/**/*.nix`
- **Packages**: Custom packages in `pkgs/` directory

### Nix Code Conventions

1. **Line length**: 80 columns max (enforced by nixfmt)
2. **Indentation**: 2 spaces
3. **Format**: Use `{ ... }:` for attribute sets with imports
4. **Naming**: `snake_case` for variables and function names, `PascalCase` for types/paths
5. **Trailing commas**: Always include trailing commas in lists and attrsets
6. **Imports**: Group related imports, use `./relative/path` for local modules

### Example Module Structure

```nix
{ pkgs, inputs, username, host, ... }:
{
  imports = [
    ./submodule1.nix
    ./submodule2.nix
  ];

  # Option setting
  option.name = "value";

  # Conditional logic
  pkgs = if condition then pkgs.foo else pkgs.bar;

  # Functions
  myFunction = args: result;
}
```

### Shell Script Conventions

- Use `#!/usr/bin/env bash`
- 4-space indentation
- `set -e` for error handling
- Use `$(command)` for command substitution (not backticks)
- Quote variables: `"$var"` not `$var`

### Import Guidelines

```nix
# Local module
imports = [ ./relative/path.nix ];

# From flake inputs
imports = [ inputs.home-manager.nixosModules.home-manager ];

# Conditional import
imports = [ (if condition then ./path1.nix else ./path2.nix) ];
```

### Error Handling

- Nix: Let expressions for scoped error handling
- Shell: Use `set -e` and check exit codes explicitly
- Validate options with `lib.mkIf`, `lib.mkWhen` for conditionals

### Type Safety

- Use strict typing where possible
- Leverage NixOS option types: `types.str`, `types.bool`, `types.int`, etc.
- Use `lib.mkOption` with `type` specification for custom options

---

## File Organization

```
.nix/
├── flake.nix           # Main flake definition
├── treefmt.toml        # Formatting config
├── hosts/              # Machine-specific configs
│   ├── desktop/
│   ├── laptop/
│   ├── vm/
│   └── iso/
├── modules/
│   ├── core/           # NixOS system modules
│   └── home/           # Home-manager modules
│       ├── hyprland/   # WM config
│       ├── fish/       # Shell config
│       └── ...
├── pkgs/               # Custom packages
└── scripts/            # Shell scripts
```

---

## Common Tasks

### Adding a New Host

1. Create `hosts/<name>/default.nix`
2. Add to `flake.nix` outputs
3. Import `modules/core` and host-specific hardware config

### Adding a Home Module

1. Create `modules/home/<name>.nix` or `modules/home/<name>/default.nix`
2. Import it in `modules/home/default.nix`

### Adding a Package

1. Add to `pkgs/default.nix` using `pkgs.callPackage`
2. Or add to `modules/home/packages/*.nix` for user packages

### Modifying User Shell

- Fish: `modules/home/fish/default.nix`
- Zsh: `modules/home/zsh/default.nix`
- Both can coexist; set default in `modules/core/user.nix`

---

## Useful Commands

```bash
# Update flake inputs
nix flake update

# List available configurations
nix flake show

# Search for options
nix search nixpkgs <package>
nix repl> :f <nixpkgs/lib>

# Clean up old generations
sudo nix-collect-garbage -d
```
