# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a comprehensive Neovim configuration repository featuring a modern setup with LSP support, intelligent autocompletion, Git integration, and a rich plugin ecosystem. The configuration is designed for Neovim 0.10+ with optimization for 0.12+.

## Common Development Commands

### Installation and Setup
- `./install.sh` - Automated installation script for the entire Neovim configuration
- `./scripts/install-python-dev.sh` - Professional Python development environment setup
- `./uninstall.sh` - Complete removal of the configuration

### Backup and Maintenance  
- `./scripts/backup.sh` - Create timestamped backup of current configuration
- `./scripts/restore.sh <backup_name>` - Restore from a specific backup
- `./scripts/update.sh` - Update Neovim, plugins, LSP servers, and Treesitter parsers

### Neovim Management
- `nvim --headless -c "Lazy! sync" -c "qall"` - Sync all plugins
- `nvim --headless -c "MasonUpdate" -c "qall"` - Update LSP servers
- `nvim --headless -c "TSUpdate" -c "qall"` - Update Treesitter parsers
- `nvim --headless -c "checkhealth" -c "qall"` - System health check

## Configuration Architecture

### Core Structure
- `config/nvim/init.lua` - Main entry point that loads all configuration modules
- `config/nvim/lua/config/` - Core configuration modules
  - `options.lua` - Neovim options and settings
  - `keymaps.lua` - Custom key mappings  
  - `autocmds.lua` - Autocommands
  - `lazy.lua` - Plugin management and configuration with lazy.nvim

### Plugin Management
The configuration uses lazy.nvim for plugin management with lazy loading and modern plugin configurations. All plugins are configured within `lua/config/lazy.lua` using a single-file approach.

### Key Plugin Categories
- **LSP & Completion**: Mason, nvim-lspconfig, nvim-cmp with LuaSnip
- **UI & Themes**: Catppuccin theme, Lualine statusline, Dashboard, nvim-tree
- **Search & Navigation**: Telescope with FZF, Leap.nvim, Which-key
- **Editing**: Treesitter, Comment.nvim, nvim-autopairs, indent-blankline
- **Git Integration**: Gitsigns with full hunk management
- **Terminal**: ToggleTerm with floating terminal

### LSP Configuration
Pre-configured LSP servers include:
- lua_ls (Lua)
- pyright (Python - type checking and intellisense)
- pylsp (Python Language Server - additional features)
- ruff_lsp (Python - ultra-fast linting and formatting)
- ts_ls (TypeScript/JavaScript)
- html, cssls, jsonls

LSP servers are auto-installed via Mason and configured with consistent keybindings across all languages.

### Python Development Features
Professional Python development setup includes:
- **Multiple LSP servers**: Pyright for type checking, Pylsp for additional features, Ruff for linting
- **Advanced debugging**: DAP integration with breakpoints, step debugging, and variable inspection
- **Testing framework**: Neotest integration with pytest support and test discovery
- **REPL integration**: Iron.nvim for interactive Python development
- **Virtual environment**: Automatic detection and switching with venv-selector
- **Code formatting**: Ruff and Black integration with format-on-save
- **Documentation**: Automatic docstring generation with Google-style format
- **Import management**: Automatic import sorting with isort
- **Code coverage**: Visual coverage indicators with nvim-coverage

## Development Workflow

### Working with Configuration Files
1. Main configuration is in `config/nvim/` directory
2. Test changes by copying to `~/.config/nvim/` or using symlinks
3. Use `nvim --headless -c "checkhealth" -c "qall"` to verify configuration health
4. Plugin changes require `Lazy! sync` command

### Python Development Workflow
1. **Project Setup**: Use `./scripts/install-python-dev.sh` for complete Python environment
2. **Virtual Environment**: Select with `<leader>vs` before starting development
3. **Testing**: Run tests with `<leader>tt` (current) or `<leader>tf` (file)
4. **Debugging**: Set breakpoints with `<leader>db`, start debugging with `<leader>dc`
5. **REPL**: Start interactive Python with `<leader>rs`
6. **Formatting**: Auto-format with `<leader>mp` or format-on-save
7. **Documentation**: Generate docstrings with `<leader>nf` (function) or `<leader>nc` (class)

### Python-Specific Keymaps
- `<leader>vs` - Select virtual environment
- `<leader>vc` - Select cached virtual environment
- `<leader>tt` - Run current test
- `<leader>tf` - Run test file
- `<leader>td` - Debug current test
- `<leader>ts` - Toggle test summary
- `<leader>to` - Toggle test output
- `<leader>db` - Toggle breakpoint
- `<leader>dc` - Continue debugging
- `<leader>do` - Step over
- `<leader>di` - Step into
- `<leader>dr` - Open debug REPL
- `<leader>du` - Toggle debug UI
- `<leader>rs` - Start REPL
- `<leader>rr` - Restart REPL
- `<leader>rf` - Focus REPL
- `<leader>rh` - Hide REPL
- `<leader>mp` - Format code
- `<leader>nf` - Generate function docstring
- `<leader>nc` - Generate class docstring
- `<leader>is` - Sort imports
- `<leader>cc` - Load coverage
- `<leader>cs` - Coverage summary
- `<leader>ct` - Toggle coverage

### Adding New Language Support
1. Add LSP server to `ensure_installed` table in lazy.lua
2. Add language to Treesitter `ensure_installed` list
3. Run update script to install new components

### Customization Patterns
- Keymaps follow `<leader>` prefix convention (Space key)
- UI components use Catppuccin theme integration
- All plugins configured for dark theme compatibility

## Key Architecture Decisions

### Single-File Plugin Configuration
All plugins are configured in one file (`lazy.lua`) rather than separate plugin files. This design choice:
- Simplifies navigation and maintenance
- Reduces complexity for users
- Keeps related configurations together
- Makes it easier to understand plugin relationships

### Modular Core Configuration
Core Neovim settings are split into logical modules:
- options.lua: Neovim behavior and UI settings
- keymaps.lua: Key bindings (though many are defined alongside plugins)
- autocmds.lua: Autocommands for automation

### LSP Integration Philosophy
- Mason handles LSP server installation automatically
- Consistent keybindings across all language servers
- Format-on-save and real-time diagnostics enabled by default
- Hover documentation and code actions easily accessible

## Installation Dependencies

### System Requirements
- Ubuntu 20.04+ / Debian 11+
- Neovim 0.10+ (optimized for 0.12+)
- Node.js 18+ (for LSP servers)
- Python 3.8+ (for tools)
- Git 2.0+

### Required System Packages
- build-essential, cmake, unzip, curl
- ripgrep (for Telescope live grep)
- fd-find (for Telescope file finding)
- npm (for Node.js based LSP servers)

## Troubleshooting Common Issues

### Plugin Installation Issues
Run `nvim --headless -c "Lazy! sync" -c "qall"` to force plugin reinstallation

### LSP Not Working
Check Mason installation: `nvim -c "Mason"` to verify LSP servers are installed

### Telescope File Search Issues
Ensure ripgrep and fd-find are installed: `sudo apt install ripgrep fd-find`

### Performance Issues
Clear Neovim cache: `rm -rf ~/.cache/nvim/*` and restart

## File Locations

### Configuration Files
- Main config: `~/.config/nvim/` (copied from `config/nvim/`)
- Undo history: `~/.vim/undodir/`
- Plugin data: `~/.local/share/nvim/`
- Cache: `~/.cache/nvim/`

### Backup System
- Backups stored in: `~/.config/nvim-backups/`
- Format: `nvim_backup_YYYYMMDD_HHMMSS.tar.gz`
- Automatic backup creation before installation

## Important Notes

- The configuration expects Spanish language prompts in some documentation but all code and commands are in English
- Terminal integration uses Ctrl+\ as the toggle key
- Leader key is set to Space for all custom keybindings
- Git integration shows real-time change indicators in the sign column
- Dashboard appears on startup with quick navigation options