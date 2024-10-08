{

  description = "";

  inputs = {

    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-unstable";
    };

  };

  outputs = { self, nixpkgs, ... }@inputs: 
  let 
  
    # Defines the system architecture
    system = "x86_64-linux"; 
  
    # Defines the nixpkgs instance
    pkgs = nixpkgs.legacyPackages.${system};

  in {

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
    ];

  };

}