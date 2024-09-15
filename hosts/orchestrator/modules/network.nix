# Network configuration for the Orchestrator
{ config, lib, pkgs, modulesPath, inputs, ... }: {

  # Import additional modules
  imports = [ ];

  # Define options for the module
  options = { };

  # Define configuration for the module
  config = {

    # Description: The name of the machine
    # Type: String matching pattern ^$|^[[:alnum:]]([[:alnum:]_-]{0,61}[[:alnum:]])?$
    networking.hostName = "orchestrator";

  };

}