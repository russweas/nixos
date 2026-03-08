# Omarchy Features Missing from Your NixOS Config

Based on research of Omarchy OS (DHH's opinionated Arch Linux + Hyprland setup)

---

## Core Desktop Experience

| Feature | Description | Status |
|---------|-------------|--------|
| **14+ Dynamic Themes** | Tokyo Night, Catppuccin, Nord, Ethereal, etc. with unified theming across terminal, neovim, waybar, notifications, lock screen | Missing |
| **Omarchy Menu** | Comprehensive control center (`Super + Alt + Space`) for system config, installations, themes | Missing |
| **Walker App Launcher** | More feature-rich than rofi - includes clipboard history, fuzzy search | Missing |
| **Unified Clipboard** | `Super+C/V/X` works everywhere (terminal + GUI unified) | Partial - using cliphist via rofi |
| **System Snapshots** | Automatic snapshots on updates via `omarchy-snapshot` with boot-time restoration | Missing |

---

## AI & Modern Tools

| Feature | Description | Status |
|---------|-------------|--------|
| **Voxtype (AI Dictation)** | Local AI dictation - hold `Super+Ctrl+X` to dictate | Missing |
| **OpenCode AI Agent** | AI coding assistant invoked via `c` alias | Missing |
| **Omarchy Skill** | Agent skills for specialized AI tool usage | Missing |

---

## Security

| Feature | Description | Status |
|---------|-------------|--------|
| **Fingerprint Authentication** | Support for fingerprint sensors (Framework laptop, etc.) | Missing |
| **FIDO2 Authentication** | Security key support for sudo/auth | Missing |
| **Firewall (ufw)** | Enabled by default with Docker hardening | Missing |
| **Default Full-Disk Encryption** | LUKS mandatory on install | ✅ Present |

---

## Shell & Productivity

| Feature | Description | Status |
|---------|-------------|--------|
| **Starship Prompt** | Minimal, fast prompt (vs oh-my-zsh/p10k) | Missing |
| **Shell Functions** | `compress`, `decompress`, `iso2sd`, `format-drive`, `img2jpg` utilities | Missing |
| **LazyDocker** | TUI for Docker management | Missing |
| **Zoxide** | Smart `cd` replacement | ✅ Present |

---

## Applications

| Feature | Description | Status |
|---------|-------------|--------|
| **1Password** | CLI + GUI integration | Missing |
| **Typora** | Minimal Markdown editor | Missing |
| **Pinta** | Basic image editor | Missing |
| **LocalSend** | AirDrop alternative | Missing |
| **Windows VM** | Docker-based Windows VM with file sharing | Missing |
| **Xournal++** | PDF annotation/signing | Missing |

---

## System Features

| Feature | Description | Status |
|---------|-------------|--------|
| **Hibernation Support** | Properly configured suspend-to-disk | Missing |
| **Suspend** | Enabled and working with proper configuration | Missing |
| **Monitor DPI Handling** | Assumes 2x retina displays by default | Missing |
| **Extra Fonts** | JetBrains Mono Nerd Font, easy installation | Partial |

---

## Keybinds - Missing from Your Config

| Keybind | Action |
|---------|--------|
| `Super + K` | Show all keybinds |
| `Super + Ctrl + L` | Lock computer |
| `Super + Ctrl + Space` | Cycle backgrounds |
| `Super + Escape` | System menu (lock/suspend/reboot/shutdown) |
| `Super + Shift + O` | Open Obsidian |
| `Super + Shift + /` | Open 1Password |

---

## Already Present in Your Config ✅

- Ghostty terminal
- Neovim
- Hyprland
- Waybar
- Zoxide
- fzf
- Lazygit
- Obsidian
- Steam/Gaming
- Retroarch
- Spicetify (Spotify)
- Swaylock/Hyprlock
- Rofi launcher
- Clipboard manager (cliphist)
- Fish shell
- Fastfetch

---

## Recommended Priority for Implementation

1. **High Priority**: Dynamic theming system, system snapshots, unified clipboard
2. **Medium Priority**: Starship prompt, shell functions, LazyDocker
3. **Lower Priority**: AI tools (Voxtype, OpenCode), fingerprint auth
