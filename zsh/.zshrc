# Plugins
source ~/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.config/zsh/themes/powerlevel10k/powerlevel10k.zsh-theme
source ~/.config/zsh/.zsh_aliases
source ~/.config/zsh/.zshenv
source ~/.config/zsh/.zsh_local

source ~/.config/zsh/plugins/fzf-zsh-plugin/fzf-zsh-plugin.plugin.zsh

bindkey ^R history-incremental-search-backward
bindkey ^S history-incremental-search-forward

bindkey -v

# Initialization code that may require console input (password prompts, [y/n]

# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

function killport() {
  kill -9 $(lsof -ti $1)

}

function findWord() {
  find . -type f -exec grep --color=always $1 {} ';'
}
