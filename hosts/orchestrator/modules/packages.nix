# Packages configuration for the Orchestrator
{ config, lib, pkgs, modulesPath, ... }: {

  # Import additional modules
  imports = [ ];

  # Define options for the module
  options = { };

  # Define configuration for the module
  config = {

    # Description: Global configuration for Nixpkgs
    # Type: Attribute Set
    nixpkgs.config = {

      # Description: Whether to allow unfree packages
      # Type: Boolean
      allowUnfree = false;
    
    };

    # Description: The set of packages that appear in /run/current-system/sw
    # Type: List
    environment.systemPackages = with pkgs; [

      git
      helm

    ];

    # Description: List of primary font packages
    # Type: List
    fonts.packages = with pkgs; [

    ];

  };

}