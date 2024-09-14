{

  description = "";

  inputs = {

    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-23.11";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = { self, nixpkgs, home-manager, nixvim, disko, ... }@inputs: {

    nixosConfigurations.hyper-v-vm = nixpkgs.lib.nixosSystem {

      system = "x86_64-linux";

      nix.settings.experimental-features = [ "nix-command" "flakes" ];

      modules = [
        ./hosts/hyper-v-vm/configuration.nix
        ./modules/packages.nix
      ];

    };

  };

}