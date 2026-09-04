# string match -q "$TERM_PROGRAM" "kiro" and . (kiro --locate-shell-integration-path fish)

# Environment
set -gx MANPAGER "sh -c 'sed -u -e \"s/\\x1B\[[0-9;]*m//g; s/.\\x08//g\" | bat -p -lman'"

set -gx PATH $PATH "$HOME/.local/zed.app/bin"

# >>> oh-my-opencode-slim background subagents >>>
set -gx OPENCODE_EXPERIMENTAL_BACKGROUND_SUBAGENTS true
# <<< oh-my-opencode-slim background subagents <<<

# bat
abbr -a cat 'bat'
abbr -a bathelp 'bat --plain --language=help'
abbr -a --position anywhere -- --help '--help | bat -plhelp'
abbr -a --position anywhere -- -h '-h | bat -plhelp'

# eza
# https://gist.github.com/AppleBoiy/04a249b6f64fd0fe1744aff759a0563b
abbr -a ls 'eza --color=always --group-directories-first --icons'
abbr -a ll 'eza -la --icons --octal-permissions --group-directories-first'
abbr -a l 'eza -bGF --oneline --header --git --color=always --group-directories-first --icons'
abbr -a la 'eza --long --all --group --group-directories-first'
abbr -a lx 'eza -lbhHigUmuSa@ --time-style=long-iso --git --color-scale --color=always --group-directories-first --icons'
abbr -a lt 'eza --tree --level=2 --color=always --group-directories-first --icons'

# miniserve
abbr -a s "miniserve ."

# projects
abbr -a so "code ~/Desktop/so-portal.code-workspace"
abbr -a k "kiro ~/Desktop/so-portal.code-workspace"
abbr -a z "zed ~/Projects/unicard-static-modules ~/Projects/unicard-static-content ~/Projects/unicard-static-web"

# nx monorepo
abbr -a build "./node_modules/.bin/nx run-many --target=build --all --exclude=unicard-storybook --parallel=1"
abbr -a test "./node_modules/.bin/nx run-many --target=test --all --exclude=unicard-storybook --parallel=1 --no-watch"
abbr -a lint "./node_modules/.bin/nx run-many --target=lint --all --exclude=unicard-storybook --parallel=1 --no-watch"
