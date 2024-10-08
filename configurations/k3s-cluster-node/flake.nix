{

  description = "";

  inputs = {

    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-unstable";
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = { self, nixpkgs, home-manager, disko, ... }@inputs: 
  let 
  
    # Defines the system architecture
    system = "x86_64-linux"; 
  
    # Defines the nixpkgs instance
    pkgs = nixpkgs.legacyPackages.${system};

  in {

    # Description: Define a server node configuration on a Hyper-V platform
    # Type: Attribute Set
    nixosConfigurations.server-hyper-v-guest = nixpkgs.lib.nixosSystem {

      # Description: Define the system architecture for the configuration
      inherit system;

      # Description: Define arguments to pass to the imported modules
      # Type: Attribute Set
      specialArgs = {
        
        # Description: Include the nixpkgs instance
        inherit pkgs;

        # Description: Include the inputs provided by the flake
        inherit inputs;
        
      };

      # Description: Import modules for the configuration
      # Type: List of Paths
      modules = [
        ./modules/default.nix
        ./hardware/hyper-v-guest.nix
      ];

    };

  };

}