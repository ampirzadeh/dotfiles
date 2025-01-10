# Path to your oh-my-bash installation.
export OSH="$HOME/.oh-my-bash"
OSH_THEME="rr" # pzq, rr, lambda
completions=(
  git
  ssh
)
plugins=(
  git
)
source "$OSH"/oh-my-bash.sh

alias yS='yay -Sql | fzf --multi --preview "yay -Si {}" | xargs -ro yay -S'
alias yR='yay -Qqe | fzf --multi --preview "yay -Si {}" | xargs -ro yay -R'
alias ide='neovide . && exit'

alias cat='bat'
export MANPAGER="sh -c 'sed -u -e \"s/\\x1B\[[0-9;]*m//g; s/.\\x08//g\" | bat -p -lman'"
export MANROFFOPT="-c"

eval "$(fzf --bash)"
function y() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
  yazi "$@" --cwd-file="$tmp"
  if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
    builtin cd -- "$cwd"
  fi
  rm -f -- "$tmp"
}

eval "$(zoxide init bash --cmd cd)"

export TERMINAL="ghostty"
export EDITOR="nvim"
export SUDO_EDITOR="$EDITOR"
alias vi="nvim"
alias vim="nvim"

export FZF_DEFAULT_OPTS=" \
  --color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
  --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
  --color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
  --color=selected-bg:#45475a \
  --multi"

