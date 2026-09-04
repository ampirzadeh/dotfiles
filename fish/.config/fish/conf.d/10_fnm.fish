set -gx PATH $PATH "$HOME/.local/share/fnm"

fnm env --use-on-cd --shell fish | source
