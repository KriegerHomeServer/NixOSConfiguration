# Configuration for the Orchestrator
{ config, lib, pkgs, modulesPath, inputs, ... }: {

  # Import additional modules
  imports = [
    ./hardware-configuration-hyper-v.nix
    ./modules/bootloader.nix
    ./modules/home-manager.nix
    ./modules/network.nix
    ./modules/packages.nix
    ./modules/system.nix
    ./modules/users.nix
  ];

  # Define options for the module
  options = { };

  # Define configuration for the module
  config = { };

}