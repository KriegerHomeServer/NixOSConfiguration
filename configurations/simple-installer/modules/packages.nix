# Packages configuration for the Simple Installer
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

      openssh

    ];

    # Description: List of primary font packages
    # Type: List
    fonts.packages = with pkgs; [

    ];

  };

}