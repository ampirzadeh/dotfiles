{ pkgs, ... }:
{
  home.packages = with pkgs; [
    miniserve

    swaynotificationcenter
    libnotify

    overskride
    hyprshot

    # look into 7z as an alternative
    zip
    unzip

    fish
    starship
    ripgrep
    fd
    jq
    eza
    zoxide
    fzf
    tree
    bat

    ffmpeg
    vlc

    brave
    ghostty
    nautilus
    rofi

    # neovim
    # neovide
    source-code-pro

    gh
    lazygit

    (fenix.complete.withComponents [
      "cargo"
      "clippy"
      "rust-src"
      "rustc"
      "rustfmt"
    ])

    # Language Servers
    nil # nix
    rust-analyzer-nightly # rust
    lua-language-server # lua
    typescript-language-server # typescript, javascript, tsx, jsx
    vscode-langservers-extracted # css
    gopls # go

    nodejs

    python3

    go

    gcc # TODO: check
    zig

    lua51Packages.lua
    luarocks

    cliphist
    wl-clipboard
    wl-clip-persist
  ];
}
