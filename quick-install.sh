#!/usr/bin/env bash
set -euo pipefail

# =================== styling & helpers ===================
bold() { tput bold 2 >/dev/null || true; }
norm() { tput sgr0 2 >/dev/null || true; }
green() { tput setaf 2 2 >/dev/null || true; }
yellow() { tput setaf 3 2 >/dev/null || true; }
blue() { tput setaf 4 2 >/dev/null || true; }
red() { tput setaf 1 2 >/dev/null || true; }

say() { printf "%s\n" "$*"; }
section() { printf "\n%s==> %s%s\n" "$(bold)$(blue)" "$*" "$(norm)"; }
info() { printf "%sℹ %s%s\n" "$(blue)" "$*" "$(norm)"; }
ok() { printf "%s✔ %s%s\n" "$(green)" "$*" "$(norm)"; }
warn() { printf "%s⚠ %s%s\n" "$(yellow)" "$*" "$(norm)"; }
err() { printf "%s✖ %s%s\n" "$(red)" "$*" "$(norm)"; }

confirm() {
  # usage: confirm "Question?" [default=N]
  local q="${1:-Are you sure?}" def="${2:-N}" ans
  read -r -p "$(printf "%s%s (y/N): %s" "$(bold)" "$q" "$(norm)")" ans || true
  ans="${ans:-$def}"
  [[ "$ans" =~ ^[Yy]$ ]]
}

backup_file() {
  local f="$1" ts; ts="$(date +%Y%m%d-%H%M%S)"
  [[ -s "$f" ]] && cp -r "$f" "$f.bak.$ts" && info "Backup: $f.bak.$ts"
}

require_cmd() {
  local c="$1"
  command -v "$c" >/dev/null 2 >&1 || { err "Missing command: $c"; exit 1; }
}

# BSD/GNU friendly sed inline (creates .bak once)
sedi() {
  # sedi "pattern" file
  sed -i.bak "$1" "$2"
}

# =================== paths ===================
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BOOTSTRAP_SCRIPT="${ROOT_DIR}/scripts/bootstrap.sh"
SNIPPET_FILE="${ROOT_DIR}/scripts/snippets/zshrc-snippet.zsh"
DOT="$ROOT_DIR/dotfiles"
ZSHRC_FILE="${HOME}/.zshrc"
ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

# =================== preflight ===================
require_cmd curl
require_cmd git

section "Bootstrap with Homebrew (if present)"
if [[ -f "$BOOTSTRAP_SCRIPT" ]]; then
  bash "$BOOTSTRAP_SCRIPT"
else
  warn "No bootstrap script at $BOOTSTRAP_SCRIPT (skipping)"
fi

# =================== oh-my-zsh ===================
section "oh-my-zsh"
if [[ -d "$HOME/.oh-my-zsh" ]]; then
  ok "oh-my-zsh already installed"
else
  info "Installing oh-my-zsh (non-interactive)"
  RUNZSH=no CHSH=no KEEP_ZSHRC=yes \
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi
mkdir -p "$ZSH_CUSTOM/plugins"

# =================== plugins (DRY) ===================
ensure_plugin() {
  local repo="$1"
  local name="${2:-${repo##*/}}"
  local dir="$ZSH_CUSTOM/plugins/$name"

  if [[ -d "$dir" ]]; then
    (git -C "$dir" pull --ff-only >/dev/null 2>&1 && ok "Updated $name") || warn "Could not update $name (network?)"
  else
    git clone --depth 1 "https://github.com/$repo" "$dir" >/dev/null 2>&1 && ok "Installed $name"
  fi
}

section "Ensuring zsh plugins"
ensure_plugin "zsh-users/zsh-autosuggestions"
ensure_plugin "zsh-users/zsh-syntax-highlighting"

# =================== zshrc handling (simple overwrite) ===================
[[ -r "$SNIPPET_FILE" ]] || { err "Snippet not found: $SNIPPET_FILE"; exit 1; }
touch "$ZSHRC_FILE"

section "Configure ${ZSHRC_FILE}"
if confirm "Overwrite ~/.zshrc with the new configuration?" "N"; then
  backup_file "$ZSHRC_FILE"
  cp "$SNIPPET_FILE" "$ZSHRC_FILE"
  ok "Overwritten $ZSHRC_FILE"
else
  warn "Skipped overwrite. No changes made to $ZSHRC_FILE."
fi

# =================== Neovim config (optional) ===================
section "Neovim setup"
if confirm "Install NvChad for Neovim?" "N"; then
  backup_file "$HOME/.config/nvim"
  backup_file "$HOME/.local/share/nvim"
  backup_file "$HOME/.cache/nvim"
  rm -rf "$HOME/.config/nvim"
  rm -rf "$HOME/.local/share/nvim"
  rm -rf "$HOME/.cache/nvim"
  git clone --depth 1 https://github.com/NvChad/starter "$HOME/.config/nvim" >/dev/null 2>&1 && ok "NvChad installed"
  rm -rf "$HOME/.config/nvim/.git"
else
  info "Skipping NvChad"
fi

# =================== dotfiles ===================
section "Dotfiles"
if confirm "Importer dotfiles?" "N"; then
rsync -a --no-owner --no-group --no-perms \
  --exclude ".git/" --exclude ".DS_Store" \
  "$DOT/." "$HOME/"
echo "Dotfiles applied via rsync (no backup)."
else
  info "Skipping dotfiles"
fi

# =================== wrap up ===================
section "All set"
say "• Snippet: $SNIPPET_FILE"
say "• Zshrc  : $ZSHRC_FILE"
if confirm "Reload shell now (exec zsh)?" "Y"; then
  exec zsh
else
  say "Reload later with:  exec zsh"
fi
