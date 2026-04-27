{
  description = "My Home Manager configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    fenix = {
      url = "github:nix-community/fenix/monthly";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim.url = "github:nix-community/nixvim/nixos-25.11"; # TODO
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      nixvim,
      ...
    }@inputs:
    let
      _lib = nixpkgs.lib;
      system = "x86_64-linux";
      overlays = [
        inputs.neovim-nightly-overlay.overlays.default
        inputs.fenix.overlays.default
      ];
      pkgs = import nixpkgs {
        inherit system overlays;
      };
    in
    {
      services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
      };

      homeConfigurations = {
        amir = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;

          modules = [
            nixvim.homeModules.nixvim
            ./home.nix
          ];
        };
      };
    };
}
