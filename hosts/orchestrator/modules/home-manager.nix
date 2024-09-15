# Home-Manager configuration for the Orchestrator
{ config, lib, pkgs, modulesPath, inputs, ... }: {

  # Import additional modules
  imports = [
    inputs.home-manager.nixosModules.default
  ];

  # Define options for the module
  options = { };

  # Define configuration for the module
  config = { 

    # Description: Define options for the home-manager module
    # Type: Attribute Set
    home-manager = {

      # Description: Define arguments to pass to the imported modules
      # Type: Attribute Set
      specialArgs = {

         # Include the inputs provided by the flake
        inherit inputs;

      };

      # Description: Define the configurations for each user
      # Type: Attribute Set
      users = {

        # Description: Define the orchestrator user
        # Type: import path
        orchestrator = import ../users/orchestrator.nix;

      };

    };

  };

}