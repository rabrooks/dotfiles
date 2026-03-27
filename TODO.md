# Dotfiles TODO

## High Priority (Actively Broken)

- [x] `setup.sh:9,14` — Wrong dotfiles path (`~/.dotfiles` → `~/dotfiles`)
- [x] `setup.sh:5` — Broken iTerm2-Color-Schemes reference; color file lives at `iterm/colors/`
- [x] `setup.sh:14-15` — Wrong lazygit config filename (`config.yml` → `config.yaml`)
- [x] `zsh/.zshrc:53` — Broken cargo PATH (`$HOME/.cargo/env` is a script, not a directory); already sourced in `.zshenv`
- [x] `zsh/.zshenv:14` — Undefined `$NPM_BIN` in PATH adds empty segment
- [x] Refactored zsh loading: bootstrap `~/.zshenv` sets ZDOTDIR, removed `~/.zshrc` symlink and redundant `.zprofile`
- [x] `nvim/lua/abrooks/plugins/indent-blank-line.lua:16` — Duplicate `opts = {}` overrides exclude config

## Medium Priority (Suboptimal but functional)

- [ ] `zsh/.zshrc:43-48` — NVM and pyenv initialized in both `.zshenv` and `.zshrc`; consider consolidating
- [ ] `zsh/.zshrc:34-36` — `killport` function missing port argument validation
- [ ] `zsh/.zshrc:39-41` — `findWord` reimplements `grep -r`; consider replacing with ripgrep alias
- [ ] `brew-install.sh` — No error handling or idempotency checks
- [ ] `starship.toml` — Review for any deprecated config keys

## Low Priority (Nice to have)

- [ ] Add a Makefile or install script that automates symlink creation
- [ ] Add shellcheck to CI or pre-commit for shell scripts
- [ ] Consider XDG base directory compliance for all configs
- [ ] Document required Homebrew packages in README
