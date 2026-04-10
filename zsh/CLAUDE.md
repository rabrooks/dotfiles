# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a comprehensive zsh configuration setup using a modular approach with manual plugin management. The configuration includes custom themes, plugins, aliases, functions, and environment variables optimized for development workflows on macOS. The setup emphasizes productivity with tools like fzf, powerlevel10k, and extensive aliases for common development tasks.

## Project Structure

```
zsh/
├── .zshenv                  # Environment variables, PATH setup (loaded first)
├── .zshrc                   # Main interactive shell configuration
├── .zsh_aliases            # Command aliases (sourced by .zshrc)
├── .zsh_local              # Machine-specific settings (sourced by .zshrc)
├── .zprofile               # Login shell configuration (minimal)
├── .p10k.zsh               # Powerlevel10k theme configuration (generated)
├── .zhistory/.zsh_history  # Command history files
├── .zcompdump              # Zsh completion cache
├── .claude/
│   └── settings.local.json # Claude Code permissions configuration
├── plugins/
│   ├── zsh-autosuggestions/ # Command autosuggestions plugin
│   └── fzf-zsh-plugin/     # Fuzzy finder integration plugin
└── themes/
    └── powerlevel10k/      # Modern, fast zsh theme with git integration
```

## Load Order

1. `.zshenv` - Always loaded first (environment variables, PATH)
2. `.zprofile` - Login shells only (minimal/empty)
3. `.zshrc` - Interactive shells (main configuration)
   - Sources `.zsh_aliases`
   - Sources `.zsh_local`
   - Loads plugins and theme

## Commands for Development

### Common Commands
```bash
# Reload zsh configuration
reload  # or source ~/.config/zsh/.zshrc

# Kill process by port
killport <port_number>

# Search for word recursively with color highlighting
findWord <search_term>

# Git log with pretty format
gitl

# Clean up merged git branches
git_branch_clean
```

## Key Architecture Patterns

1. **Modular Configuration**: Configuration is split across multiple files by purpose (.zshrc, .zshenv, .zsh_aliases, .zsh_local)
2. **Manual Plugin Management**: Plugins are git cloned into the plugins/ directory and sourced manually
3. **Environment Separation**: Machine-specific settings are isolated in .zsh_local
4. **Productivity Focus**: Extensive aliases and functions for development workflows
5. **Tool Integration**: Deep integration with development tools (git, docker, kubectl, nvim)

## Configuration Files Breakdown

### .zshrc (Main Configuration)
- Enables Powerlevel10k instant prompt (must be at top)
- Sources configuration files in order:
  1. .zsh_aliases (command aliases)
  2. .zsh_local (machine-specific settings)
  Note: .zshenv is loaded automatically by zsh before .zshrc
- Loads plugins (zsh-autosuggestions, fzf-zsh-plugin)
- Loads powerlevel10k theme
- Sets up vi key bindings for command line editing
- Configures history search bindings (^R for backward, ^S for forward)
- Defines utility functions (killport, findWord)
- Sets up Claude CLI alias at /Users/abrooks/.claude/local/claude
- Sources fzf configuration from ~/.fzf.zsh if available

### .zshenv (Environment Setup - Loaded First)
- Sets ZDOTDIR to ~/.config/zsh
- Configures history settings (HISTFILE, HISTSIZE=10000, SAVEHIST=10000)
- Homebrew setup (eval brew shellenv for Apple Silicon)
- Sets up PATH in specific order:
  - /opt/homebrew/bin (Homebrew on Apple Silicon)
  - ~/bin (user binaries)
  - ~/.config/zsh/plugins/fzf-zsh-plugin/bin (fzf plugin binaries)
  - ~/.pyenv/shims (Python version management)
  - ~/go/bin (Go binaries)
  - $NPM_BIN (npm global binaries)
- Docker platform configuration (linux/amd64 for M1 compatibility)
- DYLD_LIBRARY_PATH setup for homebrew libraries
- GOPATH configuration for Go development
- LS_COLORS configuration for colorized output

### .zsh_aliases (Command Aliases)
- Navigation shortcuts (cd.., .., ...)
- Reload configuration shortcut (reload)
- Colorized grep variants (grep, egrep, fgrep with --color=auto)
- kubectl shorthand (k)
- Enhanced ls commands with OS-specific color detection (GNU vs macOS)
  - l: Long format with file types
  - la/ll: Long format including hidden files
  - lsd: List only directories
- mkdir with verbose parents (-pv flags)
- Date/time utilities (now/nowtime for current time, nowdate for current date)
- Editor aliases (vi/vim -> nvim)
- Git shortcuts:
  - gitl: Pretty formatted log with graph
  - git_branch_clean: Delete merged branches
  - git_fetch_clean: Prune remote tracking branches

### .zsh_local (Machine-Specific Configuration)
- Java version switching (j8, j11, j17, j19) with verification
- Machine-specific PATH additions:
  - ~/.masdb (custom tools)
  - /Applications/Docker.app/Contents/Resources/bin (Docker Desktop)
- Android SDK configuration (ANDROID_HOME and PATH additions)
- API keys loaded from secure files (OpenAI)
- Development utilities (mgrep excluding node_modules/build)
- Project navigation shortcuts (mas, personal, codeall)
- SSH tunnels and connections (MongoDB, Redis, RDS)
- NVM (Node Version Manager) setup
- SDKMAN setup for Java/Gradle management (must be at end of file)
- Ruby (rbenv) initialization
- External drive management (Samsung T7 mount/unmount/code functions)

## Plugin Management

The configuration uses manual plugin management:

1. **zsh-autosuggestions**: Provides command suggestions based on history
   - Located: `plugins/zsh-autosuggestions/`
   - Sourced in .zshrc

2. **fzf-zsh-plugin**: Fuzzy finder integration for command history and file search
   - Located: `plugins/fzf-zsh-plugin/`
   - Adds binary to PATH in .zshenv
   - Sourced in .zshrc

3. **powerlevel10k**: Modern zsh theme with git integration
   - Located: `themes/powerlevel10k/`
   - Configuration in .p10k.zsh (2-line prompt, git status, execution time)

## Custom Functions

### Utility Functions (in .zshrc)
- `killport()`: Kill process by port number using lsof
- `findWord()`: Recursive grep search with color highlighting

### Samsung Drive Functions (in .zsh_local)
- `samsungMount`: Mount Samsung T7 external drive
- `samsungUnMount`: Unmount Samsung T7 external drive
- `samsungCode()`: Open Neovim in external drive projects (with mount check)

## Development Workflow Integration

### Git Integration
- Enhanced git log with graph and colors (`gitl` alias)
- Branch cleanup utilities
- Powerlevel10k shows git status in prompt

### Docker & Kubernetes
- Docker platform set to linux/amd64 for M1 compatibility
- kubectl shorthand (`k` alias)
- Docker path in PATH

### Language/Runtime Management
- Java version switching with verification
- Node.js via NVM
- Python via pyenv
- Ruby via rbenv
- Go with GOPATH configuration
- SDK management via SDKMAN

### SSH & Database Tunnels
- Production and staging database tunnels
- RDS tunnel shortcuts
- Bastion host connections

## Dependencies and Requirements

### Required Tools
- **zsh**: Shell (macOS default since Catalina)
- **git**: For plugin management and version control
- **fzf**: Fuzzy finder (required by fzf-zsh-plugin, checked in .zshrc)
- **nvim**: Neovim text editor (aliased from vi/vim)
- **lsof**: For killport function (usually pre-installed on macOS)

### Optional Development Tools
- **homebrew**: Package manager (/opt/homebrew/bin in PATH)
- **pyenv**: Python version management
- **nvm**: Node.js version management
- **rbenv**: Ruby version management
- **sdkman**: Java/Gradle version management
- **kubectl**: Kubernetes CLI
- **docker**: Container management

## Setup Instructions

1. **Clone the dotfiles repository**
2. **Install plugins manually** (they're gitignored):
   ```bash
   # From the zsh directory
   git clone https://github.com/zsh-users/zsh-autosuggestions plugins/zsh-autosuggestions
   git clone https://github.com/unixorn/fzf-zsh-plugin plugins/fzf-zsh-plugin
   git clone https://github.com/romkatv/powerlevel10k themes/powerlevel10k
   ```
3. **Create symlinks** to the configuration files in ~/.config/zsh/
4. **Install dependencies**:
   - Homebrew (for macOS): `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
   - fzf: `brew install fzf`
   - Neovim: `brew install neovim`
5. **Run p10k configure** to set up the theme
6. **Customize .zsh_local** for machine-specific settings (API keys, project paths, SSH tunnels)

## Working with This Configuration

### Adding New Aliases
- Add to `.zsh_aliases` for general aliases
- Add to `.zsh_local` for machine-specific aliases

### Adding New Plugins
1. Clone the plugin to the `plugins/` directory
2. Add the plugin to `.gitignore`
3. Source the plugin in `.zshrc`

### Environment Variables
- Add general environment variables to `.zshenv`
- Add machine-specific variables to `.zsh_local`

### PATH Management
- Global PATH additions go in `.zshenv`
- Machine-specific PATH additions go in `.zsh_local`

## Claude Code Integration

The `.claude/settings.local.json` file configures permissions for Claude Code to read the entire dotfiles directory structure, enabling comprehensive analysis and assistance with the configuration.

## Security Considerations

- API keys are stored in separate files (e.g., ~/.openai-key.txt)
- SSH keys and sensitive tunnels are referenced by path, not embedded
- Machine-specific credentials are in .zsh_local (should be customized per machine)
- History files are gitignored to prevent command history exposure