# zzuse's Neovim Configuration

A modern, fast, and minimalist Neovim configuration tailored for **Neovim 0.11+** and **Go/Python/C++** development.

## 🚀 Features

- **Modern Plugin Manager**: Powered by [lazy.nvim](https://github.com/folke/lazy.nvim).
- **LSP Support**: Pre-configured for Go (`gopls`), Python (`pyright`), C/C++ (`clangd`), and Lua.
- **Auto-Completion**: Uses `blink.cmp` for high-performance, asynchronous completion.
- **Tree-sitter**: Advanced syntax highlighting and code intelligence.
- **Minimalist UI**: 
  - Optimized for standard terminal fonts (no Nerd Fonts required).
  - Uses `lualine.nvim` with ASCII separators.
  - High-visibility `indent-blankline.nvim` indicators.
- **Color Scheme**: Classic `molokai` for a high-contrast, focused environment.

## 🛠️ Requirements

- **Neovim 0.11.0+** (Nightly/Pre-release)
- **Go**: Installed via Homebrew (configured to find `GOROOT` automatically).
- **C Compiler**: `gcc` or `clang` for Tree-sitter parser compilation.

## 📦 Installation

1. Backup your existing config:
   ```bash
   mv ~/.config/nvim ~/.config/nvim.bak
   ```

2. Clone this repository:
   ```bash
   git clone https://github.com/zzuse/nvim_config.git ~/.config/nvim
   ```

3. Launch Neovim:
   ```bash
   nvim
   ```
   *Plugins will install automatically on first launch.*

## 🔧 Maintenance

- **Update Plugins**: Run `:Lazy sync` inside Neovim.
- **LSP/Tool Management**: Use `:Mason` to manage language servers and formatters.
- **Tree-sitter Parsers**: Run `:TSUpdate` to update syntax parsers.

## 📝 Recent Fixes (v1.1)
- Fixed `nvim-treesitter` breaking changes by pinning to the `master` branch.
- Resolved `mason-lspconfig` compatibility issues for Neovim 0.11+.
- Hardcoded `GOROOT` detection for Homebrew-based Go installations.
- Replaced non-standard Unicode symbols with ASCII alternatives for universal terminal support.