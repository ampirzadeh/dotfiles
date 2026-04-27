{ ... }:
{
  imports = [
    ./modules/packages.nix
    ./modules/git.nix
    ./modules/shell.nix
    ./modules/neovim/default.nix
    ./modules/system.nix
    ./modules/hyprland.nix
  ];

  home = {
    username = "amir";
    homeDirectory = "/home/amir";

    # You do not need to change this if you're reading this in the future.
    # Don't ever change this after the first build.  Don't ask questions.
    stateVersion = "25.11";
  };
}
