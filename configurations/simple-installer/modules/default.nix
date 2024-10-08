# Configuration for the Simple Installer
{ config, lib, pkgs, modulesPath, inputs, ... }: {

  # Description: Import additional modules
  # Type: List of paths
  imports = [
    ./network.nix
    ./packages.nix
    ./system.nix
    ./users.nix
  ];

  # Description: Define options for the module
  # Type: Attribute Set
  options = { };

  # Description: Define configuration for the module
  # Type: Attribute Set
  config = { };

}