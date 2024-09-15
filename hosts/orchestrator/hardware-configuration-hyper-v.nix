# Hyper-V Hardware Configuration for the Orchestrator
{ config, lib, pkgs, modulesPath, ... }: {

  # Import other modules
  imports = [ ];

  # Define the options for the hardware configuration
  options = {
    
  };

  # Define the hardware configuration
  config = {

    boot.initrd.availableKernelModules = [ "ata_piix" "floppy" "sd_mod" "sr_mod" ];
    boot.initrd.kernelModules = [ ];
    boot.kernelModules = [ ];
    boot.extraModulePackages = [ ]; 

    networking.useDHCP = lib.mkDefault true;

    nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
    virtualisation.hypervGuest.enable = true;

  };

}