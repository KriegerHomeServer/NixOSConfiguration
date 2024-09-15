# User configuration for the 'orchestrator' user
{ config, lib, pkgs, modulesPath, inputs, ... }: {

  # Import additional modules
  imports = [ ];

  # Define options for the module
  options = { };

  # Define configuration for the module
  config = { 

    # Description: Define options for the user's home
    # Type: Attribute Set
    home = {

      username = "orchestrator";

      homeDirectory = "/home/orchestrator";

      stateVersion = "24.05";

    };

  };

}