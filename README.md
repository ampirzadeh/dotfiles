# My dotfiles!

## Stow everything
```bash
stow -S alacritty backgrounds bash bat ghostty hypr i3 kitty neovide nvim rofi screenlayout waybar yazi --target="$HOME"
```

- [Ghostty](https://ghostty.org/) as a terminal emulator
- [Hyprland](https://hyprland.org/) as the window manager
- [Neovim](https://neovim.io/) text editor
- [Yazi](https://yazi-rs.github.io/) as your file manager

## Aliases and useful functions:

`man`, `help`, and `cat` use `bat` by default.

`cd` uses `zoxide` by default.

Yay helpers to use fzf to search and find packages
```bash
yS # short for yay -S for installing new packages
yR # short for yay -R for uninstalling existing packages
```

Colourful help page with
```bash
help ls # instead of ls --help
```

Fuzzy finding and file management
```bash
y # opens yazi with bat preview
```

- `Ctrl+r` to go through terminal history
- `Ctrl+t` shortcut for `**<tab>`
- `Alt+c` Fuzzy find directories and cd there
