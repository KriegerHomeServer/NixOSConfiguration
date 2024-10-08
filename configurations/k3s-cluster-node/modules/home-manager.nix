# Home-Manager configuration for a k3s cluster node
{ config, lib, pkgs, modulesPath, inputs, ... }: {

  # Description: Import additional modules
  # Type: List of paths
  imports = [
    inputs.home-manager.nixosModules.default
  ];

  # Description: Define options for the module
  # Type: Attribute Set
  options = { };

  # Description: Define configuration for the module
  # Type: Attribute Set
  config = { 

    # Description: Define options for the home-manager module
    # Type: Attribute Set
    home-manager = {

      # Description: Define arguments to pass to the imported modules
      # Type: Attribute Set
      extraSpecialArgs = {

         # Include the inputs provided by the flake
        inherit inputs;

      };

      # Description: Define the configurations for each user
      # Type: Attribute Set
      users = {

        # Description: Define the node user
        # Type: import path
        node = import ../users/node.nix;

      };

    };

  };

}