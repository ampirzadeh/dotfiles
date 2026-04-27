{ pkgs, ... }:
{
  imports = [
    ./keymaps.nix
    ./autocmds.nix
    ./options.nix
    ./ui.nix
    ./plugins/default.nix
  ];

  programs.nixvim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    package = pkgs.neovim;
    defaultEditor = true;
    nixpkgs.config.allowUnfree = true;
  };
}
