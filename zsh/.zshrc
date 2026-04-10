# Homebrew setup — must be first so brew-installed tools (starship, fzf, etc.) are in PATH.
# Set manually instead of `brew shellenv` which calls path_helper and reshuffles
# /usr/bin ahead of /opt/homebrew/bin.
export HOMEBREW_PREFIX="/opt/homebrew"
export HOMEBREW_CELLAR="/opt/homebrew/Cellar"
export HOMEBREW_REPOSITORY="/opt/homebrew"
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"

source ~/.config/zsh/.zsh_aliases
source ~/.config/zsh/.zsh_local

# Vi mode must come before custom keybindings (it resets them)
bindkey -v
bindkey ^R history-incremental-search-backward
bindkey ^S history-incremental-search-forward

# Disable terminal title updates in tmux
if [[ -n "$TMUX" ]]; then
    export DISABLE_AUTO_TITLE="true"
fi

# eval "$(starship init zsh)"  # Toggle: uncomment to switch back to Starship
source ~/.config/zsh/prompt.zsh

# FZF with fd
source <(fzf --zsh)

fzf_compgen_path() {
  fd --exclude .git --follow --hidden . "$1"
}

fzf_compgen_dir() {
  fd --exclude .git --follow --hidden --type=d . "$1"
}

FZF_ALT_C_COMMAND="fd --type d --exclude .git --follow --hidden"
FZF_DEFAULT_COMMAND="fd --type f --exclude .git --follow --hidden"
FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Misc Functions
function killport() {
  local pids=$(lsof -ti :$1)
  if [[ -n "$pids" ]]; then
    echo "$pids" | xargs kill -9
  else
    echo "No process found on port $1"
  fi
}

function findWord() {
  find . -type f -exec grep --color=always $1 {} ';'
}

# NVM — lazy loaded for faster shell startup
export NVM_DIR="$HOME/.nvm"
nvm() {
  unfunction nvm
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
  nvm "$@"
}
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null && eval "$(pyenv init -)"

# Cargo
[ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"

[ -f "$HOME/.local/bin/env" ] && . "$HOME/.local/bin/env"
export PATH="$HOME/.local/bin:$PATH"
export PATH="/opt/homebrew/opt/openjdk@17/bin:$PATH"

# Final PATH ordering — these go last so they take priority
export PATH="$HOME/.pyenv/shims:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"
