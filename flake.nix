{

  description = "";

  inputs = {

    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-24.05";
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

      specialArgs = {
        system = "x86_64-linux";
      };

      modules = [
        disko.nixosModules.disko
        ./hosts/hyper-v-vm/configuration.nix
      ];

    };

  };

}