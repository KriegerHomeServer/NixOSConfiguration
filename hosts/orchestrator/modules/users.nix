# Users configuration for the Orchestrator
{ config, lib, pkgs, modulesPath, inputs, ... }: {

  # Import additional modules
  imports = [ ];

  # Define options for the module
  options = { };

  # Define configuration for the module
  config = { 

    # Description: Define options for the orchestrator user
    # Type: Attribute Set
    users.users.orchestrator = {

      # Description: The account UID
      # Type: Integer
      uid = 1000;

      # Description: The name of the user account
      # Type: String
      name = "orchestrator";

      # Description: A short description of the user account, typically the user’s full name
      # Type: String
      description = "Orchestrator";

      # Description: Specifies the initial password for the user, i.e. the password assigned if the user does not already exist
      # Type: String
      initialPassword = "changeit";

      # Description: Indicates whether this is an account for a “real” user
      # Type: Boolean
      isNormalUser = true;

      # Description: The path to the user’s shell
      # Type: Null or Package or String
      shell = "/bin/bash";

    };

  };

}