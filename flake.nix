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

    nixosConfigurations.orchestrator-hyper-v = nixpkgs.lib.nixosSystem {

      specialArgs = {
        
        inherit inputs;
        
        system = "x86_64-linux";

        config.orchestrator.hardware-configuration = "hyper-v";

      };

      modules = [
        ./hosts/orchestrator/configuration.nix
      ];

    };

  };

}