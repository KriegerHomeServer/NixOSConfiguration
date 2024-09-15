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

  outputs = { self, nixpkgs, home-manager, nixvim, disko, ... }@inputs: 
  let 
  
    # Defines the system architecture
    system = "x86_64-linux"; 
  
    # Defines the nixpkgs instance
    pkgs = nixpkgs.legacyPackages.${system};

  in {

    # Define the orchestrator configuration
    nixosConfigurations.orchestrator-hyper-v = nixpkgs.lib.nixosSystem {

      # Define the system architecture for the configuration
      inherit system;

      # Define arguments to pass to the imported modules
      specialArgs = {
        
        # Include the nixpkgs instance
        inherit pkgs;

        # Include the inputs provided by the flake
        inherit inputs;
        
      };

      # Import modules for the configuration
      modules = [
        ./hosts/orchestrator/configuration-hyper-v.nix
      ];

    };

  };

}