#!/bin/zsh

# iTerm2 Color Scheme
# Import manually via iTerm2 → Preferences → Profiles → Colors → Color Presets → Import
# Color file: ~/dotfiles/iterm/colors/catppuccin-macchiato.itermcolors

# Bootstrap ~/.zshenv — sets ZDOTDIR so zsh finds configs in ~/.config/zsh/
cat > ~/.zshenv << 'EOF'
export ZDOTDIR="$HOME/.config/zsh"
source "$ZDOTDIR/.zshenv"
EOF

# Remove legacy ~/.zshrc symlink (zsh now finds .zshrc via ZDOTDIR)
[ -L ~/.zshrc ] && rm ~/.zshrc

# Git include
if ! grep -q dotfiles ~/.gitconfig; then
  echo -e "\n[include]\n    path = ~/dotfiles/git/.gitconfig" >> ~/.gitconfig
fi

# Ghostty symlink
ln -sf ~/dotfiles/ghostty ~/.config/ghostty

# Starship symlink
ln -sf ~/dotfiles/starship.toml ~/.config/starship.toml

# Lazygit symlink
mkdir -p ~/Library/Application\ Support/lazygit
ln -sf ~/dotfiles/lazygit/config.yaml \
~/Library/Application\ Support/lazygit/config.yaml

echo "Dotfiles installed."
