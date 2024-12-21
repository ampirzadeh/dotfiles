# My dotfiles!

```bash
# Run stow like
stow -S alacritty bash bat i3 kitty neovide nvim rofi screenlayout yazi --target="$HOME"
```

- [Alacritty](https://alacritty.org/) as a terminal emulator
- [i3](https://i3wm.org/) as the window manager
- [Neovim](https://neovim.io/) text editor with [Neovide](https://neovide.dev/) gui
- [Yazi](https://yazi-rs.github.io/) as your file manager

## Aliases and useful functions:

Yay helpers
Use fzf to search and find AUR packages
```bash
yS # short for yay -S for installing new packages
yR # short for yay -R for uninstalling existing packages

```

`man`, `help`, and `cat` use `bat` by default.
