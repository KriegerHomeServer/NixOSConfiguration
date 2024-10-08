# Configuration for a k3s cluster node
{ config, lib, pkgs, modulesPath, inputs, ... }: {

  # Description: Import additional modules
  # Type: List of paths
  imports = [
    ./bootloader.nix
    ./disko.nix
    ./home-manager.nix
    ./k3s.nix
    ./network.nix
    ./nfs.nix
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