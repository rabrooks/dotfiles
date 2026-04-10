# Pure zsh prompt — replaces Starship
# Toggle back to starship by swapping the source line in .zshrc

autoload -Uz vcs_info add-zsh-hook

# --- Git integration via vcs_info ---
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' stagedstr '%F{green}+%f'
zstyle ':vcs_info:*' unstagedstr '%F{yellow}*%f'
zstyle ':vcs_info:git:*' formats ' %F{magenta}%b%f%c%u'
zstyle ':vcs_info:git:*' actionformats ' %F{magenta}%b%f%c%u %F{red}(%a)%f'

# --- Command duration tracking ---
_prompt_timer=0

_prompt_preexec() {
  _prompt_timer=$EPOCHREALTIME
}

_prompt_precmd() {
  # Duration
  if (( _prompt_timer > 0 )); then
    local elapsed=$(( EPOCHREALTIME - _prompt_timer ))
    if (( elapsed >= 2 )); then
      if (( elapsed >= 60 )); then
        _prompt_duration=" %F{yellow}$(( ${elapsed%.*} / 60 ))m$(( ${elapsed%.*} % 60 ))s%f"
      else
        _prompt_duration=" %F{yellow}${elapsed%.*}s%f"
      fi
    else
      _prompt_duration=""
    fi
    _prompt_timer=0
  else
    _prompt_duration=""
  fi

  # Git info
  vcs_info

  # AWS context
  if [[ -n $AWS_PROFILE ]]; then
    local region=${AWS_REGION:-$AWS_DEFAULT_REGION}
    _prompt_aws=" %F{blue}aws:${AWS_PROFILE}${region:+($region)}%f"
  else
    _prompt_aws=""
  fi
}

add-zsh-hook preexec _prompt_preexec
add-zsh-hook precmd _prompt_precmd

# --- Vi mode cursor + symbol ---
_prompt_vim_mode='❯'

zle-keymap-select() {
  case $KEYMAP in
    vicmd)
      _prompt_vim_mode='❮'
      printf '\e[2 q'  # block cursor
      ;;
    viins|main)
      _prompt_vim_mode='❯'
      printf '\e[6 q'  # beam cursor
      ;;
  esac
  zle reset-prompt
}

zle-line-init() {
  _prompt_vim_mode='❯'
  printf '\e[6 q'  # beam cursor on new line
}

zle -N zle-keymap-select
zle -N zle-line-init

# --- Prompt char color based on last exit code ---
_prompt_char() {
  echo "%(?.%F{green}.%F{red})${_prompt_vim_mode}%f"
}

# --- Assemble prompt ---
setopt PROMPT_SUBST

# Left: directory + git branch/state + newline + prompt char
PROMPT='
%F{blue}%~%f${vcs_info_msg_0_}
$(_prompt_char) '

# Right: duration + aws
RPROMPT='${_prompt_duration}${_prompt_aws}'

# --- Transient prompt (collapse after execution) ---
_prompt_accept_line() {
  # Replace the full prompt with just the char before executing
  PROMPT='%F{green}❯%f '
  RPROMPT=''
  zle reset-prompt

  # Restore full prompt for next command
  PROMPT='
%F{blue}%~%f${vcs_info_msg_0_}
$(_prompt_char) '
  RPROMPT='${_prompt_duration}${_prompt_aws}'

  zle accept-line
}
zle -N _prompt_accept_line
bindkey '^M' _prompt_accept_line
