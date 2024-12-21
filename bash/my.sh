alias yS='yay -Sql | fzf --multi --preview "yay -Si {}" | xargs -ro yay -S'
alias yR='yay -Qqe | fzf --multi --preview "yay -Si {}" | xargs -ro yay -R'
alias ide='neovide . && exit'

alias cat='bat'
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export MANROFFOPT="-c"
alias bathelp='bat --plain --language=help'
help() {
  "$@" --help 2>&1 | bathelp
}

eval "$(fzf --bash)"
function y() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
  yazi "$@" --cwd-file="$tmp"
  if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
    builtin cd -- "$cwd"
  fi
  rm -f -- "$tmp"
}

eval "$(zoxide init bash)"
alias cd="z"

export TERMINAL="kitty"
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

