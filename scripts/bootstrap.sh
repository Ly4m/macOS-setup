#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
BREW_DIR="${ROOT_DIR}/brew"
BREWFILE_CORE="${BREW_DIR}/Brewfile"
section() { printf "\n==> %s\n" "$*"; }

ensure_brew() {
    if ! command -v brew >/dev/null 2 >&1; then
        section "Installing Homebrew"
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        # Add to shell (Apple Silicon default path)
        if [ -x /opt/homebrew/bin/brew ]; then
            echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >>"${HOME}/.zprofile"
            eval "$(/opt/homebrew/bin/brew shellenv)"
        fi
    fi
}

bundle() {
    local file="$1"
    [ -f "$file" ] || { echo "Missing $file"; exit 1; }
    section "brew bundle --file=$file"
    brew bundle --file="$file"
}

main() {
    ensure_brew

    # always install core
    bundle "$BREWFILE_CORE"

    # optional themed files
    [[ -f "${BREW_DIR}/ops.Brewfile" ]] && bundle "${BREW_DIR}/ops.Brewfile"
}

main "$@"