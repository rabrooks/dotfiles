# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a modular Neovim configuration using Lua, organized with a clear separation between core settings and plugin configurations. The setup follows modern Neovim best practices with Lazy.nvim for plugin management.

## Project Structure

```
nvim/
├── init.lua                 # Entry point - loads core modules
├── lua/abrooks/
│   ├── core/
│   │   ├── options.lua     # Neovim settings (UI, editing, performance)
│   │   ├── keymaps.lua     # Global keybindings
│   │   └── functions.lua   # Utility functions (P, RELOAD, R)
│   └── plugins/            # Individual plugin configurations (~22 files)
│       ├── lspconfig.lua   # LSP setup with Mason
│       ├── telescope.lua   # Fuzzy finder configuration
│       ├── treesitter.lua  # Syntax highlighting
│       └── nvim-cmp.lua    # Autocompletion
└── .stylua.toml            # Lua formatter configuration
```

## Key Architecture Patterns

1. **Modular Plugin Management**: Each plugin has its own configuration file under `lua/abrooks/plugins/`
2. **Namespace Organization**: All configuration modules are under the `abrooks` namespace
3. **Lazy Loading**: Uses Lazy.nvim with deferred setup for optimal startup performance
4. **LSP Integration**: Comprehensive language server setup with automatic installation via Mason

## Development Commands

### Lua Development
```bash
# Format Lua files (uses .stylua.toml configuration)
stylua lua/
```

### Plugin Management
- `:Lazy` - Open Lazy.nvim dashboard
- `:Mason` - Manage LSP servers and tools
- `:LspInfo` - Check LSP server status

## Important Configuration Details

### Custom Functions (lua/abrooks/core/functions.lua)
- `P(v)` - Pretty-print for debugging
- `RELOAD(...)` - Hot reload Lua modules
- `R(name)` - Reload and return a module

### Key Bindings Pattern
- Leader key is set to space
- Plugin keybindings are defined within each plugin's configuration file
- Global keybindings are in `lua/abrooks/core/keymaps.lua`

### Supported Languages
The configuration includes LSP support for: Go, Python, JavaScript/TypeScript, Rust, Java, Lua, with formatters and linters configured for each.

## Working with This Configuration

When modifying plugins:
1. Create or edit files in `lua/abrooks/plugins/`
2. Follow the existing pattern of returning a table with plugin spec
3. Use the existing helper functions and patterns for consistency

When adding new LSP servers:
1. Update the `servers` table in `lua/abrooks/plugins/lspconfig.lua`
2. Add any server-specific settings in the same file
3. Mason will automatically install the server on next startup