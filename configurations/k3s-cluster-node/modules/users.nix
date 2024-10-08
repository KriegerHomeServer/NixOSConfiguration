# Users configuration for a k3s cluster node
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

    # Description: Define options for the node user
    # Type: Attribute Set
    users.users.node = {

      # Description: The account UID
      # Type: Integer
      uid = 1000;

      # Description: The name of the user account
      # Type: String
      name = "node";

      # Description: A short description of the user account, typically the user’s full name
      # Type: String
      description = "node";

      # Description: Indicates whether this is an account for a “real” user
      # Type: Boolean
      isNormalUser = true;

      # Description: The user’s auxiliary groups
      # Type: List of Strings
      extraGroups = [ 
        "networkmanager"
        "wheel"
      ];

      # Description: Specifies the initial password for the user
      # Type: String
      initialPassword = "changeit";

    };

  };

}