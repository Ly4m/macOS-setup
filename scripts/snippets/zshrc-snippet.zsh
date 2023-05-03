export ZSH="$HOME/.oh-my-zsh"

# Plugins
plugins=( git zsh-autosuggestions zsh-syntax-highlighting )

# Load Oh My Zsh if not already loaded
if ! typeset -f omz >/dev/null 2>&1; then
  [[ -f "$ZSH/oh-my-zsh.sh" ]] && source "$ZSH/oh-my-zsh.sh"
fi

# -- ZOXIDE --
eval "$(zoxide init zsh)"

# ---- EZA -----
alias ls="eza --icons"
alias lt="eza -T -L 2 --icons --git-ignore"
alias ll="eza -l -a --icons --no-permissions --no-user --no-time --no-filesize --git "

# ---- FZF ----
source <(fzf --zsh)

export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

export FZF_DEFAULT_OPTS="--style full"

export FZF_CTRL_T_OPTS="
  --walker-skip .git,node_modules,target
  --style full
  --preview 'bat -n --color=always --line-range :100 {}'"

export FZF_CTRL_R_OPTS="
  --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
  --color header:italic
  --style full"

_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}

_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}

# ---- Starship ---
eval "$(starship init zsh)"


# --- FNM ---
eval "$(fnm env --use-on-cd --shell zsh)"

