# User configuration for the 'node' user
{ config, lib, pkgs, modulesPath, inputs, ... }: {

  # Description: Import additional modules
  # Type: List of paths
  imports = [ ];

  # Description: Define options for the module
  # Type: Attribute Set
  options = { };

  # Description: Define configuration for the module
  # Type: Attribute Set
  config = { 

    # Description: Define options for the user's home
    # Type: Attribute Set
    home = {

      # Description: The user's username
      # Type: String
      username = "node";

      # Description: The user's home directory
      # Type: String
      homeDirectory = "/home/node";

      # Description: The state version indicates which default settings are in effect and will therefore help avoid breaking program configurations
      # Type: String
      stateVersion = "24.05";

    };

  };

}