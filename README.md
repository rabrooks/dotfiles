# dotfiles

Personal dotfiles for macOS, managed with symlinks.

## What's Included

- **Ghostty** - Terminal configuration
- **Neovim** - Editor with lazy.nvim, LSP (Pyright + Ruff), Telescope, Treesitter
- **Tmux** - Multiplexer with vim-tmux navigation (prefix: Ctrl+Space)
- **Zsh** - Shell with starship prompt, fzf, aliases
- **Git** - Shared gitconfig via include
- **Lazygit** - Git TUI configuration
- **Starship** - Cross-shell prompt

## Setup

```bash
# 1. Clone
git clone https://github.com/<user>/dotfiles.git ~/dotfiles

# 2. Install Homebrew packages
./brew-install.sh

# 3. Create symlinks and bootstrap files
./setup.sh

# 4. Create config symlinks
ln -sf ~/dotfiles/nvim ~/.config/nvim
ln -sf ~/dotfiles/zsh ~/.config/zsh
ln -sf ~/dotfiles/starship.toml ~/.config/starship.toml
ln -sf ~/dotfiles/tmux/.tmux.conf ~/.tmux.conf

# 5. Install tmux plugins (inside tmux)
# Press Ctrl+Space then I
```

## Zsh Loading

A minimal `~/.zshenv` bootstraps everything by setting `ZDOTDIR=~/.config/zsh`. Zsh then natively loads `.zshenv` and `.zshrc` from the dotfiles directory. Machine-specific config goes in `~/.config/.zsh_local` (not tracked).

## Theme

Catppuccin Macchiato across tmux, starship, and neovim. Ghostty uses Catppuccin Mocha.
