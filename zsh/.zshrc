source ~/.config/zsh/.zsh_aliases
source ~/.config/.zsh_local

bindkey ^R history-incremental-search-backward
bindkey ^S history-incremental-search-forward

bindkey -v

# Disable terminal title updates in tmux
if [[ -n "$TMUX" ]]; then
    export DISABLE_AUTO_TITLE="true"
fi

eval "$(starship init zsh)"


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
  kill -9 $(lsof -ti $1)

}

function findWord() {
  find . -type f -exec grep --color=always $1 {} ';'
}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

. "$HOME/.local/bin/env"
export PATH="$HOME/.local/bin:$PATH"
export PATH="/opt/homebrew/opt/openjdk@17/bin:$PATH"
