{ pkgs, ... }:
{
  home.packages = with pkgs; [
    miniserve

    opencode

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

    source-code-pro

    gh
    lazygit

    (fenix.combine [
      (fenix.complete.withComponents [
        "cargo"
        "clippy"
        "rust-src"
        "rustc"
        "rustfmt"
      ])
      (fenix.targets.wasm32-unknown-unknown.latest.withComponents [
        "rust-std"
      ])
    ])
    cargo-generate
    trunk

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
