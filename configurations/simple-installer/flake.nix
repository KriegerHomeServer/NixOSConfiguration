{

  description = "";

  inputs = {

    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-24.05";
    };

    nixos-generators = {
      url = "github:nix-community/nixos-generators";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = { self, nixpkgs, nixos-generators, ... }@inputs: 
  let 
  
    # Defines the system architecture
    system = "x86_64-linux"; 
  
    # Defines the nixpkgs instance
    pkgs = nixpkgs.legacyPackages.${system};

  in {

    # Description: Define the configurations for x86_64-linux
    # Type: Attribute Set
    packages.x86_64-linux = {

      # Description: Define the simple installer configuration
      # Type: Attribute Set
      simple-installer = nixos-generators.nixosGenerate {

        # Define the system architecture for the configuration
        inherit system;

        # Description: Define arguments to pass to the imported modules
        # Type: Attribute Set
        specialArgs = {
          
          # Include the nixpkgs instance
          inherit pkgs;

          # Include the inputs provided by the flake
          inherit inputs;
          
        };

        # Description: Import modules for the configuration
        # Type: List of Paths
        modules = [
          ./modules/default.nix
        ];

        # Description: Define the image format
        # Type: String
        format = "install-iso";

      };

    };

  };

}