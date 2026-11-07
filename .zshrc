# ---------- Core ----------
export EDITOR="nvim"
export VISUAL="nvim"
export LANG="en_US.UTF-8"
export OBSIDIAN_VAULT="$HOME/Library/Mobile Documents/iCloud~md~obsidian/Documents/ek-vault"

# History
HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000
SAVEHIST=50000
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt SHARE_HISTORY
setopt INC_APPEND_HISTORY
setopt EXTENDED_HISTORY

# Completion (compinit runs once, after all fpath changes — see "Completion init")
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
setopt AUTO_MENU
setopt COMPLETE_IN_WORD
setopt ALWAYS_TO_END

# ---------- Starship ----------
eval "$(starship init zsh)"

# ---------- Modern CLI ----------
alias l='eza --color=always --long --git --icons=always --group-directories-first -la'
alias ls="eza --icons --group-directories-first"
alias ll="eza -la --icons --group-directories-first --git"
alias la="eza -a --icons --group-directories-first"
alias tree="eza --tree --icons"

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

alias c="clear"
alias h="history"
alias reload="source ~/.zshrc"

# Obsidian
alias ov='cd "$OBSIDIAN_VAULT"'
alias on='nvim "$OBSIDIAN_VAULT"'
alias oo='open "obsidian://open?vault=ek-vault"'

# ---------- Git ----------
alias g="git"
alias gs="git status --short"
alias ga="git add"
alias gaa="git add ."
alias gc="git commit"
alias gcm="git commit -m"
alias gp="git push"
alias gpl="git pull"
alias gb="git branch"
alias gco="git checkout"
alias gd="git diff"
alias gl="git log --oneline --graph --decorate --all -20"

# ---------- Python / ML ----------
alias py="python3"
alias activate="source .venv/bin/activate"

export PYTHONDONTWRITEBYTECODE=1
export PYTHONUNBUFFERED=1

# uv, if installed
export UV_LINK_MODE=copy

# CUDA/MPS helpers
gpu() {
  python3 - <<'PY'
import torch
print('torch:', torch.__version__)
print('cuda:', torch.cuda.is_available())
print('mps:', hasattr(torch.backends, 'mps') and torch.backends.mps.is_available())
PY
}

# ---------- Navigation ----------
eval "$(zoxide init zsh --cmd cd)"

# ---------- fzf ----------
bindkey -e
source "$(brew --prefix fzf)/shell/key-bindings.zsh"

export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type d --hidden --strip-cwd-prefix --exclude .git"

# ---------- Plugins ----------
source "$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh"

# ---------- Better defaults ----------
export LESS="-R"
export BAT_THEME="ansi"

# ---------- Other aliases ------------
alias v="nvim"

# ---------- AI / Kubernetes / Herdr ----------
alias po="perry opencode"
alias pc="perry codex"
alias hw="herdr session attach work"
alias hp="herdr session attach personal"

export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# >>> grok installer >>>
export PATH="$HOME/.grok/bin:$PATH"
fpath=(~/.grok/completions/zsh $fpath)
# <<< grok installer <<<

# ---------- Completion init ----------
autoload -Uz compinit && compinit

# kubectl completion (cached: generating it on every start is slow)
if (( $+commands[kubectl] )); then
  _kubectl_comp="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/kubectl-completion.zsh"
  if [[ ! -s $_kubectl_comp || $commands[kubectl] -nt $_kubectl_comp ]]; then
    mkdir -p "${_kubectl_comp:h}"
    kubectl completion zsh > "$_kubectl_comp"
  fi
  source "$_kubectl_comp"
  unset _kubectl_comp
fi

# ---------- Local overrides ----------
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

# ---------- Syntax highlighting (must be last) ----------
source "$(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
