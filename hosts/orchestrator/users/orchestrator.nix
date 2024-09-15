# User configuration for the 'orchestrator' user
{ config, lib, pkgs, modulesPath, inputs, ... }: {

  # Description: Define options for the user's home
  # Type: Attribute Set
  home = {

    username = "orchestrator";

    homeDirectory = "/home/orchestrator";

    stateVersion = "24.05";

  };

}