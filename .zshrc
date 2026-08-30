# ---------- Core ----------
export EDITOR="nvim"
export VISUAL="nvim"
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# History
HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000
SAVEHIST=50000
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt SHARE_HISTORY
setopt INC_APPEND_HISTORY
setopt EXTENDED_HISTORY

# Completion
autoload -Uz compinit
compinit

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
alias gpu="python3 - <<'PY'
import torch
print('torch:', torch.__version__)
print('cuda:', torch.cuda.is_available())
print('mps:', hasattr(torch.backends, 'mps') and torch.backends.mps.is_available())
PY"

# ---------- Navigation ----------
eval "$(zoxide init zsh)"

alias cd="z"

# ---------- fzf ----------
bindkey -e
source "$(brew --prefix fzf)/shell/key-bindings.zsh"

export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type d --hidden --strip-cwd-prefix --exclude .git"

# ---------- Plugins ----------
source "$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# ---------- Better defaults ----------
export LESS="-R"
export BAT_THEME="TwoDark"

# ---------- Local overrides ----------
[ -f ~/.zshrc.local ] && source ~/.zshrc.local


# ---------- Other aliases ------------
alias v="nvim"
