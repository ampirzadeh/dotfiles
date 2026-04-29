{
  description = "My Home Manager configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    fenix = {
      url = "github:nix-community/fenix/monthly";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    amir-nixvim = {
      # url = "path:/home/amir/Projects/neovim";
      url = "github:ampirzadeh/nvim-config/flake";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.nixvim.inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      amir-nixvim,
      ...
    }@inputs:
    let
      _lib = nixpkgs.lib;
      system = "x86_64-linux";
      overlays = [
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
            amir-nixvim.homeManagerModules.default
            ./home.nix
          ];
        };
      };
    };
}
